# from django_elasticsearch_dsl import (
#     Document, fields, Index
# )
#
# from .models import BrandModel
#
# PUBLISHER_INDEX = Index('brand_model')
# PUBLISHER_INDEX.settings(
#     number_of_shard=1,
#     number_of_replicas=1,
# )
#
#
# @PUBLISHER_INDEX.doc_type
# class BrandDocument(Document):
#     id = fields.IntegerField(attr='id')
#     name = fields.TextField(
#         fields={
#             "raw": {
#                 "type": 'keyword'
#             }
#         }
#     )
#
#     class Django(object):
#         model = BrandModel
