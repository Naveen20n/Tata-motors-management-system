from django.urls import path

from .views import WishlistDestroyAPIView, WishlistListCreateAPIView

urlpatterns = [
    path('wishlist/', WishlistListCreateAPIView.as_view(), name='wishlist-list-create'),
    path('wishlist/<int:pk>/', WishlistDestroyAPIView.as_view(), name='wishlist-detail'),
]
