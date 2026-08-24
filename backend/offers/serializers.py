from rest_framework import serializers

from .models import Offer


class OfferSerializer(serializers.ModelSerializer):
    class Meta:
        model = Offer
        fields = ['id', 'title', 'description', 'offer_type', 'discount_value', 'start_date', 'end_date', 'status']
        read_only_fields = ['id']
