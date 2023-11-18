from django.shortcuts import render, redirect
from django.contrib import messages
from django.urls import reverse
from producto.models import *
from .models import *
from cliente.models import Cliente
from django.conf import settings
from decimal import Decimal
from paypal.standard.forms import PayPalPaymentsForm
from buycar.carrito import *
from .paypal_tags import agregar_carrito
# Create your views here.

def detalle_compra(request):
  host = request.get_host()
  categorias = Categoria.objects.all()
  subcategorias = Subcategoria.objects.all()
  car_paypal = agregar_carrito(request)
  cliente = Cliente.objects.get(user_id = request.user.id)
  metodos = MetodosPago.objects.all()
  paypal_dict = {
    'business': settings.PAYPAL_RECEIVER_EMAIL,
    'amount': car_paypal['total_carrito'],
    'item_name': 'Total del Carrito',
    'invoice': '7',
    'currency_code': 'USD',
    'notify_url': f'http://{host}{reverse("paypal-ipn")}',
    'return_url': f'http://{host}{reverse("factura:paypal-return")}',
    'cancel_return': f'http://{host}{reverse("factura:paypal-cancel")}',
    'items': car_paypal['items_paypal'],
}
  form = PayPalPaymentsForm(initial=paypal_dict)
  context = {"categorias": categorias,"subcategorias": subcategorias,'form':form,'cliente':cliente,'metodos':metodos}
  return render(request,'detalle_compra.html',context)


def paypal_return(request):
  messages.success(request,'Payment Success')
  return redirect('index')

def paypal_cancel(request):
  messages.error(request,'Payment Cancelled')
  return redirect('index')