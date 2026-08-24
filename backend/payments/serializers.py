from rest_framework import serializers

from .models import Payment


class PaymentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payment
        fields = ['id', 'booking', 'transaction_id', 'amount', 'payment_method', 'payment_status', 'payment_date']
        read_only_fields = ['id', 'payment_date']
