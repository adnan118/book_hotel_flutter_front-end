import 'package:book_hotel/Controller/myFavorit_Controllrt.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Classes/handlingStatusRemotDataView.dart';
import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Controller/rooms_Controler.dart';
import '../../Core/Constant/color.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Data/Model/roomModel.dart';
import '../../LinksConnect/LinksAPI.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';
import '../../Widget/Home/cardWithMintion.dart';
import '../../Widget/Home/listOfCategoriesIN.dart';

class Room extends StatelessWidget {
  const Room({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Rooms_Controller controllerRoom = Get.put(Rooms_Controller());

    return GetBuilder<HomePageHotelApp_ControllerImp>(
        builder: (controller) =>  HandlingStatusRemotDataView(
        statusRequest: controller.statusRequest,
        widget:Scaffold(
            appBar: AppBar(
              title: Header1(
                text: "Categories".tr,
                color: Colors.black54,
              ),
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: Btnback(),
            ),
            body: Container(
                height: 700,
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(vertical: 15),
                child: ListView(children: [
                  Column(
                    children: [
                      Header1(
                        text: "intro".tr,
                        color: ColorApp.blackdark,
                      ),
                      Header2(
                        text: "intro2".tr,
                        color: ColorApp.blacklight,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Header1(
                            text:
                                "${translateDB(controller.categories[controller.CurrentPageCategories]['categories_name_ar'], controller.categories[controller.CurrentPageCategories]['categories_name'])}",
                            color: Colors.black,
                          ),
                          Image.network(
                            "${LinksApp.linkImag}/${controller.categories[controller.CurrentPageCategories]['categories_img']}",
                            color: ColorApp.blacklight,
                            width: 30,
                          )
                        ],
                      ),
                      listOfCategoriesIN(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                          padding: EdgeInsets.all(15),
                          child: GetBuilder<Rooms_Controller>(
                              builder: (rooms_Controller) =>
                                  HandlingStatusRemotDataView(
                                      statusRequest: controller.statusRequest,
                                      widget:
                                      rooms_Controller.data.isEmpty
                                          ? Text('noroom'.tr):
                                      ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: rooms_Controller.data.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            height: 200,
                                            padding:
                                            rooms_Controller.myservices.sharedPref
                                                .getString("myLang") ==
                                                "ar"
                                                ?    EdgeInsets.only(
                                                right: index.isOdd ? 60 : 0):

                                            EdgeInsets.only(
                                                left: index.isOdd ? 60 : 0),
                                            child:
                                            CardWithMintion(
                                              roomModel: RoomModel.fromJson(
                                                  rooms_Controller.data[index]),
                                            ),
                                          );
                                        },
                                      ))))
                    ],
                  )
                ]))
        ))
    );
  }
}
