from django.db import models
from django.contrib.auth.models import AbstractUser
from django_countries.fields import CountryField
# Create your models here.


# email, contact, address,
class UserModel(AbstractUser):
    contact = models.CharField(max_length=20, blank=False, unique=True)
    country = CountryField()
    city = models.CharField(max_length=100, blank=False)
    img = models.ImageField(blank=False, upload_to='User/')
