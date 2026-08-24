from django.urls import path

from .views import OfferDetailAPIView, OfferListAPIView

urlpatterns = [
    path('offers/', OfferListAPIView.as_view(), name='offer-list'),
    path('offers/<int:pk>/', OfferDetailAPIView.as_view(), name='offer-detail'),
]
