from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient

from .models import Vehicle, VehicleVariant


class VehicleListFiltersTests(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.url = reverse('vehicle-list-create')

        Vehicle.objects.create(
            name='Nexa EV',
            category='SUV',
            fuel_type='electric',
            body_type='SUV',
            starting_price=1450000,
            description='Electric SUV',
            status=Vehicle.VehicleStatus.ACTIVE,
        )
        Vehicle.objects.create(
            name='Altroz',
            category='Hatchback',
            fuel_type='petrol',
            body_type='Hatchback',
            starting_price=780000,
            description='Compact hatchback',
            status=Vehicle.VehicleStatus.ACTIVE,
        )
        Vehicle.objects.create(
            name='Harrier',
            category='SUV',
            fuel_type='diesel',
            body_type='SUV',
            starting_price=1650000,
            description='Advanced SUV',
            status=Vehicle.VehicleStatus.COMING_SOON,
        )

    def test_search_by_name(self):
        response = self.client.get(self.url, {'search': 'nexa'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(response.data[0]['name'], 'Nexa EV')

    def test_filter_by_category_and_price(self):
        response = self.client.get(self.url, {'category': 'SUV', 'min_price': 1000000, 'max_price': 1600000})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0]['name'], 'Nexa EV')

    def test_filter_by_status(self):
        response = self.client.get(self.url, {'status': 'coming_soon'})
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0]['name'], 'Harrier')


class VehicleVariantTests(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.vehicle = Vehicle.objects.create(
            name='Tiago EV',
            category='Hatchback',
            fuel_type='electric',
            body_type='Hatchback',
            starting_price=900000,
            description='Compact EV',
            status=Vehicle.VehicleStatus.ACTIVE,
        )
        self.list_url = reverse('vehicle-variant-list-create', kwargs={'vehicle_id': self.vehicle.pk})

    def test_list_variants_for_vehicle(self):
        VehicleVariant.objects.create(
            vehicle=self.vehicle,
            name='XE',
            price=900000,
            engine='Single Motor',
            power='74 bhp',
            torque='114 Nm',
            mileage='250 km',
            battery_capacity='19.2 kWh',
            range_km='250',
            transmission='Automatic',
            seating_capacity=5,
            boot_space='242 L',
            warranty='3 years',
        )

        response = self.client.get(self.list_url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertEqual(len(response.data), 1)
        self.assertEqual(response.data[0]['name'], 'XE')

    def test_create_variant_for_vehicle(self):
        payload = {
            'name': 'XM',
            'price': 980000,
            'engine': 'Single Motor',
            'power': '82 bhp',
            'torque': '120 Nm',
            'mileage': '260 km',
            'battery_capacity': '24 kWh',
            'range_km': '315',
            'transmission': 'Automatic',
            'seating_capacity': 5,
            'boot_space': '242 L',
            'warranty': '3 years',
        }

        response = self.client.post(self.list_url, payload, format='json')
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertEqual(response.data['name'], 'XM')
        self.assertEqual(response.data['vehicle'], self.vehicle.pk)
