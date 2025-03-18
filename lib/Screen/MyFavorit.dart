import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Classes/handlingStatusRemotDataView.dart';
import '../Controller/DataRoom/dataRoomFavorit_Controller.dart';
import '../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../Controller/homePageHotelApp_Controler.dat.dart';
import '../Controller/myFavorit_Controllrt.dart';
import '../Core/Constant/color.dart';
import '../Core/Constant/imageasset.dart';
import '../Core/Localization/translateDB.dart';
import '../Core/Services/services.dart';
import '../Data/Model/favoriteModel.dart';
import '../Data/Model/roomModel.dart';
import '../LinksConnect/LinksAPI.dart';

HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp =
    Get.put(HomePageHotelApp_ControllerImp());
 MyFavoriteController myFavoriteController = Get.put(MyFavoriteController());


class MyFavorit extends StatelessWidget {
  const MyFavorit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    myFavoriteController.getData();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: GetBuilder<MyFavoriteController>(
          builder: (myFavoriteController) => ListView(
            children: [
              MaterialButton(
                onPressed: () {
                  myFavoriteController.initialdataCheckInternet();
                },
                child: Text("Check internet"),
              ),
              SizedBox(
                height: 30,
              ),
              HandlingStatusRemotDataView(
                  statusRequest: myFavoriteController.statusRequest,
                  widget: Container(
                    width: double.infinity,
                    child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                        itemCount: myFavoriteController.data.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                             return ListOfFavorit(
                            selectRoom:index,
                            favoriteModel: myFavoriteController.data[index],
                          );
                        }),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class ListOfFavorit extends StatelessWidget {
  final FavoriteModel favoriteModel;
   final int selectRoom;

  const ListOfFavorit({
    Key? key,
    required this.favoriteModel,
     required this.selectRoom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Myservices myservices = Get.find();

    return InkWell(
         onTap: () {
           homePageHotelApp_ControllerImp.goToDataRoom(
              RoomModel.fromJson(
              homePageHotelApp_ControllerImp.room[selectRoom]
          )
          );
        },
        child: Stack(children: [
          Card(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                    "${LinksApp.linkImag}/${favoriteModel.roomImg}",
                    height: 150,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: ColorApp.secandryColor.withOpacity(0.4),
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text("Rating 4.5 ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            fontSize: 13,
                                            color: ColorApp.blacklight)),
                                Image.asset(
                                  "assets/images/iconstar.png",
                                  height: 20,
                                  width: 20,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 25,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: ColorApp.primaryColor,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                            Text(
                              "Price".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 13, color: ColorApp.bacground),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${favoriteModel.roomPrice} \$",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      fontSize: 13, color: ColorApp.bacground),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Positioned(
              left:
                  myservices.sharedPref.getString("myLang") == "ar" ? 10 : 290,
              child: GetBuilder<MyFavoriteController>(
                builder: (myFavoriteController) => InkWell(
                    onTap: () {

                      myFavoriteController
                          .deletFavorit(favoriteModel.favoriteId);
                      myFavoriteController
                          .removeDataFrommyfavorite(favoriteModel.roomId);

                    },
                    child: Image.asset(
                      "assets/images/iconsaved.png",
                      height: 35,
                      width: 35,
                    )),
              ))
        ]));
  }
}
