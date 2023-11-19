import time
from django.shortcuts import render, redirect
from django.contrib import messages
from django.urls import reverse
from producto.models import *
from .models import *
from cliente.models import Cliente
from django.conf import settings
from paypal.standard.forms import PayPalPaymentsForm
from buycar.carrito import *
from .paypal_tags import agregar_carrito
import json
from django.core.files.base import ContentFile
from paypal.standard.ipn.models import PayPalIPN
# Create your views here.

def detalle_compra(request):
  categorias = Categoria.objects.all()
  subcategorias = Subcategoria.objects.all()
  cliente = Cliente.objects.get(user_id = request.user.id)
  metodos = MetodosPago.objects.all()
  if 'metodo_pago' in request.POST:
    metodo_pago = MetodosPago.objects.get(id=request.POST['metodo_pago'])
    if request.session.get("carrito", {}) and request.user.is_authenticated:
        cliente = Cliente.objects.get(user_id=request.user.id)
        pedido = Pedidos(estado=False, cliente=cliente, situacion='En espera', metodo_pago=metodo_pago)
        pedido.save()
        productos_json = json.dumps(request.session.get("carrito", {}))
        pedido.productos.save(f'productos_{str(pedido.id)}.json', ContentFile(productos_json))
        request.session["carrito"] = {}
        return redirect('factura:pago_paypal',id_pedido=pedido.id)   
  context = {"categorias": categorias,"subcategorias": subcategorias,'cliente':cliente,'metodos':metodos}
  return render(request,'detalle_compra.html',context)

def pago_paypal(request, id_pedido):
  pedido = Pedidos.objects.get(id=id_pedido)
  ruta_json = os.path.join(settings.MEDIA_ROOT, pedido.productos.name)
  with open(ruta_json, 'r') as archivo_json:
    contenido_json = archivo_json.read()
  productos_dict = json.loads(contenido_json)
  host = request.get_host()
  car_paypal = agregar_carrito(productos_dict)
  paypal_dict = {
  'business': settings.PAYPAL_RECEIVER_EMAIL,
  'amount': car_paypal['total_carrito'],
  'item_name': 'Total del Carrito',
  'invoice': pedido.id,
  'currency_code': 'USD',
  'notify_url': f'http://{host}{reverse("paypal-ipn")}',
  'return_url': f'http://{host}{reverse("factura:paypal-return")}',
  'cancel_return': f'http://{host}{reverse("factura:paypal-cancel")}',
  'items': car_paypal['items_paypal'],
  }
  form = PayPalPaymentsForm(initial=paypal_dict)
  return render(request,'pago_paypal.html',{'form':form})

def paypal_return(request):
  messages.success(request, 'Payment Success')
  return redirect('index')
  
def paypal_cancel(request):
  messages.error(request,'Payment Cancelled')
  return redirect('index')

def mostrar_factura(request, id_factura):
  factura= Factura.objects.get(id = id_factura)
  cliente = Cliente.objects.get(id = factura.cliente.id)
  
  ruta_json = os.path.join(settings.MEDIA_ROOT, factura.pedido.productos.name)
  with open(ruta_json, 'r') as archivo_json:
    contenido_json = archivo_json.read()
     
  productos_dict = json.loads(contenido_json)
  print("ver aver", productos_dict)
  context = {
    'factura':factura,
    'productos':productos_dict.items(),
    'cliente': cliente
  }
  return render(request, 'factura.html', context )
  