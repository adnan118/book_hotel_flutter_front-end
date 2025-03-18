 import 'package:get/get.dart';

import '../../../Core/Constant/imageasset.dart';
import '../../Model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingModelList=[
  //1
  OnBoardingModel(
    title: "title1".tr,
    body: "body1".tr,
    image:ImageAssetApp.logo
  ),
//2
  OnBoardingModel(
      title: "title2".tr,
      body: "body2".tr,
      image:ImageAssetApp.customizeOnBoarding
  ),
//3
  OnBoardingModel(
      title: "title3".tr,
      body: "body3".tr,
      image:ImageAssetApp.servicesOnBoarding
  ),
//4
  OnBoardingModel(
      title: "title4".tr,
      body: "body4".tr,
      image:ImageAssetApp.pathOnBoarding
  ),
  //5
  OnBoardingModel(
      title: "title5".tr,
      body: "body5".tr,
      image:ImageAssetApp.getreadyOnBoarding
  ),
];