import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Controller/myFavorit_Controllrt.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/Model/favoriteModel.dart';
import 'package:book_hotel/LinksConnect/LinksAPI.dart';
import 'package:book_hotel/Screen/MyFavorit.dart';
import 'package:book_hotel/Widget/DalaRoom/cardDesc.dart';
import 'package:book_hotel/Widget/General/btnWithBorder.dart';
import 'package:book_hotel/Widget/General/header1.dart';
import 'package:book_hotel/Widget/General/header2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/DataRoom/dataRoomFavorit_Controller.dart';
import '../../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../../Controller/book_Controller.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Core/Services/services.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/DalaRoom/cardPrice.dart';
import '../../Widget/DalaRoom/catAndRate.dart';
import '../../Widget/DalaRoom/listOfExtraPopularAmenities.dart';
import '../../Widget/DalaRoom/listOfExtraServices.dart';
import '../../Widget/DalaRoom/titleGroup.dart';
import '../../Widget/Profile/view/stackHeader.dart';

class DataRoom extends StatelessWidget {
  const DataRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataRoom_Controller dataRoom_Controller = Get.put(DataRoom_Controller());

    return Scaffold(
        appBar: AppBar(
          title: Header1(
            text: "InformationBooking".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: GetBuilder<DataRoom_Controller>(
          builder: (dataRoom_Controller) => HandlingStatusRemotDataRequest(
              statusRequest: dataRoom_Controller.statusRequest,
              widget: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    margin: EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 10,
                          child: StackHeader(
                            isAsset: false,
                            bgImg:
                                "${LinksApp.linkImagRoom}/${dataRoom_Controller.roomModel.roomImg}",
                            profilMood: false,
                            profileImg:
                                "${LinksApp.linkImagRoom}/${dataRoom_Controller.roomModel.roomImg}",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CatAndRate(
                                isAsset: false,
                                icon:
                                    "${LinksApp.linkImag}/${dataRoom_Controller.roomModel.categoriesImg}",
                                text:
                                    "${translateDB(dataRoom_Controller.roomModel.categoriesNameAr, dataRoom_Controller.roomModel.categoriesName)}",
                                colortext: ColorApp.primaryColor,
                                coloricon: ColorApp.primaryColor),

                            Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                elevation: 5,
                                shadowColor: ColorApp.primaryColor,
                                child: BtnWithBorder(
                                    color: ColorApp.primaryColor,
                                    text: "Booking".tr,
                                    fontSize: 15,
                                    onPressed: () {

                                        dataRoom_Controller.book_controller.add(
                                            dataRoom_Controller.roomModel.roomId!);
                                          Book_Controller book_controller = Get.put(Book_Controller());
                                          book_controller.refreshPage();

                                        Get.toNamed("/MainTapOrders");

                                    },
                                    left: 0,
                                    top: 0))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TitleGroup(
                            text: "Highlights".tr,
                            icon: "assets/images/iconstars.png"),

                        CardDesc(
                          text:
                              "${translateDB(dataRoom_Controller.roomModel.roomDescAr, dataRoom_Controller.roomModel.roomDesc)}",
                        ),

                        SizedBox(
                          height: 15,
                        ),

                        ///////////////////////////////
                        TitleGroup(
                          text: "Popularamenities".tr,
                          icon: "assets/images/iconamenities.png",
                        ),

                        listOfExtraPopularAmenities(),
                        SizedBox(
                          height: 15,
                        ),

                        ///////////////////////////
                        TitleGroup(
                            text: "Services".tr,
                            icon: "assets/images/iconfrontdesk.png"),

                        ListOfExtraServices(),
                        SizedBox(
                          height: 15,
                        ),

                        ////////////////////////////
                        TitleGroup(
                            text: "Price".tr,
                            icon: "assets/images/iconprice.png"),

                        CardPrice(
                            price: "${dataRoom_Controller.roomModel.roomPrice}",
                            sale:
                                "${dataRoom_Controller.roomModel.roomDiscount}"),

                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
        ));
  }
}
