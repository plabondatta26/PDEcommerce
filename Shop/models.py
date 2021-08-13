from django.db import models
from Accounts.models import UserModel
# Create your models here.


class BrandModel(models.Model):
    name = models.CharField(max_length=100, blank=False, null=False, unique=True)

    def __str__(self):
        return self.name


class ProductCategoryModel(models.Model):
    brand = models.ForeignKey(BrandModel, on_delete=models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=100, blank=False, unique=False)
    created_on = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name


class ProductModel(models.Model):
    brand = models.ForeignKey(BrandModel, on_delete=models.CASCADE, blank=True, null=True)
    name = models.CharField(max_length=100, blank=False, unique=False)
    description = models.TextField(max_length=1000, blank=False, unique=False)
    category = models.ForeignKey(ProductCategoryModel, on_delete=models.CASCADE, blank=True, null=True)
    created_on = models.DateField(auto_now_add=True)
    updated_on = models.DateField(auto_now=True)

    def __str__(self):
        return self.name


class VariationModel(models.Model):
    category = models.ForeignKey(ProductCategoryModel, on_delete=models.CASCADE, blank=True, null=True)
    product = models.ForeignKey(ProductModel, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=5, blank=False)
    size = models.CharField(max_length=50, blank=False)
    color = models.CharField(max_length=100, blank=False)
    sold = models.CharField(max_length=5, default=0, blank=True)
    expensive_to_buy = models.CharField(max_length=5, blank=True)
    selling_price = models.CharField(max_length=5, blank=False)
    discount = models.CharField(max_length=2, blank=True)
    is_discount = models.BooleanField(default=False)
    discount_price = models.CharField(max_length=100, default='')
    img = models.ImageField(blank=False, upload_to='product/')
    is_available = models.BooleanField(default=True)
    created_on = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.category.name + ' ' + self.product.name


class CartModel(models.Model):
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    variation = models.ForeignKey(VariationModel, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=5, blank=False)
    created_on = models.DateTimeField(auto_now_add=True)


class OrderModel(models.Model):
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    product = models.ForeignKey(ProductModel, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=5, blank=False)
    price = models.CharField(max_length=10, blank=True)
    discount = models.CharField(max_length=2, blank=False)
    created_on = models.DateField(auto_now_add=True)



