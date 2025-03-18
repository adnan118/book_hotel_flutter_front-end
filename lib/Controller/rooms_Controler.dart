import 'package:book_hotel/Data/Model/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Classes/HandlingDataController.dart';
import '../Core/Constant/color.dart';
import '../Core/Function/checkInternet.dart';
import '../Core/Services/services.dart';
import '../DB/statusRequest.dart';
import '../Data/DataSource/Remote/FavoritViewRemote.dart';
import '../Data/DataSource/Remote/RoomRemoteData.dart';
import '../Data/Model/favoriteModel.dart';


class Rooms_Controller extends GetxController{

//check internet

  var result;
   RoomModel? roomModel;

  List  categories=[];
  String? catid;
  int ? selectCategor;

  @override
  initialData() {
    //جاية من  homecontroller
    categories = Get.arguments["categor"];
    selectCategor = Get.arguments["selectCategor"];
    catid = Get.arguments["catid"];
    getData( catid! );
   }
  initialdataCheckInternet()async {
    result = await checkInternet();
    print(result);
  }
  ///////////////////////////////////////////////
  List data =[];

  late StatusRequest statusRequest ;
  Myservices myservices =Get.find();
  RoomRemoteData roomRemoteData = RoomRemoteData(Get.find());


  @override
  changeCat(val,catValId) {
    selectCategor=val;
    catid=catValId;
    getData(catid!);
    update();
  }
  getData(categories_id)async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await roomRemoteData.getData(categories_id,myservices.sharedPref.getInt("users_id").toString()!);

    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
      /////////////////
      List dataresponse= response["data"];
     // isFavorite = response["data"][0]["favorite_roomid"];
      // data.addAll(dataresponse.map((e) => RoomModel.fromJson(e)));
      data.addAll(response['data']);

        print(    categories);
        print(    catid);
        print(    selectCategor);
        print(    "length ${data.length}");

      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }


  @override
  void onInit() {
    initialdataCheckInternet();
    initialData();
    super.onInit();
  }
}