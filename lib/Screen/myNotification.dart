import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';
import '../Classes/handlingStatusRemotDataView.dart';
import '../Controller/homePageHotelApp_Controler.dat.dart';
import '../Controller/myNotification_Controller.dart';
import '../Core/Constant/color.dart';
import '../Core/Function/GCMnotifiction.dart';
import '../Core/Localization/translateDB.dart';
import '../Data/Model/NotificationModel.dart';
import '../LinksConnect/LinksAPI.dart';
import '../Widget/AvatarAction/btnback.dart';
import '../Widget/General/header1.dart';
import 'package:stacked_notification_cards/stacked_notification_cards.dart';

import '../Widget/General/header2.dart';

class MyNotification extends StatelessWidget {
  MyNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyNotification_Controller myNotification_Controller =
        Get.put(MyNotification_Controller());

    return GetBuilder<HomePageHotelApp_ControllerImp>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: Header1(
                  text: "Notifications".tr,
                  color: Colors.black54,
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                leading: Btnback(),
              ),
              body: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Column(

                  children: [
                    Image.asset(
                      "assets/images/notificationImg.PNG",
                      width: 200,
                    ),
                    Header2(
                      text: "intro2notification".tr,
                      color: ColorApp.blackdark,
                    ),
                    SizedBox(height: 30,),
                    GetBuilder<MyNotification_Controller>(
                        builder: (myNotification_Controller) =>
                            HandlingStatusRemotDataView(
                                statusRequest:
                                    myNotification_Controller.statusRequest,
                                widget: Expanded(
                                    child: ListView.builder(
                                        itemCount: myNotification_Controller
                                            .not.length,
                                        itemBuilder: (Context, int i) =>
                                            Notification(
                                              notificationModel:
                                                  myNotification_Controller
                                                      .not[i],
                                            )))))
                  ],
                ),
              ),
            ));
  }
}

class Notification extends GetView<HomePageHotelApp_ControllerImp> {
  final NotificationModel notificationModel;

  const Notification({
    Key? key,
    required this.notificationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageHotelApp_ControllerImp hotelApp_ControllerImp =
        Get.put(HomePageHotelApp_ControllerImp());
    return ListTile(
      leading: Image.asset(
        "assets/MyLogo.jpg",
      width: 40,
      ),

      title: Text(
          "${translateDB(
            notificationModel.notificationTitleAr,
            notificationModel.notificationTitle,
          )}",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 12, color: ColorApp.primaryColor)),
      subtitle: Text(
          "${translateDB(
            notificationModel.notificationBodyAr,
            notificationModel.notificationBody,
          )}",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontSize: 12, color: ColorApp.blacklight)),
    );
  }
}
