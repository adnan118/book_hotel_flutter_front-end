import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/imageasset.dart';
import 'package:flutter/material.dart';
 import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../Core/Constant/color.dart';
import '../../Core/Localization/changelocal.dart';
import '../Controller/getVerflyCodeSignUp_Controller.dart';
import '../Widget/customButtomAuth.dart';

class GetVerflyCodeSignUp extends GetView<LocalController> {
  GetVerflyCodeSignUp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    GetVerflyCodeSignUp_Controller getVerflyCodeSignUp_Controller =
        Get.put(GetVerflyCodeSignUp_Controller());
    return Scaffold(
        appBar: AppBar(
            backgroundColor: ColorApp.bacground,
            elevation: 0,
            centerTitle: true,
            leading: Text(""),
            title: Text("titleAppBarrAuthVfc".tr,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorApp.blacklight))),
        body: Stack(
          children: [
            Image.asset(
              ImageAssetApp.verifiedImg,
              height: double.infinity,
              width: double.infinity,
            ),
            GetBuilder<GetVerflyCodeSignUp_Controller>(
              builder: (getVerflyCodeSignUp_Controller) =>
                  HandlingStatusRemotDataRequest(
                      statusRequest: getVerflyCodeSignUp_Controller.statusRequest,
                      widget: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        child: ListView(
                          children: [
                            Text(
                              "bodyAuthVfc".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30,
                            ),

                            Text(
                              "${getVerflyCodeSignUp_Controller.email}",
                              style: Theme.of(context).textTheme.bodyLarge,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            OtpTextField(
                              numberOfFields: 5,
                              focusedBorderColor: ColorApp.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              fieldWidth: 40,
                              borderColor: ColorApp.primaryColor,
                              cursorColor: ColorApp.primaryColor,
                              //set to true to show as box or false to show as dash
                              showFieldAsBox: true,
                              //runs when a code is typed in
                              onCodeChanged: (String code) {
                                //handle validation or checks here
                              },
                              //runs when every textfield is filled
                              onSubmit: (String verificationCode) {
                                getVerflyCodeSignUp_Controller.succsessReset(verificationCode);
                              }, // end onSubmit
                            ),
                            //
                            SizedBox(
                              height: 350,
                            ),



                            CustomButtomAuth(
                              text:   "ResendCode".tr,
                              onPressed: () {
                                getVerflyCodeSignUp_Controller.ReSendCode();
                              },
                              colorBg: ColorApp.primaryColor,
                              colorText: ColorApp.bacground,
                              elevation: 5,
                            ),
                          ],
                        ),
                      ),)
            )
          ],
        ));
  }
}
