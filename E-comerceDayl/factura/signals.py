from paypal.standard.models import ST_PP_COMPLETED
from paypal.standard.ipn.signals import valid_ipn_received, invalid_ipn_received
from django.dispatch import receiver
from django.db.models.signals import post_save
from factura.models import Pedidos,Factura
from .paypal_tags import agregar_carrito
import json
import os
from django.conf import settings

@receiver(valid_ipn_received)
def valid_ipn_signal(sender, **kwargs):
  ipn_obj = sender
  if ipn_obj.payment_status == 'Completed':
    pedido = Pedidos.objects.get(id=ipn_obj.invoice)
    pedido.estado = True
    pedido.save()
        
@receiver(invalid_ipn_received)
def invalid_ipn_signal(sender, **kwargs):
  ipn_obj = sender
  if ipn_obj.payment_status == 'Completed':
    pedido = Pedidos.objects.get(id=ipn_obj.invoice)
    pedido.estado = True
    pedido.save()
    
@receiver(post_save, sender=Pedidos)
def pedido_modificar(sender,instance, *args, **kwargs):
  if instance.estado == True:
    ruta_json = os.path.join(settings.MEDIA_ROOT, instance.productos.name)
    with open(ruta_json, 'r') as archivo_json:
      contenido_json = archivo_json.read()
    productos_dict = json.loads(contenido_json)
    car_paypal = agregar_carrito(productos_dict)
    fact = Factura()
    fact.metodo_pago = instance.metodo_pago
    fact.total = car_paypal['total_carrito']
    fact.cliente = instance.cliente
    fact.estado = 'Pagado'
    fact.save()
  