from django.shortcuts import render, redirect, get_object_or_404
from django.urls import reverse_lazy
from .models import *
from .forms import *
from django.views.generic import CreateView, UpdateView, DeleteView, ListView, DetailView, TemplateView
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin
from .serializer import *
from django.http import HttpResponseRedirect, HttpResponse
from django.db.models import Q
from rest_framework.views import APIView
from rest_framework.generics import ListAPIView
from rest_framework.response import Response
from django.views.decorators.csrf import csrf_exempt
from django.contrib import messages
# Create your views here.


class CreateBrandModelView(LoginRequiredMixin, CreateView):
    form_class = BrandModelForm
    template_name = 'Shop/create_brand.html'
    success_url = '/brands/'


class BrandUpdateView(LoginRequiredMixin, UpdateView):
    form_class = BrandModelForm
    model = BrandModel
    template_name = 'Shop/updatebrand.html'

    def get_success_url(self, **kwargs):
        return reverse_lazy("BrandsView")


class BrandsView(LoginRequiredMixin, ListView):
    template_name = 'Shop/brands.html'
    model = BrandModel


# class BrandDetailsView(LoginRequiredMixin, DetailView):
#     model = ProductCategoryModel
#     template_name = 'Shop/PCM_details.html'

class BrandDelete(LoginRequiredMixin, DeleteView):
    model = BrandModel
    template_name = 'Shop/conf_delete.html'
    success_url = reverse_lazy('BrandsView')


class CreateProductCategory(LoginRequiredMixin, View):
    data = BrandModel.objects.all()

    def get(self, request):
        form = ProductCategoryModelForm()
        context = {
            'form': form,
            'data': self.data
        }
        return render(request, 'Shop/creat_prod_cat.html', context)

    def post(self, request):
        form = ProductCategoryModelForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('ProductCategorys')

        context = {
            'form': form,
            'data': self.data
        }
        return render(request, 'Shop/creat_prod_cat.html', context)


class ProductCategorys(LoginRequiredMixin, ListView):
    template_name = 'Shop/prod_cats.html'
    model = ProductCategoryModel


class ProductCategoryDetails(LoginRequiredMixin, DetailView):
    model = ProductCategoryModel
    template_name = 'Shop/PCM_details.html'


class ProductCategoryUpdate(LoginRequiredMixin, UpdateView):
    model = ProductCategoryModel
    form_class = ProductCategoryModelForm
    template_name = 'Shop/up_prod_cat.html'

    def get_success_url(self, **kwargs):
        return reverse_lazy("ProductCategoryDetails", args=[self.object.id])

#
# class ProductCategoryDelete(LoginRequiredMixin, UpdateView):
#     model = ProductCategoryModel
#     form_class = ProductCategoryModelForm
#     template_name = 'Shop/up_prod_cat.html'
#
#     def get_success_url(self, **kwargs):
#         return reverse_lazy("ProductCategoryDetails", args=[self.object.id])


class DeleteProductCategory(LoginRequiredMixin, DeleteView):
    model = ProductCategoryModel
    template_name = 'Shop/conf_delete.html'
    success_url = reverse_lazy('ProductCategorys')


class CreateProduct(LoginRequiredMixin, View):
    def get(self, request):
        form = ProductModelForm()
        brand = BrandModel.objects.all().order_by('-id')
        category = ProductCategoryModel.objects.all().order_by('-id')
        context = {
            'form': form,
            'brand': brand,
            'category': category
        }
        return render(request, 'Shop/crete_prod.html', context)

    def post(self, request):
        form = ProductModelForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('Products')
        return redirect('CreateProduct')


class Products(LoginRequiredMixin, ListView):
    template_name = 'Shop/products.html'
    model = ProductModel


class ProductDetails(LoginRequiredMixin, DetailView):
    model = ProductModel
    template_name = 'Shop/PM_details.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        pk = self.object.id
        variations = VariationModel.objects.filter(product=pk)
        context['variations'] = variations
        return context


