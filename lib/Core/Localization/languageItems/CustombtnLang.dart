import 'package:flutter/material.dart';
import '../../Constant/color.dart';


class CustombtnLanguage extends StatelessWidget {
  final String textBtn;
  final void Function()? onPressed;
  const CustombtnLanguage({Key? key, required this.textBtn, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              child: MaterialButton(
                child: Text(textBtn,style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: ColorApp.bacground),),
                color: ColorApp.primaryColor,
                onPressed: onPressed,
              ),
            )
          ],
        )
    );
  }
}
