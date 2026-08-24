from django.contrib.auth import get_user_model
from django.test import TestCase
from django.urls import reverse
from rest_framework import status
from rest_framework.test import APIClient

User = get_user_model()


class AuthAPITests(TestCase):
    def setUp(self):
        self.client = APIClient()

    def test_register_user(self):
        payload = {
            'username': 'demouser',
            'email': 'demo@example.com',
            'password': 'StrongPass123',
            'first_name': 'Demo',
            'last_name': 'User',
        }

        response = self.client.post(reverse('register'), payload, format='json')

        self.assertEqual(response.status_code, status.HTTP_201_CREATED)
        self.assertTrue(User.objects.filter(username='demouser').exists())
        self.assertIn('user', response.data)
        self.assertIn('access', response.data)
        self.assertIn('refresh', response.data)

    def test_login_user(self):
        User.objects.create_user(
            username='loginuser',
            email='login@example.com',
            password='StrongPass123',
        )

        payload = {
            'username': 'loginuser',
            'password': 'StrongPass123',
        }

        response = self.client.post(reverse('login'), payload, format='json')

        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertIn('access', response.data)
        self.assertIn('refresh', response.data)
