import 'package:book_hotel/Controller/orders/ArchiveController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../../Core/Constant/color.dart';

void showRating(BuildContext context, orderid) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'RatingBook'.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 18,
              color: ColorApp.primaryColor,
            ),
      ),
      // encourage your user to leave a high rating?
      message: Text('descrating'.tr,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 13,
                color: ColorApp.blacklight,
              )),
      // your app's logo?
      //image: const FlutterLogo(size: 100),
      starColor: ColorApp.secandryColor,

      starSize: 30,
      submitButtonText: 'Submit'.tr,
      submitButtonTextStyle: TextStyle(color: ColorApp.primaryColor),
      commentHint: 'commentRating'.tr,
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, comment: ${response.comment}');
        ArchiveOrders_Controller ordersController = Get.find();
        ordersController.submitRatingfromcontroller(
            orderid, response.comment, response.rating);
      },
    ),
  );
}
