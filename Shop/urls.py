from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView, LogoutView
from .views import *

urlpatterns = [
    path('add/product/category/', CreateProductCategory.as_view(), name='CreateProductCategory'),
    path('product/category/', ProductCategorys.as_view(), name='ProductCategorys'),
    path('product/category/<int:pk>/details/', ProductCategoryDetails.as_view(), name='ProductCategoryDetails'),
    path('add/product/', CreateProduct.as_view(), name='CreateProduct'),
    path('products/', Products.as_view(), name='Products'),
    path('create/product/variation/', CreateVariation.as_view(), name='CreateVariation'),
    path('api/get/product_by/category/', category_select, name='category_select'),
    path('product/variation/list/', VariationList, name='VariationList')
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
