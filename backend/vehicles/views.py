from django.db.models import Q
from rest_framework import generics, status
from rest_framework.response import Response

from .models import Vehicle, VehicleVariant
from .serializers import VehicleSerializer, VehicleVariantSerializer


class VehicleListCreateAPIView(generics.ListCreateAPIView):
    queryset = Vehicle.objects.all()
    serializer_class = VehicleSerializer

    def get_queryset(self):
        queryset = Vehicle.objects.all()

        search = self.request.query_params.get('search', '').strip()
        category = self.request.query_params.get('category')
        fuel_type = self.request.query_params.get('fuel_type')
        status = self.request.query_params.get('status')
        min_price = self.request.query_params.get('min_price')
        max_price = self.request.query_params.get('max_price')

        if search:
            queryset = queryset.filter(
                Q(name__icontains=search)
                | Q(category__icontains=search)
                | Q(fuel_type__icontains=search)
                | Q(body_type__icontains=search)
                | Q(description__icontains=search)
            )

        if category:
            queryset = queryset.filter(category__iexact=category)

        if fuel_type:
            queryset = queryset.filter(fuel_type__iexact=fuel_type)

        if status:
            queryset = queryset.filter(status__iexact=status)

        if min_price:
            queryset = queryset.filter(starting_price__gte=min_price)

        if max_price:
            queryset = queryset.filter(starting_price__lte=max_price)

        return queryset.order_by('-created_at')

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)


class VehicleRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    queryset = Vehicle.objects.all()
    serializer_class = VehicleSerializer


class VehicleVariantListCreateAPIView(generics.ListCreateAPIView):
    serializer_class = VehicleVariantSerializer

    def get_queryset(self):
        vehicle_id = self.kwargs.get('vehicle_id')
        return VehicleVariant.objects.filter(vehicle_id=vehicle_id).order_by('name')

    def perform_create(self, serializer):
        vehicle_id = self.kwargs.get('vehicle_id')
        vehicle = Vehicle.objects.get(pk=vehicle_id)
        serializer.save(vehicle=vehicle)


class VehicleVariantRetrieveUpdateDestroyAPIView(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = VehicleVariantSerializer

    def get_queryset(self):
        vehicle_id = self.kwargs.get('vehicle_id')
        return VehicleVariant.objects.filter(vehicle_id=vehicle_id)
