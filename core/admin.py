from django.contrib import admin
from .models import *

# Register your models here.
# admin.site.register(Task)

@admin.register(Task)
class TaskAdmin(admin.ModelAdmin):
    list_display = ['id', 'title', 'status', 'created_at', 'updated_at',]