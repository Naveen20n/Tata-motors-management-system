from django.urls import path

from .views import ComparisonDestroyAPIView, ComparisonListCreateAPIView

urlpatterns = [
    path('comparisons/', ComparisonListCreateAPIView.as_view(), name='comparison-list-create'),
    path('comparisons/<int:pk>/', ComparisonDestroyAPIView.as_view(), name='comparison-detail'),
]
