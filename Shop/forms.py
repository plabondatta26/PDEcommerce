from django import forms
from .models import *


class BrandModelForm(forms.ModelForm):
    class Meta:
        model = BrandModel
        fields = '__all__'


class ProductCategoryModelForm(forms.ModelForm):
    class Meta:
        model = ProductCategoryModel
        fields = '__all__'

        widgets = {
            'brand': forms.Select(attrs={'class': 'form-control show-tick'})
        }


class ProductModelForm(forms.ModelForm):
    class Meta:
        model = ProductModel
        fields = '__all__'


class VariationModelForm(forms.ModelForm):
    class Meta:
        model = VariationModel
        fields = '__all__'


class CartModelForm(forms.ModelForm):
    class Meta:
        model = CartModel
        fields = '__all__'


class OrderModelForm(forms.ModelForm):
    class Meta:
        model = ProductCategoryModel
        fields = '__all__'
