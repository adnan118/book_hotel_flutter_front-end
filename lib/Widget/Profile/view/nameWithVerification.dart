import 'package:flutter/material.dart';

class NameWithVerification extends StatelessWidget {
  final String textName;
  final bool isverification;

  const NameWithVerification({Key? key, required this.textName, required this.isverification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Text(textName,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.black),),
            if(isverification == true)
                     Image.asset("assets/images/iconsverification.png",height: 25,width: 25,),
          ],),
        ],
      ),
    );
  }
}
