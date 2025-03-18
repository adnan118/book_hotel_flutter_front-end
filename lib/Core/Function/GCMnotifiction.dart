import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

import '../../Controller/myNotification_Controller.dart';
import '../../Controller/orders/pandingController.dart';
import '../Constant/color.dart';
import '../Services/services.dart';
Myservices myservices =Get.find();

requestPermissionNotifiction()async{
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}MyNotification_Controller myNotification_Controller = Get.put(MyNotification_Controller());
GCMnotifiction(){


  FirebaseMessaging.onMessage.listen((remoteMsg) {
     print("*********title GCMnotifiction ${remoteMsg.notification!.title}*********");
    print("*********body GCMnotifiction ${remoteMsg.notification!.body}*********");
    Get.snackbar(remoteMsg.notification!.title!, remoteMsg.notification!.body!);
    /* myNotification_Controller.not.g

    add(
        ListTile(
          title: Text("${remoteMsg.notification!.title}",style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Genos",
            fontSize: 20,
            color: ColorApp.primaryColor,
            height: 1.5,
          ),),
          subtitle: Text("${remoteMsg.notification!.body}",style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Genos",
            fontSize: 20,
            color: ColorApp.blacklight,
            height: 1.5,
          ),),
        )
    )*/
    ;

print(  myNotification_Controller.not);

    refreshBookingNotifiction(remoteMsg.data);
  });
}

refreshBookingNotifiction(data){
  print("pageid             pagename           refreshBookingNotifiction          ");
  print(data["pageid"]);
  print(data["pagename"]);
  print("currentRoute     ");
  print(Get.currentRoute);

  if(Get.currentRoute == "/MainTapOrders" && data["pagename"] =="refreshPendingBook"){
    print("refresh page  PendingBook    ");
    PandingOrders_Controller pandingOrders_Controller= Get.find();
   pandingOrders_Controller.refreshPendingBook();
  }
}
