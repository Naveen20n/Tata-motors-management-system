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
