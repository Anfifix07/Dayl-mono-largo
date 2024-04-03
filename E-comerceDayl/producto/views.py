import random
from django.http import JsonResponse
from django.shortcuts import render,redirect
from . models import *
from . models import Producto, Color
import json
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile
from PIL import Image
import requests
# Create your views here.
def index(request):
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    productos = Producto.objects.all()    
    return render(request, "indexproducto.html", {"categorias":categorias,"subcategorias":subcategorias,"productos":productos})

def categorias(request,categoria,subcategoria=None):
    if subcategoria is not None:
        productos=Producto.objects.filter(subcategoria__nombre=subcategoria,estado=True)
        categoria = categoria
        subcategoria = subcategoria
        categorias = Categoria.objects.all()
        subcategorias = Subcategoria.objects.all()
        context={"productos": productos,
                 "categoria": categoria,
                 "subcategoria": subcategoria,
                 "categorias": categorias,
                 "subcategorias": subcategorias}
    elif categoria is not None:
        productos = Producto.objects.filter(subcategoria__categoria__nombre=categoria,estado=True)
        categorias = Categoria.objects.all()
        subcategorias = Subcategoria.objects.all()
        context={"productos": productos,
                 "categoria": categoria,
                 "categorias": categorias,
                 "subcategorias": subcategorias}
    return render(request, "productos.html",context)

def producto(request,nombre_producto,id):
    producto=Producto.objects.get(nombre=nombre_producto,estado=True,id=id)
    categorias = Categoria.objects.all()
    subcategorias = Subcategoria.objects.all()
    context={"producto": producto,
            "subcategorias": subcategorias,
            "categorias": categorias}
    if producto:
        return render(request, "producto.html",context)
    else:
        return redirect('product:producto_index')
    
def search_producto(request,nombre_producto):
    categorias = Categoria.objects.all()
    productos = Producto.objects.filter(nombre__icontains=nombre_producto, estado=1)
    subcategorias = Subcategoria.objects.all()
    context = {"productos": productos,
                 "categoria": nombre_producto,
                 "categorias": categorias,
                 "subcategorias": subcategorias}
    return render(request, 'productos.html',context)

def generador_productos(request):
    if request.GET.get('datos'):
        datos = json.loads(request.GET.get('datos'))
        proveedor = Proveedor.objects.get(id=3)
        subcat = Subcategoria.objects.get(id=random.randint(7, 9))
        producto = Producto()
        producto.proveedor = proveedor
        producto.nombre = datos['title']
        producto.porcentaje_iva = 16
        producto.descripcion = datos['description']
        producto.precio = datos['price']
        producto.stock = 0
        producto.subcategoria = subcat
        producto.oferta = int(datos['discountPercentage'])
        producto.estado = True
        producto.save()
        
        response = requests.get(datos['images'][0])
        imagen = Image.open(BytesIO(response.content))
    
        # Si deseas redimensionar la imagen antes de guardarla
        # imagen = imagen.resize((nuevo_ancho, nuevo_alto))

        # Convertir la imagen a formato JPEG para que sea compatible con ImageField
        with BytesIO() as output:
            imagen.save(output, format='JPEG')
            imagen_jpeg = output.getvalue()

        # Crear un archivo de imagen temporal en memoria
        imagen_temporal = InMemoryUploadedFile(
            BytesIO(imagen_jpeg),
            None,
            'temp.jpg',
            'image/jpeg',
            len(imagen_jpeg),
            None
        )

        # Ahora puedes asignar la imagen_temporal al campo ImageField en tu modelo Color
        colores = ['variado', 'rojo', 'azul', 'trans']
        color = Color()
        color.color = random.choice(colores)
        color.imagen = imagen_temporal
        color.stock = datos['stock']
        color.producto = producto
        color.save()
        return JsonResponse({'error': 'HPTA'})
    else: 
        return redirect('product:producto_index')