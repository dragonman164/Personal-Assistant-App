from django.shortcuts import render,HttpResponse
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.parsers import MultiPartParser,FormParser
from .models import RequestModel,SystemTrackingDetails,WebCamImageHandler,UsingMobile
from .serializers import RequestModelSerializer,SystemTrackingDetailsSerializer,WebCamImageHandlerSerializer,UsingMobileSerializer


# Create your views here.
    
class RequestHandleList(APIView):
    def get(self,request):
        obj = RequestModel.objects.all()
        if len(obj) >=1:
            obj = obj[len(obj)-1]
        serializer = RequestModelSerializer(obj)
        return Response(serializer.data)

    def post(self,request):
        serializer = RequestModelSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status = status.HTTP_201_CREATED)
        return Response(serializer.errors,status = status.HTTP_400_BAD_REQUEST)


class SystemTrackingDetailsHandler(APIView):
    def get(self,request):
        obj = SystemTrackingDetails.objects.all()
        if len(obj) >=1:
            obj = obj[len(obj)-1]
        serializer = SystemTrackingDetailsSerializer(obj)
        return Response(serializer.data)

    def post(self,request):
        serializer = SystemTrackingDetailsSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status = status.HTTP_201_CREATED)
        return Response(serializer.errors,status = status.HTTP_400_BAD_REQUEST)


class WebCamImageList(APIView):
    parser_class = (MultiPartParser,FormParser)

    serializer_class = WebCamImageHandlerSerializer

    def get(self,request):

        obj = WebCamImageHandler.objects.all()
        if len(obj) >=1:
            obj = obj[len(obj)-1]
        serializer = WebCamImageHandlerSerializer(obj)
        return Response(serializer.data)

    def post(self,request):
        serializer = WebCamImageHandlerSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status = status.HTTP_201_CREATED)
        return Response(serializer.errors,status = status.HTTP_400_BAD_REQUEST)

class UsingMobileList(APIView):
    def get(self,request):
        obj = UsingMobile.objects.all()
        if len(obj) >=1:
            obj = obj[len(obj)-1]
        serializer = UsingMobileSerializer(obj)
        return Response(serializer.data)

    def post(self,request):
        serializer = UsingMobileSerializer(data = request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data,status = status.HTTP_201_CREATED)
        return Response(serializer.errors,status = status.HTTP_400_BAD_REQUEST)

def index(request):
    return HttpResponse("This is Sample Page .. ")