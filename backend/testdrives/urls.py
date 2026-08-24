from django.urls import path

from .views import TestDriveListCreateAPIView, TestDriveRetrieveUpdateDestroyAPIView

urlpatterns = [
    path('test-drives/', TestDriveListCreateAPIView.as_view(), name='test-drive-list-create'),
    path('test-drives/<int:pk>/', TestDriveRetrieveUpdateDestroyAPIView.as_view(), name='test-drive-detail'),
]
