# Generated by Django 3.2 on 2021-06-21 15:03

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='BrandModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='ProductCategoryModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('created_on', models.DateField(auto_now_add=True)),
                ('brand', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Shop.brandmodel')),
            ],
        ),
        migrations.CreateModel(
            name='ProductModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('description', models.TextField(max_length=1000, unique=True)),
                ('created_on', models.DateField(auto_now_add=True)),
                ('updated_on', models.DateField(auto_now=True)),
                ('brand', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Shop.brandmodel')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Shop.productcategorymodel')),
            ],
        ),
        migrations.CreateModel(
            name='VariationModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('brand', models.CharField(default='Local', max_length=200)),
                ('quantity', models.CharField(max_length=5)),
                ('size', models.CharField(max_length=50)),
                ('color', models.CharField(max_length=100)),
                ('sold', models.CharField(blank=True, default=0, max_length=5)),
                ('expensive_to_buy', models.CharField(blank=True, max_length=5)),
                ('selling_price', models.CharField(max_length=5)),
                ('discount', models.CharField(max_length=2)),
                ('is_discount', models.BooleanField(default=False)),
                ('discount_price', models.CharField(default='', max_length=100)),
                ('img', models.ImageField(upload_to='product/')),
                ('is_available', models.BooleanField(default=True)),
                ('created_on', models.DateTimeField(auto_now_add=True)),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Shop.productcategorymodel')),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Shop.productmodel')),
            ],
        ),
        migrations.CreateModel(
            name='OrderModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.CharField(max_length=5)),
                ('price', models.CharField(blank=True, max_length=10)),
                ('discount', models.CharField(max_length=2)),
                ('created_on', models.DateField(auto_now_add=True)),
                ('product', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Shop.productmodel')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='CartModel',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.CharField(max_length=5)),
                ('created_on', models.DateField(auto_now_add=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('variation', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='Shop.variationmodel')),
            ],
        ),
    ]
