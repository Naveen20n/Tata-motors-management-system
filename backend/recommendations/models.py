from django.db import models


class RecommendationRequest(models.Model):
    budget = models.DecimalField(max_digits=12, decimal_places=2)
    fuel_type = models.CharField(max_length=50, blank=True, null=True)
    usage = models.CharField(max_length=50, blank=True, null=True)
    passengers = models.IntegerField(default=4)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Recommendation-{self.id}'
