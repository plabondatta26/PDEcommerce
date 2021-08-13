from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from .models import *
from .forms import *
from .serializer import *
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.db.models import Q
from rest_framework.views import APIView
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from rest_framework.views import APIView,View
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages
from rest_framework.decorators import api_view


class APICart(ListAPIView):
    queryset = CartModel.objects.all()
    serializer_class = CartModelSerializer

    def list(self, request, *args, **kwargs):
        user_id = request.user.id
        queryset = CartModel.objects.filter(user=user_id).order_by('-id')
        serializer = CartModelSerializer(queryset, many=True)
        return Response(serializer.data)


def api_cart_length(request):
    user_id = request.user.id
    queryset = CartModel.objects.filter(user=user_id)
    context = {
        'length': len(queryset)
    }
    return JsonResponse(context, safe=False)


@csrf_exempt
def cart_up(request):
    if request.method == 'POST':
        user_id = request.user.id
        obj = request.POST.get("obj_id")
        value = request.POST.get("value")
        CartModel.objects.filter(pk=obj, user_id=user_id).update(quantity=value)
        return HttpResponse('ok')


@csrf_exempt
def remove_from_cart(request):
    if request.method == 'POST':
        obj = request.POST.get("obj_id")
        data = get_object_or_404(CartModel, pk=obj)
        data.delete()
        return HttpResponse('ok')