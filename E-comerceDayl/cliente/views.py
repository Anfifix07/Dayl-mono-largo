from django.shortcuts import render,redirect
from . models import Cliente
from .forms import Registro, Login
from django.contrib import messages
from .decorators import ajax_request_required
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login as auth_login, logout
from .models import Cliente
from django.forms import ValidationError
from django.contrib.auth.hashers import check_password
from django.contrib.auth.decorators import login_required
from factura.models import *
from django.contrib.auth.forms import UserChangeForm
# Create your views here.
@ajax_request_required
def index(request):
    if request.method == "POST":
        form = Registro(request.POST)
        if form.is_valid():
            form_data = form.cleaned_data
            try:
                user = User.objects.create_user(
                    form_data['correo_electronico'],
                    form_data['correo_electronico'],
                    form_data['contraseña']
                )
                user.first_name = form_data['nombre']
                user.save()
                cliente = Cliente.objects.create(
                    user=user,
                    nombre=form_data['nombre'],
                    telefono=form_data['telefono'],
                    ciudad=form_data['ciudad'],
                    tipo_persona=form_data['tipo_persona'],
                    nit=form_data['nit'],
                    departamento=form_data['departamento'],
                    tipo_via=form_data['tipo_via'],
                    numero=form_data['numero'],
                    complemento=form_data['complemento'],
                    casa_apto=form_data['casa_apto'],
                    descripcion=form_data['descripcion']
                )
                cliente.save()

            except user.DoesNotExist as e:
                messages.error(f'Error: {e}')

            messages.success(request, f"El usuario {form_data['nombre']} se registro con exito")
            return redirect('index')
        else:
            for field, errors in form.errors.items():
                messages.error(request, f"Hubo un error en {field}: {errors}")
            return redirect("index")
    return render(request, "layouts/parcials/register.html", {})

@ajax_request_required
def login(request):
    form = Login(request.POST)
    if request.method == "POST":
        if form.is_valid():
            datos = form.cleaned_data
            user = authenticate(username=datos['email'],password=datos['password'])
            if user is None:
                messages.error(request, f'Error en las credenciales')
            else:
                auth_login(request, user)
                if user.is_superuser:
                    return redirect('admin:index')
            return redirect('index')
        else:
            return redirect('index')
    return render(request, "layouts/parcials/login.html",{"form":form})

def clogout(request):
    if request.user.is_authenticated:
        logout(request)
    return redirect("index")


def mostrar_factura_cliente(request):
    cliente = Cliente.objects.get(user=request.user)
    factura = Factura.objects.get(cliente=cliente)
    context ={
        'factura':factura
    }
    return render(request, 'facturaCliente.html', context)
@login_required
def modificar_cliete(request):
    cliente = Cliente.objects.get(user=request.user)
    form = Registro(request.POST)
    if request.method =='POST':
        contraseña_ing = request.POST.get('verifi_cliente')
        if check_password(contraseña_ing, request.user.password):
            for field_name, field in form.fields.items(): 
                valor=form[field_name].value()
                if valor != None:
                    setattr(cliente, field_name, valor)
                    
            cliente.save()
            
    return render(request, 'modificar_datos.html', {'form':form})
            
#print(f"{field_name}:{form[field_name].value()}")
#{field.widget.attrs.get('nombre')}
                
    