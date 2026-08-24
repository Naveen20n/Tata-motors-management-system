from django.urls import path

from .views import ChargingStationListAPIView

urlpatterns = [
    path('charging-stations/', ChargingStationListAPIView.as_view(), name='charging-stations-list'),
]
