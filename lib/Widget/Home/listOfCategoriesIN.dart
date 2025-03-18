import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Screen/homeHotelApp.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Controller/rooms_Controler.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../LinksConnect/LinksAPI.dart';

class listOfCategoriesIN extends StatelessWidget {
  const listOfCategoriesIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rooms_Controller rooms_controller = Get.put(Rooms_Controller());

    return Container(
        height: 70,
        child: ListView.builder(
            physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: rooms_controller.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Catogaries(
                selectCat: index,
                catModel:
                    CatModel.fromJson(rooms_controller.categories[index]),
              );
            }));
  }
}

class Catogaries extends GetView<Rooms_Controller> {
  final CatModel catModel;
  final int selectCat;

  const Catogaries({
    required this.selectCat,
    Key? key,
    required this.catModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rooms_Controller rooms_controller = Get.put(Rooms_Controller());
    HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp = Get.put(HomePageHotelApp_ControllerImp());

    return Row(
      children: [
        BottomBar(
          border:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          height: 70,
          padding: EdgeInsets.all(15),
          selectedIndex: 0,
          onTap: (int page) {
            //        rooms_controller.changPageCategories(
            //          rooms_controller.CurrentPageCategories);

            rooms_controller.changeCat(
                selectCat!, catModel.categoriesId!.toString());
            homePageHotelApp_ControllerImp.changPageCategories(selectCat);
            homePageHotelApp_ControllerImp.CurrentPageCategories=selectCat!;
            print("00000000000000000");

            print(
                "${controller.categories}, $selectCat, ${catModel.categoriesId}");
          },
          itemPadding: EdgeInsets.all(8),
          mainAxisAlignment: MainAxisAlignment.center,
          items: <BottomBarItem>[
            BottomBarItem(
              backgroundColorOpacity: 0.3,
              icon: Row(
                children: [
                  Text("  "),
                  Image.network(
                    "${LinksApp.linkImag}/${catModel.categoriesImg}",
                    color: ColorApp.primaryColor,
                  )
                ],
              ),
              title: Text(
                "${translateDB(catModel.categoriesNameAr, catModel.categoriesName)}",
                style: TextStyle(
                    color: ColorApp.primaryColor, fontWeight: FontWeight.bold),
              ),
              activeColor: ColorApp.thirdColor,
              inactiveColor: ColorApp.secandryColor,
            ),
          ],
        ),
      ],
    );
  }
}
