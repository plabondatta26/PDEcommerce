from django.db import models
from Accounts.models import UserModel
# Create your models here.


class ProductCategoryModel(models.Model):
    name = models.CharField(max_length=100, blank=False, unique=True)
    created_on = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.name


class ProductModel(models.Model):
    name = models.CharField(max_length=100, blank=False, unique=True)
    description = models.TextField(max_length=1000, blank=False, unique=True)
    category = models.ForeignKey(ProductCategoryModel, on_delete=models.CASCADE)
    created_on = models.DateField(auto_now_add=True)
    updated_on = models.DateField(auto_now=True)

    def __str__(self):
        return self.name


class VariationModel(models.Model):
    product = models.ForeignKey(ProductModel, on_delete=models.CASCADE)
    category = models.ForeignKey(ProductCategoryModel, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=5, blank=False)
    size = models.CharField(max_length=50, blank=False)
    color = models.CharField(max_length=100, blank=False)
    sold = models.CharField(max_length=5, blank=True)
    expensive_to_buy = models.CharField(max_length=5, blank=True)
    selling_price = models.CharField(max_length=5, blank=False)
    discount = models.CharField(max_length=2, blank=False)
    is_discount = models.BooleanField(default=False)
    img = models.ImageField(blank=False, upload_to='product/')


class CartModel(models.Model):
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    product = models.ForeignKey(ProductModel, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=5, blank=False)
    price = models.CharField(max_length=10, blank=True)
    discount = models.CharField(max_length=2, blank=False)
    created_on = models.DateField(auto_now_add=True)


class OrderModel(models.Model):
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    product = models.ForeignKey(ProductModel, on_delete=models.CASCADE)
    quantity = models.CharField(max_length=5, blank=False)
    price = models.CharField(max_length=10, blank=True)
    discount = models.CharField(max_length=2, blank=False)
    created_on = models.DateField(auto_now_add=True)



