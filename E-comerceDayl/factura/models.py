from django.db import models
from cliente.models import *

# Create your models here.
class MetodosPago(models.Model):
  nombre = models.CharField(help_text="Nombre del metodo de pago", max_length=100)
  
  def __str__(self):
    return f'{self.nombre}'

class Factura(models.Model):
  fecha_factura = models.DateTimeField()
  fecha_vencimiento = models.DateTimeField(null=True,blank=True)
  metodo_pago = models.ForeignKey(MetodosPago,on_delete=models.SET_NULL, null=True)
  total = models.DecimalField(max_digits=15,decimal_places=2,null=True)
  cliente = models.ForeignKey(Cliente, on_delete=models.SET_NULL, null=True)
  estado = models.CharField(max_length=30,help_text="Estado del pedido")
  
  def __str__(self):
    return f'{self.id} cliente {self.Cliente.nombre}'
  class Meta:
    db_table = 'Factura'

class DetalleFactura(models.Model):
  factura = models.ForeignKey(Factura,on_delete=models.SET_NULL, null=True)
  producto = models.ForeignKey(Producto,on_delete=models.SET_NULL, null=True)
  
  cantidad = models.IntegerField(help_text='Cantidad del producto')  
  iva = models.DecimalField(max_digits=5, decimal_places=2)
  precio_unitario = models.DecimalField(max_digits=10, decimal_places=2)
  oferta = models.DecimalField(max_digits=5, decimal_places=2, null=True, blank=True)
  
  def __str__(self):
    return f'{self.id} {self.factura.id}'
  class Meta:
    db_table = 'Detalle_factura'

