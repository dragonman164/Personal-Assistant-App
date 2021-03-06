from django.contrib import admin
from .models import RequestModel,SystemTrackingDetails,WebCamImageHandler,UsingMobile
admin.site.register(RequestModel)
admin.site.register(SystemTrackingDetails)
admin.site.register(WebCamImageHandler)
admin.site.register(UsingMobile)
# Register your models here.