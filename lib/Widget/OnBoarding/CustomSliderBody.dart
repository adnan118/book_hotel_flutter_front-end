import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/onBoarding_Controller.dart';
import '../../Data/DataSource/Static/static.dart';

class CustomSliderBody extends GetView<OnBoarding_ControllerImp> {
  const CustomSliderBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: (val) {
          controller.onPageChanged(val);
          print(val);
        },
        itemCount: onBoardingModelList.length,
        itemBuilder: (context, i) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(onBoardingModelList[i].title!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge),

                Image.asset(
                  onBoardingModelList[i].image!,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Container(
                  child: Text(onBoardingModelList[i].body!,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge),
                ),
              ],
            ));
  }
}
