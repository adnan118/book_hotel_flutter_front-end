import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/findUs_Controller.dart';

class TableGetLocation extends GetView<FindUs_Controller> {
  const TableGetLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/MyLogo.jpg" ,height: 50,width: 50,),
            Text("- - - -",style: TextStyle(fontSize: 30,color: Colors.grey),),
            Image.asset("assets/images/iconroute.png" ,height: 50,width: 50,color: Colors.grey),
            Text("- - - -",style: TextStyle(fontSize: 30,color: Colors.grey),),
            Image.asset("assets/images/iconpersonwalk.png" ,height: 50,width: 50 ),

          ],),
        SizedBox(height: 20,),
        Text("${controller.distanceKM} Km",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.grey)),

      ],
    );
  }
}