class UpdateProduct(LoginRequiredMixin, UpdateView):
    model = ProductModel
    form_class = ProductModelForm
    template_name = 'Shop/PM_update.html'
    success_url = '/products/'

    def post(self, request, pk):
        obj = ProductModel.objects.get(pk=pk)
        form = ProductModelForm(request.POST, instance=obj)
        if form.is_valid():
            form.save()
            return redirect('ProductDetails', pk)
        return HttpResponseRedirect(request.META['HTTP_REFERER'])

    def get_success_url(self, **kwargs):
        return reverse_lazy("ProductDetails", args=[self.object.id])

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        cat = self.object.category.name
        category = ProductCategoryModel.objects.filter(~Q(name=cat))
        context['category'] = category
        return context


class DeleteProduct(LoginRequiredMixin, DeleteView):
    model = ProductModel
    template_name = 'Shop/conf_delete.html'
    success_url = reverse_lazy('Products')


def CreateVariation(request):
    form = VariationModelForm()
    cate = ProductCategoryModel.objects.all()
    if request.method == 'POST':
        form = VariationModelForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('VariationList')
    context = {
        'form':form,
        'cate': cate,
    }
    return render(request, 'Shop/create_variation.html', context)


def brand_select(request):
    br_id = request.GET.get('br_id')
    element = 'category'
    category = ProductCategoryModel.objects.filter(brand=br_id)
    return render(request, 'Shop/CategorySelect.html', {'object': category, 'element': element})


def category_select(request):
    element = 'product'
    cat_id = request.GET.get('cat_id')
    products = ProductModel.objects.filter(category=cat_id)
    return render(request, 'Shop/CategorySelect.html', {'object': products, 'element':element})
    

class VariationList(LoginRequiredMixin, ListView):
    model = VariationModel
    template_name = 'Shop/variations.html'


class DeleteVariation(LoginRequiredMixin, DeleteView):
    model = VariationModel
    template_name = 'Shop/conf_delete.html'
    success_url = reverse_lazy('Products')


class UserProductView(TemplateView):
    template_name = 'Shop/user_product.html'

    def get_context_data(self, **kwargs):
        brand = BrandModel.objects.all()
        category = ProductCategoryModel.objects.all().values('name').distinct()
        product = ProductModel.objects.all().values('name').distinct()
        context = super(UserProductView, self).get_context_data(**kwargs)
        context['brand'] = brand
        context['category'] = category
        context['product'] = product
        return context


class UserProductOnReady(APIView):
    def get(self,*args, **kwargs):
        queryset = VariationModel.objects.all().order_by('-id')
        data = VariationSerializer(queryset, many=True)
        return Response(data.data)


class GetProductCategory(APIView):
    def get(self, *args, **kwargs):
        data = ProductCategoryModel.objects.all()
        serializer = ProductCategorySerializer(data, many=True)
        return Response(serializer.data)


class GetProduct(ListAPIView):
    serializer_class = ProductSerializer

    def get_queryset(self):
        data = ''
        cat_id = self.request.query_params.get('cat_id')
        if cat_id:
            data = ProductModel.objects.filter(category=cat_id)
        return data


class GetVariation(ListAPIView):
    def get_queryset(self):
        cat_id = self.request.query_params.get('cat_id')
        data = VariationModel.objects.filter(category=cat_id)
        serializer = VariationSerializer(data, many=True)
        return Response(serializer.data)


@csrf_exempt
def add_to_cart(request):
    if request.user.is_authenticated:
        if request.method == 'POST':
            variation = request.POST['variation']
            quantity = request.POST['quantity']
            user = request.user.id
            print(variation, quantity, user)
            CartModel.objects.create(user_id=user, variation_id=variation, quantity=quantity)
            return HttpResponse('ok')
    else:
        messages.warning(request, "Please log in before add to cart")
        return HttpResponse('Ok')


class GetCategory(TemplateView):
    template_name = 'Shop/getCategorys.html'

    def get_context_data(self, **kwargs):
        context = super(GetCategory, self).get_context_data(**kwargs)
        data = ProductCategoryModel.objects.values('name')
        context.update({'data':data})
        return context


class UserAddToCartList(ListView):
    model = CartModel
    template_name = 'Shop/cartDetails.html'

    def get_context_data(self, **kwargs):
        user_id = self.request.user.id
        context = super(UserAddToCartList, self).get_context_data(**kwargs)
        context['object_data'] = CartModel.objects.filter(user_id=user_id)
        return context