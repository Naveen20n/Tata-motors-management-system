from django.db import models


class Vehicle(models.Model):
    class VehicleStatus(models.TextChoices):
        ACTIVE = 'active', 'Active'
        INACTIVE = 'inactive', 'Inactive'
        COMING_SOON = 'coming_soon', 'Coming Soon'
        DISCONTINUED = 'discontinued', 'Discontinued'

    name = models.CharField(max_length=150)
    category = models.CharField(max_length=100, db_index=True)
    fuel_type = models.CharField(max_length=50, db_index=True)
    body_type = models.CharField(max_length=80, blank=True, null=True)
    starting_price = models.DecimalField(max_digits=12, decimal_places=2, db_index=True)
    description = models.TextField(blank=True, null=True)
    status = models.CharField(
        max_length=20,
        choices=VehicleStatus.choices,
        default=VehicleStatus.ACTIVE,
        db_index=True,
    )
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['name']),
            models.Index(fields=['category']),
            models.Index(fields=['fuel_type']),
            models.Index(fields=['status']),
            models.Index(fields=['starting_price']),
        ]
        verbose_name = 'Vehicle'
        verbose_name_plural = 'Vehicles'

    def __str__(self):
        return self.name


class VehicleVariant(models.Model):
    vehicle = models.ForeignKey('Vehicle', related_name='variants', on_delete=models.CASCADE)
    name = models.CharField(max_length=120)
    price = models.DecimalField(max_digits=12, decimal_places=2)
    engine = models.CharField(max_length=100, blank=True, null=True)
    power = models.CharField(max_length=80, blank=True, null=True)
    torque = models.CharField(max_length=80, blank=True, null=True)
    mileage = models.CharField(max_length=80, blank=True, null=True)
    battery_capacity = models.CharField(max_length=80, blank=True, null=True)
    range_km = models.CharField(max_length=80, blank=True, null=True)
    transmission = models.CharField(max_length=80, blank=True, null=True)
    seating_capacity = models.IntegerField(blank=True, null=True)
    boot_space = models.CharField(max_length=80, blank=True, null=True)
    warranty = models.CharField(max_length=100, blank=True, null=True)

    class Meta:
        ordering = ['name']
        indexes = [
            models.Index(fields=['vehicle', 'name']),
            models.Index(fields=['price']),
        ]
        verbose_name = 'Vehicle Variant'
        verbose_name_plural = 'Vehicle Variants'

    def __str__(self):
        return f'{self.vehicle.name} - {self.name}'
