import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {
  final String text;
  final Color color;

  const Header1({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize: 15,
            color: color,
          ),
    );
  }
}
