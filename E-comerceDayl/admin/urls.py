from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static
from buycar.views import *

app_name = 'admin'
urlpatterns = [
    path('', views.index, name="index"),
    path('busqueda',views.busqueda,name='busqueda'),
    path('producto/',views.producto, name="producto"),
    path('producto/registro', views.producto_registro, name="producto_registro"),
    path('producto/edit/', views.producto_edit, name="producto_edit"),
    path('producto/edit/<int:id_producto>', views.editar_producto, name="editar_producto"),
    path('color/',views.color, name='color'),
    path('color/registro', views.color_registro, name="color_registro"),
    path('color/edit/', views.color_edit, name="color_edit"),
    path('color/edit/<int:id_color>', views.editar_color, name="editar_color"),
    path('color/del/<int:id_color>', views.color_eliminar,name="color_eliminar"),
    path('categoria/',views.categoria, name='categoria'),
    path('categoria/registro', views.categoria_registro, name="categoria_registro"),
    path('categoria/edit/', views.categoria_edit, name="categoria_edit"),
    path('categoria/edit/<int:id_categoria>', views.editar_categoria, name="editar_categoria"),
    path('categoria/del/<int:id_categoria>', views.categoria_eliminar,name="categoria_eliminar"),
    path('subcategoria/',views.subcategoria, name='subcategoria'),
    path('subcategoria/registro', views.subcategoria_registro, name="subcategoria_registro"),
    path('subcategoria/edit/', views.subcategoria_edit, name="subcategoria_edit"),
    path('subcategoria/edit/<int:id_subcategoria>', views.editar_subcategoria, name="editar_subcategoria"),
    path('subcategoria/del/<int:id_subcategoria>', views.subcategoria_eliminar,name="subcategoria_eliminar"),
    ]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)