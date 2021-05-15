from django.urls import path
from .views import RequestHandleList,index,SystemTrackingDetailsHandler,WebCamImageList,UsingMobileList
urlpatterns = [
  path('api1/',RequestHandleList.as_view(),name="RequestHandler"),
  path('',index,name="index"),
  path('api2/',SystemTrackingDetailsHandler.as_view(),name="SystemDetails"),
  path('api3/',WebCamImageList.as_view(),name="WebCam"),
  path('api4/',UsingMobileList.as_view(),name="UsingMobile")
]
