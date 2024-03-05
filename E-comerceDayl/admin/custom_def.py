import os
from django.http import HttpResponse
from django.conf import settings
from producto.models import Producto
from factura.models import Factura
import json
import datetime
from django.utils import timezone
import plotly.graph_objects as go

def filtro_productos(filtros,busqueda):
  productos = Producto.objects.none()
  if filtros != "[]" and busqueda:
    filtros = json.loads(filtros)
    for filtro in filtros:
        kwargs = {}
        if 'subcategoria' in filtro:
            kwargs[filtro + '__nombre__icontains'] = busqueda
        elif 'color' in filtro:
            print('nojoda')
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
        
def busqueda_x_semana(id_producto):
    fecha_actual = timezone.make_aware(timezone.datetime.combine(timezone.now().date(), timezone.datetime.min.time()))
    fechas_semanas = [fecha_actual]
    for i in range(4):
        fecha_actual = fecha_actual - datetime.timedelta(days=7)
        fechas_semanas.append(fecha_actual)
    facturas_x_semana = [[],[],[],[]]
    for i, fecha_fin in enumerate(fechas_semanas[:-1]):  # Itera sobre las fechas de fin de semana
        fecha_inicio = fechas_semanas[i + 1]  # Obtiene la fecha de inicio de la semana
        print(type(fecha_inicio))
        facturas = Factura.objects.filter(fecha_factura__gte=fecha_inicio, fecha_factura__lte=(fecha_fin + datetime.timedelta(days=1)).replace(hour=0, minute=0, second=0, microsecond=0))
        facturas_x_semana[3-i] = facturas
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
                            print(facturas[index])
            except FileNotFoundError as e:
                pass
    return(facturas)

def graficar_x_4(datos):
    """
    Grafica los datos proporcionados en un gráfico.

    Args:
        datos (list): Una lista que contiene exactamente 4 diccionarios.
                      Cada diccionario debe tener las claves 'cantidad' y 'valor'.
    """
    semana = ['semana 1','semana 2','semana 3','semana 4']
    grafico = go.Figure()
    grafico.add_trace(go.Bar(
        x=semana,
        y=[dato['cantidad'] for dato in datos],
        name='Cantidad',
        marker_color='#AA0DFE'
    ))
    grafico.add_trace(go.Bar(
    x=semana,
    y=[dato['valor'] for dato in datos],
    name='Total',
    marker_color='#FB0D0D'
))
    grafico.update_layout(barmode='group', xaxis_tickangle=-45)
    grafico_json = grafico.to_json()
    return grafico_json