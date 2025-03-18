import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Widget/General/header1.dart';
import 'package:flutter/material.dart';

class TitleGroup extends StatelessWidget {
  final String icon;
  final String text;
  const TitleGroup({Key? key, required this.icon, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ListTile(
      leading: Image.asset(
        icon,
        fit: BoxFit.cover,
        height: 35, width: 35,
      ),
      title:Header1(text: text, color: Colors.black),
    );
  }
}
