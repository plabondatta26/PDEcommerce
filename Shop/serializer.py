from rest_framework import serializers
from .models import *


class ProductCategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = ProductCategoryModel
        fields = '__all__'


class ProductSerializer(serializers.ModelSerializer):
    category = ProductCategorySerializer()

    class Meta:
        model = ProductModel
        fields = '__all__'


class VariationSerializer(serializers.ModelSerializer):
    class Meta:
        model = VariationModel
        fields = '__all__'
        depth = 2

