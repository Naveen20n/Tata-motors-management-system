from rest_framework import serializers

from .models import Dealership


class DealershipSerializer(serializers.ModelSerializer):
    class Meta:
        model = Dealership
        fields = [
            'id', 'name', 'address', 'city', 'state', 'pincode', 'phone', 'email',
            'latitude', 'longitude', 'opening_time', 'closing_time', 'status'
        ]
        read_only_fields = ['id']
