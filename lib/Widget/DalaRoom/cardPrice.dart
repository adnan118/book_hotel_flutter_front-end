import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../General/header2.dart';

class CardPrice extends StatelessWidget {
  final String price;
  final String sale;

  const CardPrice({Key? key, required this.price, required this.sale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Header2(text: "PriceforOneday".tr, color: Colors.black54),
              Header2(text: " $price \$ ", color: Colors.black54),
              Spacer(),
              Header2(text: "Sale".tr, color: Colors.black54),
              Header2(text: " $sale %", color: Colors.black54)
            ],
          ),
        ),
      ),
    );
  }
}
