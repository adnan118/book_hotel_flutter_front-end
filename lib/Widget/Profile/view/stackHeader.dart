import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../AvatarAction/btnback.dart';
import '../../MyNotification/avatarImag.dart';

class StackHeader extends StatelessWidget {
  final String bgImg;
  final String profileImg;
  final bool profilMood;
  final bool? isAsset;

  const StackHeader({
    Key? key,
    required this.bgImg,
    required this.profilMood,required this.isAsset, required this.profileImg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          height: Get.width / 1.9,
          width: double.infinity,
          color: Colors.grey,
          child:isAsset == true? Image.asset(
            bgImg,
            fit: BoxFit.cover,
          ): Image.network(
            bgImg,
            fit: BoxFit.cover,
          ),
        ),


        ///////////////////////////////
        /////////////////////////////
        profilMood == true
            ? Positioned(
                top: Get.width / 2.3,
                left: Get.width / 15,
                child: Container(
                  width: 100,
                  height: 100,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Container(
                    width: 50,
                    height: 50,
                    child: AvatarImag(color: ColorApp.secandryColor,img: profileImg,),
                  ),
                ))
            : Text(""),

        /////////////
      ],
    );
  }
}
