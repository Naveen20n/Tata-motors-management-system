from rest_framework import generics

from .models import Wishlist
from .serializers import WishlistSerializer


class WishlistListCreateAPIView(generics.ListCreateAPIView):
    queryset = Wishlist.objects.all()
    serializer_class = WishlistSerializer


class WishlistDestroyAPIView(generics.DestroyAPIView):
    queryset = Wishlist.objects.all()
    serializer_class = WishlistSerializer
