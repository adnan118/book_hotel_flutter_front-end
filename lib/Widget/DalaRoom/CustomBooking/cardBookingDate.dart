import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../selectInOut.dart';
import '../titleGroup.dart';

class CardBookingDate extends StatelessWidget {
  const CardBookingDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataRoom_Controller dataRoom_Controller =
        Get.put(DataRoom_Controller());
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorApp.fourthColor,
        elevation: 3,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SelectInOut(
                date: dataRoom_Controller.checkin,
                title: "Checkin".tr,
                width: 150,
                typeDate1OrTravelers2: 1,
                color: Colors.black,
                img: "assets/images/iconcalender.png",
                PL: 0,
                PR: 100,
              ),
              const SizedBox(
                height: 8,
              ),
              SelectInOut(
                date: dataRoom_Controller.checkout,
                title: "Checkout".tr,
                width: 150,
                typeDate1OrTravelers2: 1,
                color: Colors.black38,
                img: "assets/images/iconcalender.png",
                PL: 100,
                PR: 0,
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ));
  }
}
