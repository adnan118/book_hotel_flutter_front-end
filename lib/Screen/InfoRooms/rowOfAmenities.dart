import 'package:flutter/material.dart';

import '../../Widget/General/header2.dart';

class RowOfAmenities extends StatelessWidget {
  final String icon1;
  final String text1;
  final Color ColorBg;

  RowOfAmenities({
    Key? key,
    required this.icon1,
    required this.text1,
    required this.ColorBg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 200,
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(2),
       
      child: CellRow(
        text: " $text1",
        icon: icon1, ColorBg: ColorBg,
      ),
    );
  }
}

class CellRow extends StatelessWidget {
  final String icon;
  final String text;
  final Color ColorBg;

  const CellRow({Key? key, required this.icon, required this.text, required this.ColorBg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorBg.withOpacity(0.3)),
      child: Row(
        children: [
          Image.network(
            icon,
            color: Colors.black54,
            fit: BoxFit.cover,
            height: 25,
            width: 25,
          ),
          //   Header2(text: text, color: Colors.black54),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
                color: Colors.black54,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
          )
        ],
      ),
    );
  }
}
