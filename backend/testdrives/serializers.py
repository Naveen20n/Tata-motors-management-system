from rest_framework import serializers

from .models import TestDrive


class TestDriveSerializer(serializers.ModelSerializer):
    class Meta:
        model = TestDrive
        fields = [
            'id', 'user', 'vehicle', 'variant', 'dealership', 'test_drive_date', 'test_drive_time',
            'address', 'status', 'notes', 'created_at'
        ]
        read_only_fields = ['id', 'created_at']
