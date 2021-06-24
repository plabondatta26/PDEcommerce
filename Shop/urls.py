from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import *

urlpatterns = [
    # Brands CRUD
    path('add/brand/', CreateBrandModelView.as_view(), name='CreateBrandModelView'),
    path('brand/update/<int:pk>/', BrandUpdateView.as_view(), name='BrandUpdateView'),
    path('brand/delete/<int:pk>/', BrandDelete.as_view(), name='BrandDelete'),
    # path('brand/details/<int:pk>/', BrandDetailsView.as_view(), name='BrandDetailsView'),
    path('brands/', BrandsView.as_view(), name='BrandsView'),

    # category CRUD
    path('add/product/category/', CreateProductCategory.as_view(), name='CreateProductCategory'),
    path('product/category/', ProductCategorys.as_view(), name='ProductCategorys'),
    path('product/category/<int:pk>/details/', ProductCategoryDetails.as_view(), name='ProductCategoryDetails'),
    path('product/category/<int:pk>/update/', ProductCategoryUpdate.as_view(), name='ProductCategoryUpdate'),
    path('product/category/<int:pk>/delete/', DeleteProductCategory.as_view(), name='DeleteProductCategory'),

    # Product CRUD
    path('add/product/', CreateProduct.as_view(), name='CreateProduct'),
    path('products/', Products.as_view(), name='Products'),
    path('product/<int:pk>/details/', ProductDetails.as_view(), name='ProductDetails'),
    path('product/<int:pk>/update/', UpdateProduct.as_view(), name='UpdateProduct'),
    path('product/<int:pk>/delete/', DeleteProduct.as_view(), name='DeleteProduct'),


    # Variation CRUD
    path('create/product/variation/', CreateVariation.as_view(), name='CreateVariation'),
    path('api/get/product_by/category/', category_select, name='category_select'),
    path('product/variation/list/', VariationList.as_view(), name='VariationList'),
    path('variation/<int:pk>/update/', VariationList.as_view(), name='VariationList'),
    path('variation/<int:pk>/details/', VariationList.as_view(), name='VariationList'),
    path('variation/<int:pk>/delete/', DeleteVariation.as_view(), name='DeleteVariation'),


    # User Product Section
    path('company/products/', UserProductView.as_view(), name='UserProductView'),
    path('products/on/load/', UserProductOnReady.as_view(), name='UserProductOnReady'),
    path('get/product/category/', GetProductCategory.as_view(), name='GetProductCategory'),
    path('get/product/', GetProduct.as_view(), name='GetProduct'),
    path('get/variation/', GetVariation.as_view(), name='GetVariation'),
    path('add/to/cart/', add_to_cart, name='add_to_cart'),

    # product filter section
    path('get/category/data/', GetCategory.as_view(), name='GetCategory'),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
