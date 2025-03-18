import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Classes/HandlingDataController.dart';
import '../Core/Constant/color.dart';
import '../Core/Function/checkInternet.dart';
import '../Core/Services/services.dart';
import '../DB/statusRequest.dart';
import '../Data/DataSource/Remote/FavoritViewRemote.dart';
import '../Data/Model/favoriteModel.dart';



 class MyFavoriteController extends GetxController {

//check internet

  int ?roomFavorit;


  var result;



  initialdataCheckInternet()async {
    result = await checkInternet();
    print(result);
  }
  ///////////////////////////////////////////////
  List<FavoriteModel> data =[];

  late StatusRequest statusRequest ;
  Myservices myservices =Get.find();
  FavoritViewRemoteData favoritViewRemoteData = FavoritViewRemoteData(Get.find());


  getData()async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoritViewRemoteData.getData(
        myservices.sharedPref.getInt("users_id").toString()!
    );
    print("$response *****");
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){

           List responseData=response["data"];
           roomFavorit=response["data"][0]["favorite_roomid"];
        data.addAll(responseData.map((e) => FavoriteModel.fromJson(e)));
         print("$roomFavorit +++++++++++++++++------");
       }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }


  goToMyFavorit(){
    Get.toNamed("/MyFavorit");getData();
  }
  addFavorit(roomId)async{
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await favoritViewRemoteData.favoritAddRemoteData(myservices.sharedPref.getInt("users_id").toString()!,roomId);
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
     //   roomFavorit = roomId;

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

  deletFavorit(favorite_id){
     var response =
     favoritViewRemoteData.favoritDeleteRemoteData(favorite_id);
    print("$response *****");
    //
    statusRequest =handlingData(response);
    data.removeWhere((element) => element.favoriteId==favorite_id);
     roomFavorit = 0;


     Get.rawSnackbar(
       backgroundColor: ColorApp.primaryColor.withOpacity(0.8),
       borderRadius: 20,
       margin: EdgeInsets.symmetric(horizontal: 3),
       title: "Done".tr,
       messageText: Text("bodyDoneDelete".tr,style: TextStyle(color: ColorApp.blackdark, fontSize: 15),),
     );
    update();
  }
  // delet on line
  removeDataFrommyfavorite( favorite_roomid){
    var response =  favoritViewRemoteData.favoritRemoveRemoteData(myservices.sharedPref.getInt("users_id").toString()!,favorite_roomid);
    data.removeWhere(
            (element) => element.favoriteId==favorite_roomid
    );

    update();
  }
  @override
  void onInit() {
    initialdataCheckInternet();
    getData();
     super.onInit();
  }
}