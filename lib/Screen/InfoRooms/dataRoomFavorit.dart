import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/LinksConnect/LinksAPI.dart';
import 'package:book_hotel/Screen/InfoRooms/rowOfAmenities.dart';
import 'package:book_hotel/Widget/DalaRoom/cardDesc.dart';
import 'package:book_hotel/Widget/General/btnWithBorder.dart';
import 'package:book_hotel/Widget/General/header1.dart';
import 'package:book_hotel/Widget/General/header2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/DataRoom/dataRoomFavorit_Controller.dart';
import '../../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/DalaRoom/cardPrice.dart';
import '../../Widget/DalaRoom/catAndRate.dart';
import '../../Widget/DalaRoom/listOfExtraPopularAmenities.dart';
import '../../Widget/DalaRoom/listOfExtraServices.dart';
import '../../Widget/DalaRoom/titleGroup.dart';
import '../../Widget/Profile/view/stackHeader.dart';

class DataRoomFavorit extends StatelessWidget {
  const DataRoomFavorit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        body: GetBuilder<DataRoomFavorit_Controller>(
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
                                "${LinksApp.linkImag}/${dataRoom_Controller.favoriteModel.roomImg}",
                            profilMood: false,profileImg:   "${LinksApp.linkImag}/${dataRoom_Controller.favoriteModel.roomImg}",
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(
                              children: [
                                CatAndRate(
                                    isAsset: true,
                                    icon: "assets/images/iconstar.png",
                                    text:
                                        "${dataRoom_Controller.favoriteModel.roomNumroom}",
                                    colortext: ColorApp.primaryColor,
                                    coloricon: null),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Rate".tr),
                              ],
                            ),
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
                                    dataRoom_Controller.goToCustomBooking();
                                  },
                                  left: 0,
                                  top: 0),
                            ),
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
                              "${translateDB(dataRoom_Controller.favoriteModel.roomDescAr, dataRoom_Controller.favoriteModel.roomDesc)}",
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
                            price: "${dataRoom_Controller.favoriteModel.roomPrice}",
                            sale:
                                "${dataRoom_Controller.favoriteModel.roomDiscount}"),

                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}
