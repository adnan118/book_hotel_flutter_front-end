import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'actionAwesomeDialog.dart';
import 'cardMap.dart';

class LocationWithMap extends StatelessWidget {
  const LocationWithMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return     Row(

      children: [
        Expanded(child:
        ListTile(//#8D8F90
          leading:  Image.asset("assets/images/iconscompass.png",height: 25,width: 25,color: Colors.grey,),
          title: CardMap(),
          contentPadding: EdgeInsets.all(0),
          minLeadingWidth: 15,
          onTap: (){
            //    Get.offNamed("/FindUs");
            AwesomeDialog(
              context: context,
              dialogType: DialogType.noHeader,

              width: 280,
              buttonsBorderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              title: 'Note'.tr,
              desc: 'bodyNote'.tr,
              showCloseIcon: true,
              btnOkText: "Continuebtn".tr,
              btnOkColor: ColorApp.primaryColor,
              descTextStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorApp.blacklight),
              titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorApp.blackdark),
              buttonsTextStyle:Theme.of(context).textTheme.bodySmall!.copyWith(color: ColorApp.bacground),
              btnOkOnPress: () {
                Get.bottomSheet(
                 ActionAwesomeDialog(),
                  isScrollControlled: true, // يجعل الـ BottomSheet يمتد لأعلى بدلاً من الارتفاع الافتراضي
                  barrierColor: Colors.black.withOpacity(0.7), // تعيين لون الخلفية
                );
              },
            ).show();
          },
        ),
        )
      ],
    );
  }
}
