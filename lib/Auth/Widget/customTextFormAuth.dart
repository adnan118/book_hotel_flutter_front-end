import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/color.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String? title;
  final String? hint;
  final IconData icon;
  final bool? obscureText;
  final void Function()? onTapicon;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final TextInputType keyboardTypex;

  const CustomTextFormAuth({
    Key? key,
    this.title,
    this.hint,
    required this.icon,
    required this.myController,
      this.valid,
    required this.keyboardTypex,
    this.obscureText,
    this.onTapicon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        validator: valid,
        keyboardType: keyboardTypex,
        obscureText: obscureText == null || obscureText == false ? false : true,
        // isPassword,
        controller: myController,
        onChanged: (value){},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Text("$title",
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 18)),
          hintText: "$hint",
          hintStyle: Theme.of(context).textTheme.bodySmall,
          suffixIcon: InkWell(
            onTap: onTapicon,
            child: Icon(
              icon,
              color: ColorApp.thirdColor,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorApp.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorApp.thirdColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10,
          ),
        ),
      ),
    );
  }
}
