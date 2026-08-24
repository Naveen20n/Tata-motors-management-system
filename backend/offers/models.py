from django.db import models


class Offer(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    offer_type = models.CharField(max_length=50, default='discount')
    discount_value = models.DecimalField(max_digits=12, decimal_places=2, blank=True, null=True)
    start_date = models.DateField()
    end_date = models.DateField()
    status = models.CharField(max_length=20, default='active')

    class Meta:
        ordering = ['-start_date']

    def __str__(self):
        return self.title
