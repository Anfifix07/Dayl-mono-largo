import os
from django.http import HttpResponse
from django.conf import settings
from producto.models import Producto
from factura.models import Factura
import json
import datetime
from django.utils import timezone
import plotly.graph_objects as go
from plotly.subplots import make_subplots
from plotly.data import tips

def filtro_productos(filtros,busqueda):
  productos = Producto.objects.none()
  if filtros != "[]" and busqueda:
    filtros = json.loads(filtros)
    for filtro in filtros:
        kwargs = {}
        if 'subcategoria' in filtro:
            kwargs[filtro + '__nombre__icontains'] = busqueda
        elif 'color' in filtro:
            kwargs[filtro + '__color__icontains'] = busqueda
        elif 'proveedor' in filtro:
            kwargs[filtro + '__nombre_completo__icontains'] = busqueda
        if kwargs != {}:
            pp = Producto.objects.filter(**kwargs)
            productos = productos.union(pp)
        print(kwargs)
  elif busqueda:
      pp = Producto.objects.filter(nombre__icontains=busqueda)
      productos = productos.union(pp)
  return productos
        
def busqueda_x_semana():
    fecha_actual = timezone.make_aware(timezone.datetime.combine(timezone.now().date(), timezone.datetime.min.time()))
    fechas_semanas = [fecha_actual]
    for i in range(4):
        fecha_actual = fecha_actual - datetime.timedelta(days=7)
        fechas_semanas.append(fecha_actual)
    facturas_x_semana = [[],[],[],[]]
    for i, fecha_fin in enumerate(fechas_semanas[:-1]):
        fecha_inicio = fechas_semanas[i + 1]
        facturas = Factura.objects.filter(fecha_factura__gte=fecha_inicio, fecha_factura__lte=(fecha_fin + datetime.timedelta(days=1)).replace(hour=0, minute=0, second=0, microsecond=0))
        facturas_x_semana[3-i] = facturas
    return facturas_x_semana

def ventas_4_semanas(facturas_x_semana):
    facturas = [{'cantidad': 0, 'valor': 0} for _ in range(4)]
    for index,facturas_semana in enumerate(facturas_x_semana):
        for f in facturas_semana:
            ruta = os.path.join(settings.MEDIA_ROOT, f.pedido.productos.name)
            try:
                with open(ruta, 'r') as productos_file:
                    productos = json.loads(productos_file.read())
                    for producto in productos:
                        facturas[index]['cantidad'] += productos[producto]['cantidad']
                        facturas[index]['valor'] += productos[producto]['acumulado']
            except FileNotFoundError:
                pass
    return(facturas)

def busqueda_x_id(facturas_x_semana,id_producto):
    facturas = [{'cantidad': 0, 'valor': 0} for _ in range(4)]
    for index, facturas_semana in enumerate(facturas_x_semana):
        for f in facturas_semana:
            ruta = os.path.join(settings.MEDIA_ROOT, f.pedido.productos.name)
            try:
                with open(ruta, 'r') as productos_file:
                    productos = json.loads(productos_file.read())
                    for producto in productos:
                        if str(producto.split('_')[0]) == str(id_producto):
                            facturas[index]['cantidad'] += productos[producto]['cantidad']
                            facturas[index]['valor'] += productos[producto]['acumulado']
            except FileNotFoundError as e:
                pass
    return(facturas)

def graficar_x_4(datos):
    semana = ['semana 1','semana 2','semana 3','semana 4']
    
    fig = make_subplots(specs=[[{"secondary_y": True}]])
    
    fig.add_trace(go.Bar(
        x=semana,
        y=[dato['valor'] for dato in datos],
        name="Total de ventas",
        marker=dict(color="#37167f"),
    ), secondary_y=False)

    fig.add_trace(go.Scatter(
        x=semana,
        y=[dato['cantidad'] for dato in datos],
        name="Cantidad de ventas",
        marker=dict(color="#d10257"),
    ), secondary_y=True)

    fig.update_layout(
        legend=dict(orientation="h"),
        yaxis=dict(
            title=dict(text="Total de ventas"),
            side="left",
        ),
        yaxis2=dict(
            title=dict(text="Cantidad de ventas"),
            side="right",
            overlaying="y",
            tickmode="linear",
        ),
    )

    graph_html = fig.to_html(full_html=False)

    return graph_html