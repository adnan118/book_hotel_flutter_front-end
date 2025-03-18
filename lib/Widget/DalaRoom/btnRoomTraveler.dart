import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BtnRoomTraveler  extends StatelessWidget {
  final void Function()? onPlus;
  final void Function()? onMinus;
  final int Count;
  const BtnRoomTraveler({
    Key? key,
    this.onPlus,
    this.onMinus,
    required this.Count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Custome Travelers and Rooms"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ////  ++ pluse
            InkWell(
              onTap: onPlus,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.red),
                child: Icon(Icons.plus_one),
              ),
            ),
            ////text Count
            Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: Colors.transparent),
                child: Center(
                  child: Text("$Count"),
                )),
            ////  -- mins

            InkWell(
              onTap: onMinus,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5),
                height: 30,
                width: 50,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.blue),
                child: Icon(Icons.exposure_minus_1_sharp),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
