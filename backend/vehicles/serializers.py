from rest_framework import serializers

from .models import Vehicle, VehicleVariant


class VehicleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vehicle
        fields = [
            'id',
            'name',
            'category',
            'fuel_type',
            'body_type',
            'starting_price',
            'description',
            'status',
            'created_at',
            'updated_at',
        ]
        read_only_fields = ['id', 'created_at', 'updated_at']


class VehicleVariantSerializer(serializers.ModelSerializer):
    vehicle = serializers.PrimaryKeyRelatedField(read_only=True)

    class Meta:
        model = VehicleVariant
        fields = [
            'id',
            'vehicle',
            'name',
            'price',
            'engine',
            'power',
            'torque',
            'mileage',
            'battery_capacity',
            'range_km',
            'transmission',
            'seating_capacity',
            'boot_space',
            'warranty',
        ]
        read_only_fields = ['id', 'vehicle']
