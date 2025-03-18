import 'package:flutter/material.dart';


class MyAppBar extends StatelessWidget {
  final String titleAppBar;
   final void Function()? onPressedSearching;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const MyAppBar({
    Key? key, required this.titleAppBar, this.onPressedSearching, this.onChanged,  required this.myController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return       Container(
         margin: EdgeInsets.only(top: 15,bottom: 15),
        height: 40,
        child: Row(
          children: [
            Expanded(
                child:TextFormField(
                  controller: myController,
                  onChanged: onChanged,
                  decoration:   InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide.none,

                      ),
                      filled: true,
                      fillColor: Colors.black12,
                      contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                      hintText: titleAppBar,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: onPressedSearching,
                      )
                  ),
                )
            ),


          ],
        )
    );
  }
}
