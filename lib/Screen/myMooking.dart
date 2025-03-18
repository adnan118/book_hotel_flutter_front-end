import 'package:book_hotel/Data/Model/BookModel.dart';
import 'package:book_hotel/Widget/General/btnWithBorder.dart';
import 'package:book_hotel/Widget/Home/cardWithMintion.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Auth/Widget/customButtomAuth.dart';
import '../Classes/handlingStatusRemotDataView.dart';
import '../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../Controller/book_Controller.dart';
import '../Controller/homePageHotelApp_Controler.dat.dart';
import '../Core/Constant/color.dart';
import '../Core/Services/services.dart';
import '../LinksConnect/LinksAPI.dart';
import '../Widget/AvatarAction/btnback.dart';
import '../Widget/Booking/cardOfBook.dart';
import '../Widget/General/header1.dart';
import '../Widget/Offers/cardOfOffers.dart';

class MyBooking extends StatelessWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book_Controller book_controller = Get.put(Book_Controller());

    return Scaffold(


      floatingActionButton:
  GetBuilder<Book_Controller>(
    builder: (c)=>    book_controller.totalCountRoom ==0?
    Text(""):
    InkWell(
      onTap: (){
        book_controller.goToCustomBooking(book_controller.data);
      },
      child:  Container(
        height: 50,
        width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: ColorApp.secandryColor.withOpacity(0.8),
        ),
        alignment: Alignment.center,
        child:    Text("ContinueToCheckOut".tr,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(
                fontSize: 15,
                color: ColorApp.primaryColor)),
      ),
    ),
  ),
      body:
      GetBuilder<Book_Controller>(
          builder: (book_controller) => HandlingStatusRemotDataView(
            statusRequest: book_controller.statusRequest,
            widget: Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [

                   CardOfBook(
                      title: 'dataAboutMyBooking'.tr,
                      text1: "countRoom".tr,
                      text1value:"  ${book_controller.totalCountRoom}",

                     text2: "totalPriceOrdersRoom".tr ,
                     text2value: "   ${book_controller.totalPriceOrdersRoom}",

                      typeImgCard: "assets/images/iconoffer.png",
                      colorCircle: Colors.transparent,
                     ),
                    ...List.generate(
                        book_controller.data.length,
                            (index) =>
                                ListOfRoom(
                                  bookModel: book_controller.data[index],
                                  selectRoom: index,
                                ),
                    ),
                    SizedBox(height: 50,)
                  ],
                )),
          )),
    );
  }
}


class ListOfRoom extends StatelessWidget {
  final BookModel bookModel;
  final int selectRoom;

  const ListOfRoom({
    Key? key,
    required this.bookModel,
    required this.selectRoom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Myservices myservices = Get.find();
    HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp =
    Get.put(HomePageHotelApp_ControllerImp());

    final Book_Controller book_controller = Get.put(Book_Controller());

    return

      InkWell(
        onTap: () {

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
                    "${LinksApp.linkImagRoom}/${bookModel.roomImg}",
                    height: 150,
                    width: 200,
                    fit: BoxFit.fill,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                        SizedBox(height: 30,),
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
                            Text("Room".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                    fontSize: 10,
                                    color: ColorApp.blacklight)),
                            Text(" ${bookModel.countRoom}",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                    fontSize: 10,
                                    color: ColorApp.blacklight)),
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
                                  .labelLarge!
                                  .copyWith(
                                  fontSize: 10, color: ColorApp.bacground),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "${bookModel.roomTotalPrice} \$",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(
                                  fontSize: 10, color: ColorApp.bacground),
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
              myservices.sharedPref.getString("myLang") == "ar" ? 2 : 290,
              child: GetBuilder<Book_Controller>(
                builder: (book_controller) => InkWell(
                    onTap: () {

                      book_controller.remove(bookModel.roomId);
                      book_controller.refreshPage();

                    },
                    child: Image.asset(
                      "assets/images/iconremove.png",
                      color: ColorApp.primaryColor,
                      height: 35,
                      width: 35,
                    )),
              ))
        ]));
  }
}
