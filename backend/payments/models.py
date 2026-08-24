from django.db import models

from bookings.models import Booking


class Payment(models.Model):
    booking = models.ForeignKey(Booking, on_delete=models.CASCADE, related_name='payments')
    transaction_id = models.CharField(max_length=100, unique=True, blank=True, null=True)
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    payment_method = models.CharField(max_length=50, default='card')
    payment_status = models.CharField(max_length=20, default='pending')
    payment_date = models.DateTimeField(blank=True, null=True)

    class Meta:
        ordering = ['-payment_date']

    def __str__(self):
        return self.transaction_id or f'Payment-{self.id}'
