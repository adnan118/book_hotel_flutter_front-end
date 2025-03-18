import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Screen/homeHotelApp.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../LinksConnect/LinksAPI.dart';

class ListOfCategories extends StatelessWidget {
  const ListOfCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageHotelApp_ControllerImp hotelApp_ControllerImp =
        Get.put(HomePageHotelApp_ControllerImp());

    return Container(
      height: 70,
      child: ListView.builder(
          physics: BouncingScrollPhysics(parent: BouncingScrollPhysics()),
          itemCount: hotelApp_ControllerImp.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Catogaries(
              selectCat: index,
              catModel:
                  CatModel.fromJson(hotelApp_ControllerImp.categories[index]),
            );
          }),
    );
  }
}

class Catogaries extends GetView<HomePageHotelApp_ControllerImp> {
  final CatModel catModel;
  final int selectCat;

  const Catogaries({
    required this.selectCat,
    Key? key,
    required this.catModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageHotelApp_ControllerImp hotelApp_ControllerImp =
        Get.put(HomePageHotelApp_ControllerImp());
    return Row(
      children: [
        BottomBar(
          border:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          height: 70,
          padding: EdgeInsets.all(15),
          selectedIndex: hotelApp_ControllerImp.CurrentPageCategories,
          onTap: (int page) {
            hotelApp_ControllerImp.goToCategory(controller.categories,
                selectCat!, catModel.categoriesId!.toString());
            print(
                "${controller.categories}, $selectCat, ${catModel.categoriesId}");

            hotelApp_ControllerImp.changPageCategories(selectCat);
            hotelApp_ControllerImp.CurrentPageCategories = selectCat!;
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
                    color: ColorApp.blackdark,
                  )
                ],
              ),
              title: Text(
                  "${translateDB(catModel.categoriesNameAr, catModel.categoriesName)}",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 12, color: ColorApp.blackdark)),
              activeColor: ColorApp.primaryColor,
          //    inactiveColor: ColorApp.secandryColor,
            ),
          ],
        ),
      ],
    );
  }
}
