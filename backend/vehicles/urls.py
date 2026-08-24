from django.urls import path

from .views import (
    VehicleListCreateAPIView,
    VehicleRetrieveUpdateDestroyAPIView,
    VehicleVariantListCreateAPIView,
    VehicleVariantRetrieveUpdateDestroyAPIView,
)

urlpatterns = [
    path('vehicles/', VehicleListCreateAPIView.as_view(), name='vehicle-list-create'),
    path('vehicles/<int:pk>/', VehicleRetrieveUpdateDestroyAPIView.as_view(), name='vehicle-detail'),
    path('vehicles/<int:vehicle_id>/variants/', VehicleVariantListCreateAPIView.as_view(), name='vehicle-variant-list-create'),
    path('vehicles/<int:vehicle_id>/variants/<int:pk>/', VehicleVariantRetrieveUpdateDestroyAPIView.as_view(), name='vehicle-variant-detail'),
]
