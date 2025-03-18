/*
import 'package:book_hotel/Controller/homePageHotelApp_Controler.dat.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Services/services.dart';
import '../MyNotification/avatarImag.dart';

class AvatarAction extends StatelessWidget {
  final String img;
  const AvatarAction({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp =
        Get.put(HomePageHotelApp_ControllerImp());
    Myservices myservices = Get.find();
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      position: PopupMenuPosition.under,
      tooltip: "tooltipMyProfile".tr,
      onSelected: (value) {
        if (value == "View Profile") {
          homePageHotelApp_ControllerImp.goToViewProfile();
        } else if (value == "Settings") {
          print("Settings");
        } else if (value == "My Bookings") {
          Get.toNamed("/MainTapOrders");
          print("MainTapOrders");
        } else if (value == "Log out") {

          homePageHotelApp_ControllerImp.logOutExit();
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/iconprofile.png",
                  height: 30,
                  width: 30,
                ),
                Text("ViewProfile".tr)
              ],
            ),
            value: "View Profile",
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/iconbookings.png",
                  height: 30,
                  width: 30,
                ),
                Text("MyBookings".tr)
              ],
            ),
            value: "My Bookings",
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/iconsettings.png",
                  height: 30,
                  width: 30,
                ),
                Text("Settings".tr)
              ],
            ),
            value: "Settings",
          ),
          PopupMenuItem(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/iconlogout.png",
                  height: 30,
                  width: 30,
                ),
                Text("Logout".tr)
              ],
            ),
            value: "Log out",
          ),
        ];
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: AvatarImag(color: ColorApp.primaryColor,img:img ),
      ),
    );
  }
}
*/
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_hotel/Controller/homePageHotelApp_Controler.dat.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Core/Function/GCMnotifiction.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Localization/changelocal.dart';
import '../../Core/Services/services.dart';
import '../General/header1.dart';
import '../General/header2.dart';
import '../MyNotification/avatarImag.dart';

class AvatarAction extends StatelessWidget {
  final String img;

  const AvatarAction({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp =
        Get.put(HomePageHotelApp_ControllerImp());
    Myservices myservices = Get.find();
    return PopupMenuButton<String>(
      color: ColorApp.fourthColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      position: PopupMenuPosition.under,
      tooltip: "tooltipMyProfile".tr,
      onSelected: (value) {
        if (value == "View Profile") {
          homePageHotelApp_ControllerImp.goToViewProfile();
        } else if (value == "Settings") {
          Get.toNamed("/homePageHotelApp");

          print("Settings");
        } else if (value == "My Bookings") {
          Get.toNamed("/MainTapOrders");
          print("MainTapOrders");
        } else if (value == "Log out") {
          homePageHotelApp_ControllerImp.logOutExit();
        }
      },
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
              leading: Image.asset(
                "assets/images/iconprofile.png",
                height: 30,
                width: 30,
              ),
              title: Header1(
                text: "ViewProfile".tr,
                color: Colors.black,
              ),
            ),
            value: "View Profile",
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Image.asset(
                "assets/images/iconbookings.png",
                height: 30,
                width: 30,
              ),
              title: Header1(
                text: "MyBookings".tr,
                color: Colors.black,
              ),
            ),
            value: "My Bookings",
          ),
          PopupMenuItem(
            child: InkWell(
              onTap: () {
                LocalController localController = Get.put(LocalController());
                localController.changeLanguage(
                    myservices.sharedPref.getString("myLang") == "ar"
                        ? "en"
                        : "ar");
                Get.offAllNamed("/homePageHotelApp");
              },
              child: ListTile(
                leading: Image.asset(
                  "assets/images/lang.png",
                  height: 30,
                  width: 30,
                ),
                title: Header1(
                  text: "chooseLanguage".tr,
                  color: Colors.black,
                ),
                subtitle: Row(
                  children: [
                    Header2(
                      text: "langu".tr,
                      color: ColorApp.blacklight,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Header2(
                      text: myservices.sharedPref.getString("myLang") == "ar"
                          ? "عربي"
                          : "English",
                      color: ColorApp.blacklight,
                    ),
                  ],
                ),
              ),
            ),
            value: "Settings",
          ),
          PopupMenuItem(
            child: ListTile(
              leading: Image.asset(
                "assets/images/iconlogout.png",
                height: 30,
                width: 30,
                color: ColorApp.primaryColor,
              ),
              title: Header1(
                text: "Logout".tr,
                color: Colors.black,
              ),
            ),
            value: "Log out",
          ),
        ];
      },
      child: Container(
        height: 40,
        width: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: AvatarImag(color: ColorApp.primaryColor, img: img),
      ),
    );
  }
}
