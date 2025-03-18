import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/onBoarding_Controller.dart';
import '../../Core/Constant/color.dart';
import '../../Data/DataSource/Static/static.dart';

class CustomDottController extends StatelessWidget {
  const CustomDottController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoarding_ControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingModelList.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.only(right: 12),
                          duration: Duration(milliseconds: 900),
                          width: controller.CurrentPage == index ? 25 : 6,
                          height: controller.CurrentPage == index ? 8 : 6,
                          decoration: BoxDecoration(
                              color:controller.CurrentPage == index ? ColorApp.primaryColor : ColorApp.thirdColor ,
                              borderRadius: BorderRadius.circular(3)),
                        )),
              ],
            ));
  }
}
