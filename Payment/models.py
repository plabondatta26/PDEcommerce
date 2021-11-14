from django.db import models
from Accounts.models import UserModel
# Create your models here.


class PaymentMethod(models.Model):
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    payment_type = models.CharField(max_length=100, blank=False)
    account = models.CharField(max_length=50)


class TransactionModel(models.Model):
    user = models.ForeignKey(UserModel, on_delete=models.DO_NOTHING)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    tran_id = models.CharField(max_length=15)
    val_id = models.CharField(max_length=75)
    card_type = models.CharField(max_length=150)
    store_amount = models.DecimalField(max_digits=10, decimal_places=2)
    card_no = models.CharField(max_length=55, null=True)
    bank_tran_id = models.CharField(max_length=155, null=True)
    status = models.CharField(max_length=55)
    tran_date = models.DateTimeField()
    currency = models.CharField(max_length=10)
    card_issuer = models.CharField(max_length=255)
    card_brand = models.CharField(max_length=15)
    card_issuer_country = models.CharField(max_length=55)
    card_issuer_country_code = models.CharField(max_length=55)
    currency_rate = models.DecimalField(max_digits=10, decimal_places=2)
    verify_sign = models.CharField(max_length=155)
    verify_sign_sha2 = models.CharField(max_length=255)
    risk_level = models.CharField(max_length=15)
    risk_title = models.CharField(max_length=25)
    reason = models.CharField(max_length=30, blank=True)

    def __str__(self):
        return self.tran_id


class BillingAndShippingAddress(models.Model):
    user = models.ForeignKey(UserModel, on_delete=models.CASCADE)
    bill_add = models.TextField(max_length=1000, blank=False, null=False)
    bill_city = models.CharField(max_length=100, blank=False, null=False)
    bill_division = models.CharField(max_length=100, blank=False, null=False)
    bill_country = models.CharField(max_length=100, blank=False, null=False)
    bill_number = models.CharField(max_length=100, blank=False, null=False)

    ship_add = models.TextField(max_length=1000, blank=False, null=False)
    ship_city = models.CharField(max_length=100, blank=False, null=False)
    ship_division = models.CharField(max_length=100, blank=False, null=False)
    ship_country = models.CharField(max_length=100, blank=False, null=False)
    ship_number = models.CharField(max_length=100, blank=False, null=False)

