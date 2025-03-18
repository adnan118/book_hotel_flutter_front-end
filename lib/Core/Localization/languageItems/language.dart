import 'package:book_hotel/Core/Constant/imageasset.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../changelocal.dart';
import 'CustombtnLang.dart';


class Language extends GetView<LocalController> {
  const Language({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("chooseLanguage".tr ,style: Theme.of(context).textTheme.titleLarge,),
            SizedBox(height: 100),
            Image.asset(ImageAssetApp.selectlanguage,width: 300,height: 300,fit: BoxFit.contain,),
            CustombtnLanguage(textBtn: "عربي", onPressed: (){
              controller.changeLanguage("ar");
              Get.toNamed("/OnBoarding");
            },),
            CustombtnLanguage(textBtn: "English", onPressed: (){
              controller.changeLanguage("en");
              Get.toNamed("/OnBoarding");
            },),
          ],
        ),
      ),
    );
  }
}
