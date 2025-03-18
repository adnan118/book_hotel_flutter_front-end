import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/onBoarding_Controller.dart';
import '../../Core/Constant/color.dart';

class CustomBtnContinue extends GetView<OnBoarding_ControllerImp> {
  const CustomBtnContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      height: 30,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: ColorApp.primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 50),
        onPressed: () {
          controller.next();
        },
        child: Text("btnContinue".tr, style: Theme.of(context).textTheme.labelLarge!.copyWith(color:ColorApp.bacground )),
      ),
    );
  }
}
