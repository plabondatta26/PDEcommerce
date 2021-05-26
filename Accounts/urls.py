from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView, LogoutView
from .views import *

urlpatterns = [
    path('register/', Registration.as_view(), name='register'),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('', dashboard, name='dashboard'),
    path('my/profile/', profile, name='profile')
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
