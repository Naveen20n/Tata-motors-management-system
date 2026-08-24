from django.urls import path

from .views import VehicleListCreateAPIView, VehicleRetrieveUpdateDestroyAPIView

urlpatterns = [
    path('vehicles/', VehicleListCreateAPIView.as_view(), name='vehicle-list-create'),
    path('vehicles/<int:pk>/', VehicleRetrieveUpdateDestroyAPIView.as_view(), name='vehicle-detail'),
]
