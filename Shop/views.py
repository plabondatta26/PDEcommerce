from django.shortcuts import render,redirect, get_object_or_404
from .models import *
from .forms import *
from django.views.generic import CreateView, UpdateView, DeleteView, ListView, DetailView, TemplateView
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin
from .serializer import *
# Create your views here.


class CreateProductCategory(LoginRequiredMixin, CreateView):
    form_class = ProductCategoryModelForm
    template_name = 'Shop/creat_prod_cat.html'
    success_url = '/product/categorys/'


class ProductCategorys(LoginRequiredMixin, ListView):
    template_name = 'Shop/prod_cats.html'
    model = ProductCategoryModel


class ProductCategoryDetails(LoginRequiredMixin, DetailView):
    model = ProductCategoryModel
    template_name = 'Shop/p_cad_details.html'


class CreateProduct(LoginRequiredMixin, View):
    def get(self, request):
        form = ProductModelForm()
        category = ProductCategoryModel.objects.all().order_by('-id')
        context = {
            'form': form,
            'category': category
        }
        return render(request, 'Shop/crete_prod.html', context)

    def post(self, request):
        form = ProductModelForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('Products')


class Products(LoginRequiredMixin, ListView):
    template_name = 'Shop/products.html'
    model = ProductModel


class CreateVariation(LoginRequiredMixin, View):

    def get(self, request):
        form = VariationModelForm()
        cate = ProductCategoryModel.objects.all()
        return render(request, 'Shop/create_variation.html', {'form': form, 'cate': cate})
    def post(self, request):
        form = VariationModelForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()


def category_select(request):
    cat_id = request.GET.get('cat_id')
    products = ProductModel.objects.filter(category=cat_id)
    return render(request, 'Shop/CategorySelect.html', {'products': products})


class VariationList(LoginRequiredMixin, ListView):
    model = VariationModel
    template_name = 'Shop/variations.html'
