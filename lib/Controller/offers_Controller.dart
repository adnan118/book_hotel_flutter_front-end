import 'package:book_hotel/Core/Services/services.dart';
import 'package:book_hotel/Data/DataSource/Remote/offersRemoteData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Classes/HandlingDataController.dart';
import '../DB/statusRequest.dart';
import '../Data/Model/roomModel.dart';
import 'homePageHotelApp_Controler.dat.dart';

class Offers_Controller extends SearchMixController{
  OffersRemoteData offersRemoteData = OffersRemoteData(Get.find());
  Myservices myservices = Get.find();

  List <RoomModel>data=[];
  late StatusRequest statusRequest ;
  getData()async{
    //loading
    data.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await offersRemoteData.getData();
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listData2=response["data"];
        data.addAll(listData2.map((e) => RoomModel.fromJson(e)));


      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  goToRoomDetails(MyproductModel) {
    Get.toNamed("/DataRoom",arguments: {
      "roomModel":MyproductModel,
    });
  }
  goToFavorite(){
    Get.toNamed( "/MyFavorit");
  }
  @override
  void onInit() {
    getData();
    searchController=TextEditingController();
    super.onInit();
  }
}