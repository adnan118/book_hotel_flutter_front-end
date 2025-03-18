import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Controller/DataRoom/dataRoom_Controllrt.dart';
import '../../../Controller/book_Controller.dart';
import '../titleGroup.dart';

class CardCoupon extends StatelessWidget {
  final TextEditingController couponNameController;
  final void Function()? onPressed;

  const CardCoupon(
      {Key? key, required this.couponNameController, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataRoom_Controller dataRoom_Controller =
        Get.put(DataRoom_Controller());
    final Book_Controller book_controller = Get.put(Book_Controller());

    return GetBuilder<Book_Controller>(
        builder: (book_Controller) => Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: ColorApp.fourthColor,
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TitleGroup(
                      text: "Coupon".tr, icon: "assets/images/iconcoupon.png"),
                  book_controller.couponname == null
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: couponNameController,
                                    decoration: InputDecoration(
                                      hintStyle: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              fontSize: 12,
                                              color: ColorApp.blacklight),
                                      isDense: true,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 10),
                                      hintText: "IhaveCoupon".tr,
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                              color: ColorApp.primaryColor)),
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                      child: IconButton(
                                    onPressed: onPressed,
                                    icon: const Icon(Icons.search,
                                        color: ColorApp.primaryColor),
                                  ))),
                            ],
                          ),
                        )
                      : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("thankyouforusedCoupon".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 12,
                                    )),
                            Text(" ${book_controller.couponname}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 18,
                                    ))
                          ],
                        ),
                ],
              ),
            )));
  }
}
