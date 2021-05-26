from django import forms
from .models import UserModel
from django.contrib.auth.forms import UserCreationForm


class RegistrationForm(UserCreationForm):
    class Meta:
        model = UserModel
        fields = ['first_name', 'last_name', 'contact', 'country', 'city',
                  'username', 'email', 'password1', 'password2']

