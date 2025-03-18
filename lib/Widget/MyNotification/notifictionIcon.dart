import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotifictionIcon extends StatelessWidget {
  const NotifictionIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(left: 0,right: 25,top: 15),
      child: InkWell(
          onTap: (){
            Get.toNamed( "/MyNotification");
          },
          radius: 1,
          splashColor: Colors.transparent,

          child: Stack(
            children: [
              Image.asset("assets/images/iconnotification.png",width: 27,height: 27,),
              Container(
                alignment: Alignment.center,
                width: 10,height: 10,
                decoration: BoxDecoration(
                    color: ColorApp.primaryColor,
                    borderRadius: BorderRadius.circular(50)
                ),
              ),
            ],
          )
      ),
    );
  }
}
