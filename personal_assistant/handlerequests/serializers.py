from rest_framework import serializers
from .models import RequestModel,SystemTrackingDetails,WebCamImageHandler,UsingMobile

class RequestModelSerializer(serializers.ModelSerializer):
    class Meta:
        model = RequestModel
        fields = '__all__'
    
class SystemTrackingDetailsSerializer(serializers.ModelSerializer):
    class Meta:
        model = SystemTrackingDetails
        fields = '__all__'

class WebCamImageHandlerSerializer(serializers.ModelSerializer):
    class Meta:
        model = WebCamImageHandler
        fields = '__all__'

class UsingMobileSerializer(serializers.ModelSerializer):
    class Meta:
        model = UsingMobile
        fields = '__all__'