import 'package:flutter/material.dart';

class Header2 extends StatelessWidget {
  final String text;
   final Color color;
   const Header2({Key? key, required this.text,    required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(2),
      child: Text(
        text,
        style:

        Theme.of(context).textTheme.labelLarge!.copyWith(
          fontSize: 12,
          color: color,
        ),
      ),
    );
  }
}
