import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class NaknameWithJoinWithDisc extends StatelessWidget {
  final String nkName;
  final String textDiscribtion;
  final String joind;
  const NaknameWithJoinWithDisc({Key? key, required this.nkName, required this.joind, required this.textDiscribtion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Column(
       children: [
      Row(children: [
        Text("@",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black45),),
        Text(nkName,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black45),),
        Spacer(),
        Row(children: [
          Image.asset("assets/images/iconcalender.png",height: 20,width: 20,),
          Text("Joined".tr,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black45),),
          Text(" $joind",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,color: Colors.black45),),
        ],),
      ],),
      SizedBox(height: 15),
      Row(
        children: [
          Expanded(child:
          Text(
          textDiscribtion ,
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
          )
        ],
      ),
    ],);
  }
}
