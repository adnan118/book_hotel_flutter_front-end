import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Widget/General/header2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/book_Controller.dart';
import '../General/header1.dart';

class PriceCash extends StatelessWidget {


  const PriceCash(
      {Key? key, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book_Controller book_controller = Get.put(Book_Controller());

    return      Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Header1(text: 'Price'.tr,color: ColorApp.blacklight),
            Header1(text: ':',color: ColorApp.blacklight),
            Header1(text: '${book_controller.t} \$',color: ColorApp.primaryColor),

          ],),
        Image.asset( "assets/images/wallet.gif",width: 200,),
        Header1(text: 'textPayCash'.tr,color: ColorApp.blacklight),
      ],

    );
  }
}
