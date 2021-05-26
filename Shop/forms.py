from django import forms
from .models import *


class ProductCategoryModelForm(forms.ModelForm):
    class Meta:
        model = ProductCategoryModel
        fields = '__all__'


class ProductModelForm(forms.ModelForm):
    class Meta:
        model = ProductModel
        fields = '__all__'


class VariationModelForm(forms.ModelForm):
    class Meta:
        model = VariationModel
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['product'] = ProductModel.objects.none()


class CartModelForm(forms.ModelForm):
    class Meta:
        model = CartModel
        fields = '__all__'


class OrderModelForm(forms.ModelForm):
    class Meta:
        model = ProductCategoryModel
        fields = '__all__'
