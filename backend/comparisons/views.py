from rest_framework import generics

from .models import Comparison
from .serializers import ComparisonSerializer


class ComparisonListCreateAPIView(generics.ListCreateAPIView):
    queryset = Comparison.objects.all()
    serializer_class = ComparisonSerializer


class ComparisonDestroyAPIView(generics.DestroyAPIView):
    queryset = Comparison.objects.all()
    serializer_class = ComparisonSerializer
