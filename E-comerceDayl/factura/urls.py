
from django.contrib import admin
from django.urls import path, include
from . import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('detalle_compra/', views.detalle_compra, name="detalle_compra"),
    path('payment_done',views.paypal_return,name='paypal-return'),
    path('payment_cancelled',views.paypal_cancel,name='paypal-cancel')
]+ static(settings.STATIC_URL, document_root=settings.STATIC_ROOT) + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
