from django import forms
from producto.models import Producto,Color,Categoria,Subcategoria

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = '__all__'
class ColorForm(forms.ModelForm):
    class Meta:
        model = Color
        fields = '__all__'
class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = '__all__'
class SubcategoriaForm(forms.ModelForm):
    class Meta:
        model = Subcategoria
        fields = '__all__'