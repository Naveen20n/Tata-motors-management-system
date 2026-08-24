from django.db import models


class ChargingStation(models.Model):
    name = models.CharField(max_length=150)
    address = models.TextField()
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    latitude = models.DecimalField(max_digits=10, decimal_places=8, blank=True, null=True)
    longitude = models.DecimalField(max_digits=11, decimal_places=8, blank=True, null=True)
    connector_type = models.CharField(max_length=100)
    charging_speed = models.CharField(max_length=80, blank=True, null=True)
    availability = models.CharField(max_length=20, default='available')
    operating_hours = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        ordering = ['city', 'name']

    def __str__(self):
        return self.name
