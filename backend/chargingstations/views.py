from rest_framework import generics

from .models import ChargingStation
from .serializers import ChargingStationSerializer


class ChargingStationListAPIView(generics.ListAPIView):
    queryset = ChargingStation.objects.all()
    serializer_class = ChargingStationSerializer
