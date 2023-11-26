from producto.models import Producto
import json

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
        