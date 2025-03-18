

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Data/Model/roomModel.dart';
import '../../LinksConnect/LinksAPI.dart';

class ListRoomSearch extends GetView<HomePageHotelApp_ControllerImp> {
  final List<RoomModel>listRoomDataModel;
  ListRoomSearch({Key? key,required this.listRoomDataModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listRoomDataModel.length,
        itemBuilder: (context,index){
          return InkWell(
              onTap: (){controller.goToDataRoom(listRoomDataModel[index]);},//الصفحة المستقبلة لا تقبل ليست
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Card(
                  child: Row(children: [
                    Expanded(child:
                    Hero(//تعطي انيميشن لانتقال الصور
                        tag: "${listRoomDataModel[index].roomId} ", //لازم يكون الرقم فريد
                        child: CachedNetworkImage(
                          imageUrl: LinksApp.linkImagRoom+"/"+"${listRoomDataModel[index].roomImg}",
                          height: 100,
                          fit: BoxFit.fill,
                        )
                    )),
                    Expanded(child: ListTile(
                      title:Text( "${translateDB(listRoomDataModel[index].categoriesNameAr, listRoomDataModel[index].categoriesName)}"),
                      subtitle:Text("${listRoomDataModel[index].roomPrice} \$"),
                    ),flex: 2,),
                  ],),
                ),
              )
          );
        }
    );
  }
}
