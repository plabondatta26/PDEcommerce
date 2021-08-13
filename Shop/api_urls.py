from django.urls import path, register_converter
from .api_view import *
from Accounts.utils import HashIdConverter
register_converter(HashIdConverter, "hashid")

urlpatterns = [
    path('cart/individual/data/', APICart.as_view(), name='APICart'),
    path('cart/individual/length/', api_cart_length, name='api_cart_length'),
    path('cart/up/', cart_up, name='cart_up'),
    path('cart/remove/', remove_from_cart, name='remove_from_cart')
]
