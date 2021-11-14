from django.shortcuts import render
from .models import *
from .forms import *
from django.views.generic import CreateView
# Create your views here.


class CheckOutAddress(CreateView):
    template_name = ''
    form_class = AddressForm

    def form_valid(self, form):
        pass
