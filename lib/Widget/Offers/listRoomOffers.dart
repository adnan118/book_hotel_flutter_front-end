import 'package:book_hotel/Data/Model/OffersModel.dart';
import 'package:book_hotel/Data/Model/favoriteModel.dart';
import 'package:book_hotel/Data/Model/roomModel.dart';
import 'package:book_hotel/Screen/InfoRooms/rooms.dart';
import 'package:book_hotel/Widget/General/btnWithBorder.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/offers_Controller.dart';
import '../../Core/Constant/color.dart';
import '../../Core/Constant/imageasset.dart';
import '../../Core/Localization/translateDB.dart';
import '../../LinksConnect/LinksAPI.dart';

class ListRoomOffers extends GetView<Offers_Controller> {
  final RoomModel roomModel;

  const ListRoomOffers({Key? key, required this.roomModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Offers_Controller offersController = Get.put(Offers_Controller());

    return InkWell(
      onTap: () {
        offersController.goToRoomDetails(roomModel);
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  elevation: 5,
                  child: Hero(
                      //تعطي انيميشن لانتقال الصور
                      tag: "${roomModel.roomId} ", //لازم يكون الرقم فريد
                      child: CachedNetworkImage(
                        imageUrl:
                            LinksApp.linkImagRoom + "/" + "${roomModel.roomImg}",
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      )),
                  clipBehavior: Clip.hardEdge,
                ),
                Column(
                  crossAxisAlignment: offersController.myservices.sharedPref
                              .getString("myLang") ==
                          "ar"
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/iconssuiteroom.png",
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Text(
                            "F ${roomModel.roomNumfloor} / N ${roomModel.roomNumroom}",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 13, color: ColorApp.blacklight)),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: offersController.myservices.sharedPref
                                  .getString("myLang") ==
                              "ar"
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/iconprice.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Price".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 13,
                                        color: ColorApp.blacklight)),
                            SizedBox(
                              width: 5,
                            ),
                            Text("${roomModel.roomPrice} \$ ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 13,
                                        color: ColorApp.blacklight)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("PriceafterDiscount".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 13,
                                        color: ColorApp.primaryColor)),
                            SizedBox(
                              width: 5,
                            ),
                            Text("${roomModel.roomPriceDiscount} \$ ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 13,
                                        color: ColorApp.primaryColor)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
            Positioned(
                top: 110,
                left: offersController.myservices.sharedPref
                            .getString("myLang") ==
                        "ar"
                    ? 0
                    : 50,
                child: Container(
                  child: IconButton(
                      onPressed: () {
                        controller.goToRoomDetails(roomModel);
                      },
                      icon: Image.asset(
                        "assets/images/iconsviewmore.png",
                        fit: BoxFit.cover,
                        height: 45,
                        width: 45,
                      )),
                )),

            /////////////
            if (roomModel.roomDiscount != 0)
              Positioned(
                  left: offersController.myservices.sharedPref
                              .getString("myLang") ==
                          "ar"
                      ? 0
                      : 50,
                  child: Row(
                    children: [
                      Text(
                        "${translateDB(roomModel.categoriesNameAr, roomModel.roomCategories)}",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Text("${roomModel.roomDiscount} % ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 15, color: ColorApp.thirdColor)),
                      Image.asset(
                        ImageAssetApp.SaleSticker,
                        width: 40,
                        color: ColorApp.primaryColor,
                      ),
                    ],
                  ))
          ],
        ),
      ),
    );
  }
}
