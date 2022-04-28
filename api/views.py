# from rest_framework.views import APIView
# from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet
from core.models import *
from .serializers import *

# Create your views here.
# class TaskView(APIView):
#     def get(self, request):
#         query = Task.objects.all()
#         serializer = TaskSerializer(query, many=True)

#         return Response(serializer.data)

#     def post(self, request):
#         inputs = request.data
#         print(inputs)

#         serializer = TaskSerializer(data=inputs)

#         if serializer.is_valid():
#             serializer.save() 
#             return Response({"message": "Data has been saved."})

#         return Response({"message": "Submited data is found."})

class TaskView(ModelViewSet):
    serializer_class = TaskSerializer
    queryset = Task.objects.all()
