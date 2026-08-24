from django.db import models

from dealerships.models import Dealership
from users.models import User
from vehicles.models import Vehicle, VehicleVariant


class Booking(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='bookings')
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE)
    variant = models.ForeignKey(VehicleVariant, on_delete=models.CASCADE, null=True, blank=True)
    dealership = models.ForeignKey(Dealership, on_delete=models.CASCADE)
    booking_number = models.CharField(max_length=50, unique=True)
    booking_amount = models.DecimalField(max_digits=12, decimal_places=2)
    total_amount = models.DecimalField(max_digits=12, decimal_places=2)
    status = models.CharField(max_length=20, default='pending')
    delivery_date = models.DateField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return self.booking_number
