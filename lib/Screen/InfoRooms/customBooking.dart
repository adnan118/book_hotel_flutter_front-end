import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Widget/AvatarAction/btnback.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Auth/Widget/customButtomAuth.dart';
import '../../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../../Controller/book_Controller.dart';
import '../../Widget/DalaRoom/CustomBooking/cardBookingDate.dart';
import '../../Widget/DalaRoom/CustomBooking/cardCalculator.dart';
import '../../Widget/DalaRoom/CustomBooking/cardCoupon.dart';
import '../../Widget/General/header1.dart';

class CustomBooking extends StatelessWidget {
  final DataRoom_Controller dataRoom_Controller =
      Get.put(DataRoom_Controller());
  final Book_Controller book_controller = Get.put(Book_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Header1(
          text: "CustomyourBooking".tr,
          color: Colors.black54,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Btnback(),
      ),
      body: GetBuilder<DataRoom_Controller>(
        builder: (dataRoom_Controller) => Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          margin: const EdgeInsets.only(left: 1, right: 1, top: 10),
          width: double.infinity,
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              CardBookingDate(),
              //////////////////////////////////////////////////////////////////
              SizedBox(
                height: 15,
              ),
              CardCoupon(
                couponNameController: book_controller.controllerCoupon!,
                onPressed: () {
                  book_controller.checkCouponPresses();
                },
              ),
              //////////////////////////////////////////////////////////////////
              SizedBox(
                height: 15,
              ),
              //////////////////////////////////////////////////////////////////
              CardCalculator(),
              SizedBox(
                height: 15,
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: CustomButtomAuth(
                  text: "bookConfirm".tr,
                  colorBg: ColorApp.primaryColor,
                  colorText: ColorApp.bacground,
                  elevation: 3,
                  onPressed: () {
                    book_controller.goTocheckout();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
