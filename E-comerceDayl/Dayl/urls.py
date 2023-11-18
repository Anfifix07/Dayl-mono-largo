
from django.contrib import admin
from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('', views.index, name="index"),
    path('producto/',include(('producto.urls','product'),namespace='product'), name="product"),
    path('carrito/', include(('buycar.urls', 'buycar'), namespace='buycar'), name="buycar"),
    path('obtener_imagen_color/', views.obtener_imagen_color, name='obtener_imagen_color'),
    path('cliente/',include(('cliente.urls', 'cliente'), namespace='cliente'), name='cliente'),
    path('admin/', include(('admin.urls', 'admin'), namespace='admin'), name='admin'),
    path('factura/', include(('factura.urls','factura'),namespace='factura'),name='factura'),
    path('registro/', views.registro, name="registro"), 
    path('paypal/', include("paypal.standard.ipn.urls")),
]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
