from django.db import models

# Create your models here.
class Task(models.Model):
    title = models.CharField(max_length=120)
    status = models.CharField(max_length=50, default='pendind')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
    