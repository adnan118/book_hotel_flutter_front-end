import 'dart:io';

import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> AlertExitApp(){
   Get.defaultDialog(
    title: "Alert".tr,
    middleText: "bodyAlert".tr,titleStyle: TextStyle(fontSize: 22),
    actions: [
      ElevatedButton(
          style:  ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorApp.primaryColor),
      ),
           onPressed: (){
            exit(0);
          },
          child: Text("btnConfirm".tr,    style: TextStyle(fontSize: 12),
          )
      ),SizedBox(width: 30,),
      ElevatedButton(
          style:  ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(ColorApp.secandryColor),
          ),
          onPressed: (){
            Get.back();
          },
          child: Text("btnCancel".tr,style: TextStyle(fontSize: 12),)
      ),
    ]
  );


   return Future.value(true);
}