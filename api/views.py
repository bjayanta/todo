# from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet
from rest_framework.response import Response
from core.models import *
from .serializers import *

# Create your views here.
# class TaskView(APIView):
#     def get(self, request):
#         query = Task.objects.all()
#         serializer = TaskSerializer(query, many=True)

#         return Response(serializer.data)

class TaskView(ModelViewSet):
    serializer_class = TaskSerializer
    queryset = Task.objects.all()
