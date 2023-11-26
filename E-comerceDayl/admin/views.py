from django.shortcuts import render, redirect
from .decorators import only_admin_access
from producto.models import *
from django.core.serializers import serialize
from django.http import JsonResponse
from django.core import serializers
from .forms import ProductoForm,ColorForm,CategoriaForm,SubcategoriaForm
from .custom_def import filtro_productos
import json

# Create your views here.

@only_admin_access
def index(request):
    if 'temporales' in request.session:
        del request.session['temporales']
    filtros = request.GET.get('filtros')
    busqueda = request.GET.get('busqueda')
    productos = filtro_productos(filtros,busqueda)
    if productos:
        request.session['temporales'] = serialize('json', productos)
        return JsonResponse({'productos': request.session['temporales']})
    return render(request, 'admin/index.html', {'url': 'inicio'})
def busqueda(request):
    subcategorias = Subcategoria.objects.all()
    proveedores = Proveedor.objects.all()
    if 'temporales' in request.session:
        datos = json.loads(request.session['temporales'])
        del request.session['temporales']
        fields_list = [item['fields'] for item in datos]
    else:
        fields_list = ""
    print(fields_list)
    context = {'productos': fields_list,
               'url':'',
               'subcategorias':subcategorias,
               'proveedores':proveedores}
    return render(request, 'admin/producto.html',context)
@only_admin_access
def producto(request):
    productos = Producto.objects.all()
    subcategorias = Subcategoria.objects.all()
    proveedores = Proveedor.objects.all()
    url = 'producto'
    context = {'productos': productos,
               'url':url,
               'subcategorias':subcategorias,
               'proveedores':proveedores}
    return render(request,'admin/producto.html',context)
@only_admin_access
def producto_edit(request):
    producto_id = request.GET.get('producto_id')
    try:
        producto = Producto.objects.get(id=producto_id)
        producto_json = serializers.serialize('json', [producto])
        return JsonResponse({'producto': producto_json,'id_producto':producto_id})
    except Color.DoesNotExist:
        return JsonResponse({'error': 'Producto no encontrado'})
    pass
@only_admin_access
def editar_producto(request,id_producto):    
    try:
        producto = Producto.objects.get(id=id_producto)
    except:
        return redirect('admin:index')
    form = ProductoForm(request.POST,instance=producto)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:producto')
    return redirect('admin:index')

@only_admin_access
def producto_registro(request):
    form = ProductoForm(request.POST)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:producto')
    return redirect('admin:index')

@only_admin_access
def color(request):
    context = {
        'form':ColorForm(request.POST),
        'productos':Producto.objects.all(),
        'colores': Color.objects.all(),
        'url':'color', 
    }
    return render(request,'admin/color.html',context)
@only_admin_access
def color_registro(request):
    form = ColorForm(request.POST, request.FILES)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:color')
    return redirect('admin:index')
    
@only_admin_access
def editar_color(request,id_color):
    try:
        color = Color.objects.get(id=id_color)
    except:
        return redirect('admin:index')
    form = ColorForm(request.POST,request.FILES,instance=color)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:color')
    return redirect('admin:index')
@only_admin_access
def color_edit(request):
    color_id = request.GET.get('id_color')
    try:
        color = Color.objects.get(id=color_id)
        color_json = serializers.serialize('json', [color])
        return JsonResponse({'color': color_json,'id_color':color_id})
    except Color.DoesNotExist:
        return JsonResponse({'error': 'color no encontrado'})
    pass
@only_admin_access
def color_eliminar(request,id_color):
    try:
        color = Color.objects.get(id=id_color)
    except Color.DoesNotExist:
        return redirect('admin:index')
    try:
        producto = color.producto
        producto.stock -= color.stock
        producto.save()
    except:
        pass
    color.delete()
    return redirect('admin:color')


@only_admin_access
def categoria(request):
    context = {
        'form':CategoriaForm(request.POST),
        'categorias': Categoria.objects.all(),
        'url':'categoria', 
    }
    return render(request,'admin/categoria.html',context)
@only_admin_access
def categoria_registro(request):
    form = CategoriaForm(request.POST, request.FILES)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:categoria')
    return redirect('admin:index')
    
@only_admin_access
def editar_categoria(request,id_categoria):
    try:
        categoria = Categoria.objects.get(id=id_categoria)
    except:
        return redirect('admin:index')
    form = CategoriaForm(request.POST,request.FILES,instance=categoria)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:categoria')
    return redirect('admin:index')
@only_admin_access
def categoria_edit(request):
    categoria_id = request.GET.get('id_categoria')
    try:
        categoria = Categoria.objects.get(id=categoria_id)
        categoria_json = serializers.serialize('json', [categoria])
        return JsonResponse({'categoria': categoria_json,'id_categoria':categoria_id})
    except categoria.DoesNotExist:
        return JsonResponse({'error': 'categoria no encontrado'})
    pass
@only_admin_access
def categoria_eliminar(request,id_categoria):
    try:
        categoria = Categoria.objects.get(id=id_categoria)
    except categoria.DoesNotExist:
        return redirect('admin:index')
    categoria.delete()
    return redirect('admin:categoria')

@only_admin_access
def subcategoria(request):
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    context = {'categorias': categorias,
               'url':'subcategoria',
               'subcategorias':subcategorias}
    return render(request,'admin/subcategoria.html',context)
@only_admin_access
def subcategoria_edit(request):
    subcategoria_id = request.GET.get('subcategoria_id')
    try:
        subcategoria = Subcategoria.objects.get(id=subcategoria_id)
        subcategoria_json = serializers.serialize('json', [subcategoria])
        return JsonResponse({'subcategoria': subcategoria_json,'id_subcategoria':subcategoria_id})
    except Color.DoesNotExist:
        return JsonResponse({'error': 'categoria no encontrado'})
    pass
@only_admin_access
def editar_subcategoria(request,id_subcategoria):    
    try:
        subcategoria = Subcategoria.objects.get(id=id_subcategoria)
    except:
        return redirect('admin:index')
    form = SubcategoriaForm(request.POST,instance=subcategoria)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:subcategoria')
    return redirect('admin:index')

@only_admin_access
def subcategoria_registro(request):
    form = SubcategoriaForm(request.POST)
    if request.method == "POST":
        if form.is_valid():
            form.save()
            return redirect('admin:subcategoria')
    return redirect('admin:index')
@only_admin_access
def subcategoria_eliminar(request,id_subcategoria):
    try:
        subcategoria = Subcategoria.objects.get(id=id_subcategoria)
    except subcategoria.DoesNotExist:
        return redirect('admin:index')
    subcategoria.delete()
    return redirect('admin:subcategoria')   