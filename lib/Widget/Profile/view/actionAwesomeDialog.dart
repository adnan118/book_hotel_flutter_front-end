import 'package:flutter/material.dart';
import '../../../Screen/findUs.dart';

class ActionAwesomeDialog extends StatelessWidget {
  const ActionAwesomeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        Stack(children: [

          Container(
              margin:EdgeInsets.only(top: 110),
              child:   FindUs()
          ),

          Container(

            padding:EdgeInsets.only(top: 20),
            margin:EdgeInsets.symmetric(vertical: 120,horizontal: 50),
            width: 500,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.black54 ,
            ),

          ),
        ],
    );
  }
}
