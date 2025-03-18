import 'package:book_hotel/Core/Function/alertExitApp.dart';
import 'package:book_hotel/Widget/General/myAppBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../Controller/findUs_Controller.dart';
import '../Controller/homePageHotelApp_Controler.dat.dart';
import '../Controller/myFavorit_Controllrt.dart';
import '../Core/Constant/imageasset.dart';
import '../Core/Services/services.dart';
import '../LinksConnect/LinksAPI.dart';
import '../Widget/Home/appBarHome.dart';
import '../Widget/Home/btnNavigationBar.dart';

class homePageHotelApp extends StatelessWidget {
  homePageHotelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageHotelApp_ControllerImp hotelApp_ControllerImp =
        Get.put(HomePageHotelApp_ControllerImp());
    ViewProfile_Controller viewProfile_Controller =
        Get.put(ViewProfile_Controller());
    FindUs_Controller findUs_Controller = Get.put(FindUs_Controller());
    MyFavoriteController myFavoriteController = Get.put(MyFavoriteController());
    Myservices myservices = Get.find();

    return GetBuilder<HomePageHotelApp_ControllerImp>(
        builder: (controller) => Scaffold(
////////////////////////////////////////////////////////////////////////////////      BtnNavigationBar
              floatingActionButton: BtnNavigationBar(
                selectedIndex: controller.CurrentPage,
                onTap: (int page) {
                  controller.changPage(page);
                },
              ),
              floatingActionButtonLocation:
                  myservices.sharedPref.getString("myLang") == "ar"
                      ? FloatingActionButtonLocation.startFloat
                      : FloatingActionButtonLocation.endFloat,
////////////////////////////////////////////////////////////////////////////////      AppBar
              appBar: AppBar(
                flexibleSpace: AppBarHome(
                  searchController: controller.searchController!,
                  titleSearch: "Search".tr,
                  onPressedSearching: () {
                    controller.onPressSearchPro();
                  },
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  profileImg: viewProfile_Controller.data.isEmpty
                      ? "iconprofile.png"
                      : "${viewProfile_Controller.data[0].usersImage}",

                ),
              ),

////////////////////////////////////////////////////////////////////////////////      Body
              body: WillPopScope(
                  child: controller.listPage.elementAt(controller.CurrentPage),
                  onWillPop: () {
                    return AlertExitApp();
                  }),
            ));
  }
}
