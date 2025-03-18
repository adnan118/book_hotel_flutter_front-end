import 'package:flutter/material.dart';
import '../General/header1.dart';

import '../General/header2.dart';

class CatAndRate extends StatelessWidget {
  final String icon;
  final String text;
  final Color colortext;
  final Color? coloricon;
  final bool? isAsset;

  const CatAndRate(
      {Key? key,
      required this.icon,
      required this.text,
      required this.colortext,
      required this.coloricon,
      required this.isAsset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isAsset == true
            ? Image.asset(icon, height: 25, color: coloricon)
            : Image.network(icon, height: 25, color: coloricon),
        SizedBox(
          width: 7,
        ),
        Header1(text: text, color: colortext),
      ],
    );
  }
}
