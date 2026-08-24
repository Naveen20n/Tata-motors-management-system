from rest_framework import generics

from .models import RecommendationRequest
from .serializers import RecommendationRequestSerializer


class RecommendationCreateAPIView(generics.CreateAPIView):
    queryset = RecommendationRequest.objects.all()
    serializer_class = RecommendationRequestSerializer
