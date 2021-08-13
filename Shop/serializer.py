from rest_framework import serializers
from .models import *
# from .documents import *
# from django_elasticsearch_dsl_drf.serializers import DocumentSerializer
#
#
# class NewBrandSerializer(DocumentSerializer):
#     class Meta:
#         model = BrandModel
#         document = BrandDocument
#         fields = 'name'
#
#         def get_location(self, obj):
#             try:
#                 return obj.location.to_dict()
#             except:
#                 return {}


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


class CartModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = CartModel
        fields = '__all__'
        depth = 2


