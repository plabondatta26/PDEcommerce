from django.shortcuts import render, get_object_or_404
from .models import UserModel
from .forms import *
from django.contrib.auth import login, logout
from django.views.generic import CreateView, UpdateView, DetailView, ListView, DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.contrib.auth.decorators import login_required
# Create your views here.


class Registration(CreateView):
    form_class = RegistrationForm
    template_name = 'Accounts/sign-up.html'
    success_url = 'login'


@login_required(login_url='login')
def dashboard(request):
    return render(request, 'Accounts/dashboard.html')


def profile(request):
    return render(request, 'Accounts/profile.html')

