from dataclasses import fields
from rest_framework import serializers
from core.models import *

class TaskSerializer(serializers.ModelSerializer):
    class Meta:
        model = Task
        fields = '__all__'