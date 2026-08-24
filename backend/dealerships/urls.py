from django.urls import path

from .views import DealershipListCreateAPIView, DealershipRetrieveUpdateDestroyAPIView

urlpatterns = [
    path('dealerships/', DealershipListCreateAPIView.as_view(), name='dealership-list-create'),
    path('dealerships/<int:pk>/', DealershipRetrieveUpdateDestroyAPIView.as_view(), name='dealership-detail'),
]
