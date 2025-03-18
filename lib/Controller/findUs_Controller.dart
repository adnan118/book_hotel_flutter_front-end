import 'dart:collection';
import 'dart:io';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:async';
 import 'package:google_maps_flutter/google_maps_flutter.dart';

class FindUs_Controller extends GetxController{
 static LatLng localHotel =LatLng(35.1360881, 36.7542622);
 static LatLng localMy =LatLng(35.1360881, 36.7542622);


  Completer<GoogleMapController> ?completerController ;

  CameraPosition kGooglePlex=CameraPosition(
    bearing: 350,
    target: localHotel,
    zoom: 15,
  ) ;

 var customColor =ColorApp.primaryColor;
  var marker=HashSet<Marker>();//array //collection
  Set <Marker>Mymarker={
    /// location of hotel
    Marker(
        markerId: MarkerId("hotel"),
        position:localHotel,
        infoWindow:InfoWindow(
            title: "Afamia Alcham  by Adnan Barakat",
            snippet: "Hotel 4 stars",onTap: (){print("Hotel 4 stars");}),
        onTap: (){
          print("marker");
        },

         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),//تغييير لون الماركير


        visible: true//هل الماركير ظاهر
    ),

  };
  late BitmapDescriptor customMarker;//attribute





 ////////////////////////////////// حساب المسافة بين نقطتين
 var distanceKM=0/1000;
 getDistanceTwoPoint(){

   var startLatitude = localHotel.latitude;
   var startLongitude= localHotel.longitude;
   var endLatitude=localMy.latitude;
   var endLongitude=localMy.longitude;
   var distanceBetween =  Geolocator.distanceBetween(startLatitude, startLongitude, endLatitude, endLongitude);
   distanceKM=distanceBetween/1000;//covers to kilo mater
   update();
 }


 //////////////////////////////// LiveLocation
 var printlat;
 var printlon;
 Position? MyCurrentLocation;
 late StreamSubscription<Position> ps;

 void initState() {
   ps=Geolocator.getPositionStream().listen((Position position) {
     print(position == null?'unknown':position.latitude.toString()+','+position.longitude.toString());

   });
   getLatAndLong();
   update();
 }

 Future<Position> getLatAndLong()async{
   update();
   return  await Geolocator.getCurrentPosition().then((value) => value);
 }


 ///////////////// Current Location
 myCurrentLocation()async{
   update();
 MyCurrentLocation=await getLatAndLong();
 printlat=(MyCurrentLocation?.latitude);
 printlon=(MyCurrentLocation?.longitude);
 localMy =LatLng(printlat,printlon);
 Mymarker.add(
   Marker(markerId: MarkerId('me'),
     position: FindUs_Controller.localMy,
     infoWindow: InfoWindow(
       title: "My Location Now ",
       snippet: "I am here",
       onTap: (){},
     ),
   ),
 );
 update();
}
  ///////////////////////////polygons
  Set<Polygon> myPolygon() {
    var polygonCoords = <LatLng>[];//list
    polygonCoords.add(localMy);
    polygonCoords.add(localHotel);

    var polygonSet = new Set<Polygon>();
    polygonSet.add(Polygon(
        polygonId: PolygonId('1'),
        points: polygonCoords,
        strokeColor: ColorApp.thirdColor,
        strokeWidth: 2,

    ),);
update();
    return polygonSet;
  }


  //////////////////////// Circle
 Set<Circle> mycircles = Set.from(
     [Circle(
       circleId: CircleId('1'),
       center: localHotel,
       radius: 40,
       strokeWidth: 1,
       fillColor: ColorApp.thirdColor.withOpacity(0.1),
     )]
 );

 //////////////////// get Permission

 Future getPermission() async {
   bool services;
   LocationPermission per;

   // Test if location services are enabled.
   services = await Geolocator.isLocationServiceEnabled();//تحقق من ان خدمة الموقع مفعلة ام لا

   if (services == false) {
     Get.defaultDialog(
         title: "Serveses",
         middleText: "Not enable location",
         confirmTextColor: Colors.white,
         cancelTextColor: Colors.orange,
         buttonColor: Colors.grey,
         onConfirm: (){exit(0);},
         onCancel: (){}
     );
   }
   per = await Geolocator.checkPermission();//فحص امكانية التطبيق الوصول للموقع

   if (per == LocationPermission.denied) {//اذا النتيجة ان التطبيق لايستطيع الوصول للموقع
     per = await Geolocator.requestPermission();//عاود طلب الوصول للموقع
     if (per == LocationPermission.always) {
       getLatAndLong();
     }

   }
 }

  ////////
 getInfoMyLocation()async{
  await getDistanceTwoPoint();
  await myCurrentLocation();
 }

 @override
  void onInit() {
    completerController =Completer<GoogleMapController>();
    //getDistanceTwoPoint();
   // myPolygon();



    initState();
   myCurrentLocation();
    getPermission();
    super.onInit();
  }

}