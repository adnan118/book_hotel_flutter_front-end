import 'package:book_hotel/Core/Constant/color.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class BtnNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;

  const BtnNavigationBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 30),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(0, 3))
          ]),
      child: BottomBar(
        height: 60,
        selectedIndex: selectedIndex,
        onTap: onTap,
        items: <BottomBarItem>[
          BottomBarItem(
            icon: Image.asset("assets/images/iconhome.png",
                color: ColorApp.primaryColor),
            title: Text('Home'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 12, color: ColorApp.primaryColor)),
            activeColor: ColorApp.yellowDeep,
          ),
          BottomBarItem(
            icon: Image.asset("assets/images/iconscompass.png",
                color: ColorApp.primaryColor),
            title: Text('Findus'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 12, color: ColorApp.primaryColor)),
            activeColor: ColorApp.yellowDeep,
          ),
          /*     BottomBarItem(
            icon:  Image.asset("assets/images/iconsave.png",color: ColorApp.primaryColor),
            title: Text('Saving'.tr,style: TextStyle(color: ColorApp.primaryColor,fontSize: 15),),
            activeColor: ColorApp.yellowDeep,
          ),*/
          BottomBarItem(
            icon: Image.asset("assets/images/iconqr.png",
                color: ColorApp.primaryColor),
            title: Text('Scanner'.tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 12, color: ColorApp.primaryColor)),
            activeColor: ColorApp.yellowDeep,
          ),
        ],
      ),
    );
  }
}
