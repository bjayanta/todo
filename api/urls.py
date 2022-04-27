from django.urls import path, include
from rest_framework import routers
from .views import *

route = routers.DefaultRouter()
route.register("task", TaskView, basename="task")

urlpatterns = [
    path("", include(route.urls)),
]
