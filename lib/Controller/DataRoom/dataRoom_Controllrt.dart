import 'package:book_hotel/Controller/book_Controller.dart';
import 'package:book_hotel/Data/Model/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/bookRemoteData.dart';
import '../../Data/DataSource/Remote/extraRemoteData.dart';

class DataRoom_Controller extends GetxController {
  Book_Controller book_controller = Get.put(Book_Controller());


  var firstDate = DateTime(2024);
  var lastDate = DateTime(2050);
  List<DateTime?> ListDatevalue=[DateTime.now()  ];
  DateTime checkin=DateTime.now();
  DateTime checkout=DateTime.now();
  int daysDifference=1 ;
  int travelers=2;

  StatusRequest statusRequest =StatusRequest.none;
  late RoomModel roomModel =Get.arguments["roomModel"];

  ExtraRemoteData extraRemoteData =   ExtraRemoteData(Get.find());
  Myservices myservices =Get.find();
  List extra=[ ];
  List popularAmenities=[ ];


  intialData()async{
    statusRequest = StatusRequest.loading;
    roomModel=Get.arguments["roomModel"];
    statusRequest = StatusRequest.success;
    update();
  }

  goToCustomBooking() {
    Get.toNamed("/CustomBooking");
  }


  chooseDate() async {
    firstDate = DateTime(2024);
    lastDate = DateTime(2050);
    final result = await showDateRangePicker(
      context: Get.context!,
      firstDate: firstDate,
      lastDate: lastDate,

    );

    if (result != null) {
      firstDate = result.start;
      lastDate = result.end;
    }
    update();
  }

  @override
  void rfsh() {
    update();
  }

  ///////////////////////// get  data Extra
  @override
  getDataExtra(typeExtra1Service0Popular) async {
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await extraRemoteData.getDataExtra(typeExtra1Service0Popular);
    print("$response *****");
    //
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        extra.addAll(response["data"]);
        print(extra);
        //  myservices.sharedPref.setInt("sellingoffers_timeDelivery", sellingoffers_timeDelivery);
      } else {
        statusRequest = StatusRequest.failuer; print("extra");
      }
    }
    update();
  }
  ///////////////////////////////////////////
  ///////////////////////// get  data PopularAmenities
  @override
  getDataPopularAmenities(typeExtra1Service0Popular) async {
    //loading
    statusRequest = StatusRequest.loading;
    var response = await extraRemoteData.getDataExtra(typeExtra1Service0Popular);
    print("$response *****");
    //
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        popularAmenities.addAll(response["data"]);
        print(popularAmenities);
      } else {
        statusRequest = StatusRequest.failuer; print("popularAmenities");
      }
    }
    update();
  }

  ///////////////////////////////////////////
  addonline(){
    //add( "${productModel.productId}");
    travelers++;
    update();
  }
  removeonline(){
    if(travelers>0){
      //   remove( "${productModel.productId}");
      travelers--;
      update();
    }
  }










  @override
  void onInit() {
    getDataExtra(1);
    getDataPopularAmenities(0);
    super.onInit();
  }
}
