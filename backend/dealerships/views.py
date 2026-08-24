from rest_framework import generics

from .models import Dealership
from .serializers import DealershipSerializer


class DealershipListCreateAPIView(generics.ListCreateAPIView):
    queryset = Dealership.objects.all()
    serializer_class = DealershipSerializer


class DealershipRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Dealership.objects.all()
    serializer_class = DealershipSerializer
