from django.db import models

# Create your models here.
class RequestModel(models.Model):
    query = models.CharField(max_length=200,null=False)
    time = models.TimeField(auto_now_add=True)

class SystemTrackingDetails(models.Model):
    time = models.TimeField(auto_now_add=True)
    battery_percentage = models.IntegerField(null=False)
    cpu_usage = models.FloatField(null=False)
    ram_usage = models.FloatField(null=False)
    disk_usage = models.FloatField(null=False)


class WebCamImageHandler(models.Model):
    time = models.TimeField(auto_now_add=True)
    file = models.FileField(blank = False,null = False)

class UsingMobile(models.Model):
    time = models.TimeField(auto_now_add=True)
    mobile = models.BooleanField(default=True)