import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Btnback extends StatelessWidget {
  const Btnback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(

      margin: EdgeInsets.all(8 ),
      decoration: BoxDecoration(
        color: ColorApp.fourthColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(padding: EdgeInsets.only(right: 5),
        splashRadius: 5,
        icon: Icon(Icons.arrow_back_ios,color: ColorApp.primaryColor,),
        onPressed: (){Get.back();},
      ),
    );
  }
}
