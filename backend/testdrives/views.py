from rest_framework import generics

from .models import TestDrive
from .serializers import TestDriveSerializer


class TestDriveListCreateAPIView(generics.ListCreateAPIView):
    queryset = TestDrive.objects.all()
    serializer_class = TestDriveSerializer


class TestDriveRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = TestDrive.objects.all()
    serializer_class = TestDriveSerializer
