import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Widget/General/header2.dart';
import 'package:flutter/material.dart';

class CardPaymentWay extends StatelessWidget {
  final void Function()? onTap;
  final String Img;
  final bool isActive;

  const CardPaymentWay(
      {Key? key, this.onTap, required this.Img, required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(30),
        color: isActive == false ? null : ColorApp.fourthColor,
        child: Image.asset(Img,
            width: 5,
            height: 5,
            color: isActive == false
                ? ColorApp.secandryColor.withOpacity(0.4)
                : null),
        elevation: isActive == true ? 4 : 0,
      ),
    );
  }
}
