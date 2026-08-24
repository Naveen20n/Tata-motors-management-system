from django.db import models

from users.models import User
from vehicles.models import Vehicle


class Comparison(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='comparisons', null=True, blank=True)
    vehicle = models.ForeignKey(Vehicle, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-created_at']

    def __str__(self):
        return f'{self.vehicle.name}'
