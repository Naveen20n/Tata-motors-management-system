from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient

from .models import Vehicle


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
