from django.urls import path

from .views import BookingListCreateAPIView, BookingRetrieveUpdateAPIView

urlpatterns = [
    path('bookings/', BookingListCreateAPIView.as_view(), name='booking-list-create'),
    path('bookings/<int:pk>/', BookingRetrieveUpdateAPIView.as_view(), name='booking-detail'),
]
