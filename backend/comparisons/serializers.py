from rest_framework import serializers

from .models import Comparison


class ComparisonSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comparison
        fields = ['id', 'user', 'vehicle', 'created_at']
        read_only_fields = ['id', 'created_at']
