from django import forms
from .models import *


class PaymentMethodForm(forms.ModelForm):
    class Meta:
        model = PaymentMethod
        fields = '__all__'


class AddressForm(forms.ModelForm):
    class Meta:
        model = BillingAndShippingAddress
        fields = '__all__'

