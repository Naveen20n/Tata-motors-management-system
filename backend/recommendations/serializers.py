from rest_framework import serializers

from .models import RecommendationRequest


class RecommendationRequestSerializer(serializers.ModelSerializer):
    class Meta:
        model = RecommendationRequest
        fields = ['id', 'budget', 'fuel_type', 'usage', 'passengers', 'created_at']
        read_only_fields = ['id', 'created_at']
