import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:book_hotel/Screen/MyFavorit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Core/Services/services.dart';
import '../General/myAppBar.dart';
import '../MyNotification/notifictionIcon.dart';
import '../AvatarAction/avatarAction.dart';


class AppBarHome extends StatelessWidget {
  final TextEditingController searchController;
  final void Function()? onPressedSearching;
  final void Function(String)? onChanged;
  final String profileImg;
  final String titleSearch;
  const AppBarHome({Key? key, required this.searchController,  required this.profileImg,required this.onPressedSearching,  required this.onChanged, required this.titleSearch,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Myservices myservices = Get.find();
    HomePageHotelApp_ControllerImp hotelApp_ControllerImp=  Get.put(HomePageHotelApp_ControllerImp());

    return AppBar(
        backgroundColor: Colors.white,

        title:
        MyAppBar(
          myController:  searchController,
          titleAppBar:titleSearch ,
          onPressedSearching: onPressedSearching,
          onChanged: onChanged,
        ),

        elevation: 0,
        actions: [
          SizedBox(width: 20,),
          ///////////////////////////////////// notification
          NotifictionIcon(),
          SizedBox(width: 20,),
          //////////////////////////////// menu  profile
          AvatarAction(img:profileImg ),
        ]
    );
  }
}
