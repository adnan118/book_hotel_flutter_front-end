import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../Controller/onBoarding_Controller.dart';
import '../Widget/OnBoarding/CustomBtnContinue.dart';
import '../Widget/OnBoarding/CustomDottController.dart';
import '../Widget/OnBoarding/CustomSliderBody.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OnBoarding_ControllerImp onBoarding_ControllerImp =
        Get.put(OnBoarding_ControllerImp());
    return Scaffold(
      backgroundColor: ColorApp.bacground,
      body: Container(
          padding: EdgeInsets.only(top: 50,left: 20,right: 20),
          width: double.infinity,
          child: SafeArea(
              child: Column(
            children: [
              Expanded(
                flex: 6,
                child: CustomSliderBody(),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CustomDottController(),
                      SizedBox(
                        height: 15,
                      ),
                      CustomBtnContinue(),
                    ],
                  ))
            ],
          ))),
    );
  }
}
