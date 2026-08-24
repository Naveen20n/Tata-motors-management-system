from django.db import models

from dealerships.models import Dealership
from users.models import User
from vehicles.models import Vehicle, VehicleVariant


class TestDrive(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='test_drives')
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE)
    variant = models.ForeignKey(VehicleVariant, on_delete=models.CASCADE, null=True, blank=True)
    dealership = models.ForeignKey(Dealership, on_delete=models.CASCADE)
    test_drive_date = models.DateField()
    test_drive_time = models.TimeField()
    address = models.TextField(blank=True, null=True)
    status = models.CharField(max_length=20, default='pending')
    notes = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f'{self.user} - {self.vehicle}'
