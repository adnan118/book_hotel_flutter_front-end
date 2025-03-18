import 'package:flutter/material.dart';

class CustTitle extends StatelessWidget {
  final String text;
  final double sizeText;
  final  Color color;
  const CustTitle({Key? key, required this.text, required this.color, required this.sizeText, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style:    Theme.of(context)
        .textTheme
        .bodySmall!
        .copyWith(
      fontSize: sizeText,
      color: color,
    )
    );
  }
}
