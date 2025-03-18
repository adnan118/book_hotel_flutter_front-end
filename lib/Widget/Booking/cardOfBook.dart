import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/book_Controller.dart';
import '../../Core/Constant/color.dart';

class CardOfBook extends StatelessWidget {
  final String title;
  final String text1;
  final String text1value;
  final String text2;
  final String text2value;
  final String typeImgCard;
  final Color colorCircle;

  const CardOfBook({
    Key? key,
    required this.title,
    required this.text1,
    required this.text1value,
    required this.text2,
    required this.text2value,
    required this.typeImgCard,
    required this.colorCircle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book_Controller book_controller = Get.put(Book_Controller());

    return   Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        child: Stack(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: ColorApp.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: ListTile(
                title: Text(title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 18)),
                subtitle: Column(
                  children: [
                    Row(
                      children: [
                        Text(text1,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16, color: Colors.white)),
                        Text(text1value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16, color: Colors.white))
                      ],
                    ),
                    //////
                    Row(
                      children: [
                        Text(text2,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16, color: Colors.white)),
                        Text(text2value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 16, color: Colors.white))
                      ],
                    ),
                  ],
                ),
                leading: Image.asset(typeImgCard),
              ),
            ),

            Positioned(
              right: -80,
              top: -80,
              child: Container(
                alignment: Alignment.bottomLeft,
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    color: colorCircle,
                    borderRadius: BorderRadius.circular(160),
                    border: Border.all(
                      color: ColorApp.secandryColor.withOpacity(0.2),
                      width: 10,
                      style: BorderStyle.solid,
                    )),
              ),
            ),
            Positioned(
              right: 250,
              top: 35,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color:colorCircle,
                  borderRadius: BorderRadius.circular(160),
                  border: Border.all(
                    color: Colors.black26,
                    width: 10,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 50,
              top: 75,
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color:colorCircle,
                  borderRadius: BorderRadius.circular(160),
                  border: Border.all(
                    color: ColorApp.fourthColor.withOpacity(0.5),
                    width: 10,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),



          ],
        ),
      )
    ;
  }
}
