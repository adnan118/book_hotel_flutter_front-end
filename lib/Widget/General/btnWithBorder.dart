import 'package:flutter/material.dart';

class BtnWithBorder extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final  void Function()? onPressed;
  final double left;
  final double top;
  const BtnWithBorder({Key? key, required this.color, required this.text, required this.fontSize, required this.onPressed, required this.left, required this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: left,top: top),
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1,color: color)
      ),
      child: MaterialButton(
          child: Text(text,style:


            Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: fontSize,
              color: color,
                fontWeight: FontWeight.bold
            ),
          ),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: onPressed,
      ),
    );
  }
}
