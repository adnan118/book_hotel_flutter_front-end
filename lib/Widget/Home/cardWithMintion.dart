import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/Model/favoriteModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Controller/myFavorit_Controllrt.dart';
import '../../Controller/rooms_Controler.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Data/DataSource/Remote/homePageHotelAppRemoteData.dart';
import '../../Data/Model/roomModel.dart';
import '../../LinksConnect/LinksAPI.dart';
import '../General/header2.dart';

class CardWithMintion extends StatelessWidget {
  final RoomModel roomModel;

  const CardWithMintion({
    Key? key,
    required this.roomModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Rooms_Controller rooms_controller = Get.put(Rooms_Controller());
     HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp = Get.put(HomePageHotelApp_ControllerImp());


    return InkWell(
        onTap: () {
          homePageHotelApp_ControllerImp.goToDataRoom(roomModel);
        },
        child: Stack(
          children: [
            TransparentImageCard(
              tagSpacing: 65,
              contentPadding: EdgeInsets.all(2),
              width: 250,
              imageProvider: NetworkImage(
                "${LinksApp.linkImagRoom}/${roomModel.roomImg}",
              ),
              tags: [
                Container(
                  height: 20,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: ColorApp.primaryColor.withOpacity(0.4),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "${translateDB(roomModel.categoriesNameAr, roomModel.categoriesName)}",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ColorApp.bacground,
                      fontSize: 13
                        ),
                  ),
                ),
              ],
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  Text(
                    "numberfloor".tr,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: ColorApp.bacground, fontSize: 13),
                  ),
                  Text("${roomModel.roomNumfloor}",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: ColorApp.bacground, fontSize: 13)),
                  SizedBox(
                    width: 35,
                  ),
                  Text("numberroom".tr,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: ColorApp.bacground, fontSize: 13)),
                  Text("${roomModel.roomNumroom}",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(color: ColorApp.bacground, fontSize: 13)),
                ],
              ),
              description: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Price".tr,
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "${roomModel.roomPrice} \$",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            /*
            GetBuilder<MyFavoriteController>(
              builder: (myFavoriteController) => MaterialButton(
                  minWidth: 1,
                  onPressed: () {
                     print("rooms_controller.roomModel?.roomFavorit ${myFavoriteController.roomFavorit}");
                    print("rooms_controller.roomModel?.roomId ${roomModel.roomId}");

                    if (myFavoriteController.roomFavorit ==roomModel.roomId.toString()) {

                      myFavoriteController.removeDataFrommyfavorite(
                          roomModel.roomId.toString());
                      myFavoriteController
                          .deletFavorit(roomModel.roomId.toString());
                     } else {
                       myFavoriteController
                          .addFavorit(roomModel.roomId.toString());

                    }
                  },
                  child:myFavoriteController.roomFavorit ==roomModel.roomId.toString()
                      ? Image.asset("assets/images/iconsaved.png",
                          height: 35, width: 35)
                      : Image.asset("assets/images/iconsave.png",
                          height: 35, width: 35)),
            )*/
          ],
        ));
  }
}
