from django.urls import path

from .views import RecommendationCreateAPIView

urlpatterns = [
    path('recommendations/', RecommendationCreateAPIView.as_view(), name='recommendation-create'),
]
