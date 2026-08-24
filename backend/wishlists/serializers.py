from rest_framework import serializers

from .models import Wishlist


class WishlistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Wishlist
        fields = ['id', 'user', 'vehicle', 'created_at']
        read_only_fields = ['id', 'created_at']
