import 'package:flutter/material.dart';

class BtnLocation extends StatelessWidget {
  final void Function()? onPressed;
  final String textBtn;
  final String imageBtn;
  const BtnLocation({Key? key, this.onPressed, required this.textBtn, required this.imageBtn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     MaterialButton(
      onPressed:onPressed,
      elevation: 5,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.orange.shade50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(imageBtn ,height: 40,width: 40,),
          Text(textBtn,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(
                fontSize: 15,

              )
          )
        ],) ,
    );
  }
}
