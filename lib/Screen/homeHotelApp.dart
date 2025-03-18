import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import '../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../Controller/homePageHotelApp_Controler.dat.dart';
import '../Controller/myFavorit_Controllrt.dart';
import '../Controller/rooms_Controler.dart';
import '../Core/Localization/translateDB.dart';
import '../Data/Model/roomModel.dart';
import '../LinksConnect/LinksAPI.dart';
import '../Widget/General/header2.dart';
import '../Widget/General/listRoomSearch.dart';
import '../Widget/Home/appBarHome.dart';
import '../Widget/Home/cardWithMintion.dart';
import '../Widget/General/header1.dart';
import '../Widget/Home/listOfCategories.dart';
import '../Widget/Home/listOfCategoriesIN.dart';
import '../Widget/Offers/cardOfOffers.dart';

class homeHotelApp extends StatelessWidget {
  const homeHotelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewProfile_Controller viewProfile_Controller =
        Get.put(ViewProfile_Controller());
    return Container(
        height: 700,
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 15),
        child: GetBuilder<HomePageHotelApp_ControllerImp>(
            builder: (controller) => HandlingStatusRemotDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isDoingSearch
                      ? Container(
                          height: 1000,
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
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
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/MyLogo.jpg",
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Header1(
                                    text: "Categories".tr,
                                    color: Colors.black,
                                  ),
                                  Image.asset(
                                    "assets/images/iconcategory.png",
                                    height: 35,
                                    width: 35,
                                    color: ColorApp.primaryColor,
                                  ),
                                ],
                              ),
                              //////////////////////////////////////////////////////// Categories
                              ListOfCategories(),
                              ///////
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Header1(
                                    text: "SeasonOffers".tr,
                                    color: Colors.black,
                                  ),
                                  Image.asset(
                                    "assets/images/iconoffer.png",
                                    height: 35,
                                    width: 35,
                                  ),
                                ],
                              ),
                              CardOfOffers(
                                title: 'Cardofferstitle'.tr,
                                titleBody: 'Cardoffersbody'.tr,
                                typeImgCard: "assets/images/iconoffer.png",
                                colorCircle: ColorApp.secandryColor,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Header1(
                                    text: "TopBooking".tr,
                                    color: Colors.black,
                                  ),
                                  Image.asset(
                                    "assets/images/iconsTopBooking.png",
                                    height: 38,
                                    width: 38,
                                    color: ColorApp.primaryColor,
                                  ),
                                ],
                              ),
                              GetBuilder<HomePageHotelApp_ControllerImp>(
                                  builder:
                                      (homePageHotelApp_ControllerImp) =>
                                          Container(
                                              margin: EdgeInsets.only(
                                                  bottom: 70, top: 15),
                                              height: 200,
                                              child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                //     physics: NeverScrollableScrollPhysics(),
                                                itemCount:
                                                    homePageHotelApp_ControllerImp
                                                        .roomTopBooking.length,
                                                itemBuilder: (context, index) {
                                                  return InkWell(
                                                      child: Container(
                                                          height: 220,
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      5),
                                                          //homePageHotelApp_ControllerImp.roomTopBooking[index]["countRoom"]
                                                          child: Stack(
                                                            children: [
                                                              TransparentImageCard(
                                                                tagSpacing: 65,
                                                                contentPadding:
                                                                    EdgeInsets
                                                                        .all(2),
                                                                width: 250,
                                                                imageProvider:
                                                                    NetworkImage(
                                                                  "${LinksApp.linkImagRoom}/${homePageHotelApp_ControllerImp.roomTopBooking[index]["room_img"]}",
                                                                ),
                                                                tags: [
                                                                  Container(
                                                                    width: 200,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(5)),
                                                                      color: ColorApp
                                                                          .secandryColor
                                                                          .withOpacity(
                                                                              0.4),
                                                                    ),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceAround,
                                                                      children: [
                                                                        Header2(
                                                                          text:
                                                                              "numtimebooked".tr,
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                        Header2(
                                                                          text: homePageHotelApp_ControllerImp.roomTopBooking[index]["countRoom"] == null
                                                                              ? "0"
                                                                              : "${homePageHotelApp_ControllerImp.roomTopBooking[index]["countRoom"]}",
                                                                          color:
                                                                              Colors.white,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                                title: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 1,
                                                                    ),
                                                                    Text(
                                                                      "numberfloor"
                                                                          .tr,
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .labelLarge
                                                                          ?.copyWith(
                                                                              color: ColorApp.bacground,
                                                                              fontSize: 15),
                                                                    ),
                                                                    Text(
                                                                        "${homePageHotelApp_ControllerImp.roomTopBooking[index]["room_numfloor"]}",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .labelLarge
                                                                            ?.copyWith(
                                                                                color: ColorApp.bacground,
                                                                                fontSize: 15)),
                                                                    SizedBox(
                                                                      width: 35,
                                                                    ),
                                                                    Text(
                                                                        "numberroom"
                                                                            .tr,
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .labelLarge
                                                                            ?.copyWith(
                                                                                color: ColorApp.bacground,
                                                                                fontSize: 15)),
                                                                    Text(
                                                                        "${homePageHotelApp_ControllerImp.roomTopBooking[index]["room_numroom"]}",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .labelLarge
                                                                            ?.copyWith(
                                                                                color: ColorApp.bacground,
                                                                                fontSize: 15)),
                                                                  ],
                                                                ),
                                                                description:
                                                                    Row(
                                                                  children: [
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text(
                                                                      "Price"
                                                                          .tr,
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 30,
                                                                    ),
                                                                    Text(
                                                                      "${homePageHotelApp_ControllerImp.roomTopBooking[index]["room_price"]}\$",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.white),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          )));
                                                },
                                              )))
                            ],
                          ))
                      : ListRoomSearch(listRoomDataModel: controller.listdata),
                )));
  }
}
