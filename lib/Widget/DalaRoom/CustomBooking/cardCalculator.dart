import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Widget/General/header2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../../../Controller/book_Controller.dart';
import '../titleGroup.dart';

class CardCalculator extends StatelessWidget {
  const CardCalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book_Controller book_controller = Get.put(Book_Controller());
    final DataRoom_Controller dataRoom_Controller =
        Get.put(DataRoom_Controller());

    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: ColorApp.fourthColor,
        elevation: 3,
        child: GetBuilder<Book_Controller>(
          builder: (book_controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleGroup(
                    text: "Calculator".tr,
                    icon: "assets/images/iconcalculator.png"),
                Row(
                  children: [
                    Header2(text: "Days".tr, color: Colors.black),
                    Header2(
                        text: "${dataRoom_Controller.daysDifference}",
                        color: Colors.black),
                  ],
                ),
                ///////////////////////////////////////////////////////
                Row(
                  children: [
                    Header2(text: "Days*Price=".tr, color: Colors.black),
                    Header2(
                        text:
                            "${book_controller.totalPriceOrdersRoom}\$ *${dataRoom_Controller.daysDifference}",
                        color: Colors.black),
                  ],
                ),
                ///////////////////////////////////////////////////////
                Row(
                  children: [
                    Header2(text: "discount=".tr, color: Colors.black),
                    Header2(
                        text:
                            "${book_controller.couponModel?.couponDiscount == null ? 0 : book_controller.couponModel?.couponDiscount}% ",
                        color: Colors.black),
                  ],
                ),
                ///////////////////////////////////////////////////////
                Row(
                  children: [
                    Header2(
                        text: "priceafterdiscount=".tr, color: Colors.black),
                    Header2(
                        text:
                            "${book_controller.getTotalPriceAfterDiscount(1)}\$ ",
                        color: Colors.black),
                  ],
                ),
                ///////////////////////////////////////////////////////
                Row(
                  children: [
                    Header2(text: "totalprice=".tr, color: Colors.black),
                    Header2(
                        text:
                            "${book_controller.getTotalPriceAfterDiscount(dataRoom_Controller.daysDifference)}\$ ",
                        color: Colors.black),
                  ],
                ),
                ///////////////////////////////////////////////////////

                SizedBox(
                  height: 20,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Center(
                      child: Header2(
                          text: "thisisnotfinalinvoice".tr,
                          color: ColorApp.blacklight.withOpacity(0.3))),
                )
              ],
            ),
          ),
        ));
  }
}
