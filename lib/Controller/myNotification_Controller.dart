import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../Classes/HandlingDataController.dart';
import '../Core/Services/services.dart';
import '../DB/statusRequest.dart';
import '../Data/DataSource/Remote/notificationRemoteData.dart';
import '../Data/Model/NotificationModel.dart';

class MyNotification_Controller extends GetxController {
  TextEditingController searchController = TextEditingController();
  NotificationRemoteData notificationRemoteData = NotificationRemoteData(Get.find());

  List  not = [];

  late StatusRequest statusRequest ;
  Myservices myservices =Get.find();

  NotificationModel ?notificationModel;
  getData()async{

     //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationRemoteData.getDataNotification(
        myservices.sharedPref.getInt("users_id").toString()!
    );
    print("$response *****");
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){

        List responseData=response["data"];

        not.addAll(responseData.map((e) => NotificationModel.fromJson(e)));

      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  @override
  void onInit() {
    searchController = TextEditingController();
    getData();
    super.onInit();
  }
}
