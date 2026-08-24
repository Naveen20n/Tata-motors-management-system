from rest_framework import serializers

from .models import ChargingStation


class ChargingStationSerializer(serializers.ModelSerializer):
    class Meta:
        model = ChargingStation
        fields = [
            'id', 'name', 'address', 'city', 'state', 'latitude', 'longitude',
            'connector_type', 'charging_speed', 'availability', 'operating_hours'
        ]
        read_only_fields = ['id']
