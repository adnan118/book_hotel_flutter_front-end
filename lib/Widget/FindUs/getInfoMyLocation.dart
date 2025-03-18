import 'package:book_hotel/Controller/findUs_Controller.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'btnLocation.dart';
import 'tableGetLocation.dart';

class GetInfoMyLocation extends GetView<FindUs_Controller> {
  const GetInfoMyLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        Container(
          width: 330,
          height: 170,
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.primaryColor,width: 2),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Table(
              border: TableBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              children: [
                TableRow(
                    children: [
                      BtnLocation(
                        textBtn: "TapstoGetinfoMylocation".tr,
                        imageBtn: "assets/images/iconmap.png",
                        onPressed:(){
                          controller.getInfoMyLocation();
                        } ,
                      ),
                    ]
                ),
                TableRow(children: [SizedBox(height: 10,),]),
                TableRow(
                    children: [
                      TableGetLocation()
                    ]
                ),
              ],
            ),
          ),
        )



      ],
    );
  }
}
