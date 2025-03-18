import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/Model/extraModel.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../LinksConnect/LinksAPI.dart';
import '../../Screen/InfoRooms/rowOfAmenities.dart';

class listOfExtraPopularAmenities extends StatelessWidget {
  const listOfExtraPopularAmenities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataRoom_Controller dataRoom_Controller = Get.put(DataRoom_Controller());

    return Container(
      height: 200,
      width: double.infinity,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 4,
            mainAxisSpacing: 10,
          ),
          physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: dataRoom_Controller.popularAmenities.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Service(
              selectCat: index,
              extraModel: ExtraModel.fromJson(dataRoom_Controller.popularAmenities[index]),
            );
          }),
    );
  }
}

class Service extends GetView<HomePageHotelApp_ControllerImp> {
  final ExtraModel extraModel;
  final int selectCat;

  const Service({
    required this.selectCat,
    Key? key,
    required this.extraModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataRoom_Controller dataRoom_Controller = Get.put(DataRoom_Controller());
    return RowOfAmenities(
        icon1: "${LinksApp.linkImag}/${extraModel.extraImg}",
        text1: "${translateDB(extraModel.extraNameAr, extraModel.extraName)}",
        ColorBg: ColorApp.thirdColor);
  }
}
