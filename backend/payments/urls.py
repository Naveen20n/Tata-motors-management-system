from django.urls import path

from .views import PaymentCreateAPIView, PaymentDetailAPIView

urlpatterns = [
    path('payments/create/', PaymentCreateAPIView.as_view(), name='payment-create'),
    path('payments/<int:pk>/', PaymentDetailAPIView.as_view(), name='payment-detail'),
]
