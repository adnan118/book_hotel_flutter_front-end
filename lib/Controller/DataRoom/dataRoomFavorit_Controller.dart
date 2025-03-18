import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/DataSource/Remote/FavoritViewRemote.dart';
import 'package:book_hotel/Data/Model/favoriteModel.dart';
import 'package:book_hotel/Data/Model/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/extraRemoteData.dart';

class DataRoomFavorit_Controller extends GetxController {
  var firstDate = DateTime(2024);
  var lastDate = DateTime(2050);
  List<DateTime?> ListDatevalue=[DateTime.now()  ];
     DateTime checkin=DateTime.now();
     DateTime checkout=DateTime.now();

   StatusRequest statusRequest =StatusRequest.none;
  late FavoriteModel favoriteModel =Get.arguments["favoritModel"];
  ExtraRemoteData extraRemoteData =   ExtraRemoteData(Get.find());
  FavoritViewRemoteData favoritViewRemoteData =   FavoritViewRemoteData(Get.find());
  Myservices myservices =Get.find();
  List extra=[];
  List popularAmenities=[];




  intialData()async{
    statusRequest = StatusRequest.loading;
    favoriteModel=Get.arguments["favoritModel"];
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
  /*
  ///////////////////////////////////////////
  addFavorit(roomId)async{
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoritViewRemoteData.favoritAddRemoteData(myservices.sharedPref.getInt("users_id").toString()!,roomId.toString());
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        Get.rawSnackbar(
          backgroundColor: ColorApp.primaryColor.withOpacity(0.8),
          borderRadius: 20,
          margin: EdgeInsets.symmetric(horizontal: 3),
          title: "Done".tr,
          messageText: Text("bodyDoneAdd".tr,style: TextStyle(color: ColorApp.blackdark,fontSize: 15),),
        );
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  deletFavorit(favorite_id)async{

    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response =
    await favoritViewRemoteData.favoritDeleteRemoteData(favorite_id);
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
      //  data.removeWhere((element) => element.favoriteId=favorite_id);

        Get.rawSnackbar(
         backgroundColor: ColorApp.primaryColor.withOpacity(0.8),
          borderRadius: 20,
          margin: EdgeInsets.symmetric(horizontal: 3),
          title: "Done".tr,
          messageText: Text("bodyDoneDelete".tr,style: TextStyle(color: ColorApp.blackdark, fontSize: 15),),
        );
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
*/
  @override
  void onInit() {
    super.onInit();
  }
}
