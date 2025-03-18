import 'package:flutter/material.dart';

import '../General/header2.dart';

class CardDesc extends StatelessWidget {
  final String text;
  const CardDesc({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Card(
      elevation: 3,
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child:  Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.blueGrey.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)
        ),
        child: Header2(
            text:  text
            ,color: Colors.black54 ),
      ),
    );
  }
}
