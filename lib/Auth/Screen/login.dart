import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Core/Constant/color.dart';
import '../../Core/Constant/imageasset.dart';
import '../../Core/Function/alertExitApp.dart';
import '../../Core/Function/validinput.dart';
import '../../Core/Localization/changelocal.dart';
import '../Controller/logIn_Controller.dart';
import '../Widget/customButtomAuth.dart';
import '../Widget/customTextFormAuth.dart';
import '../Widget/logoAuth.dart';

class Login extends GetView<LocalController> {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LogIn_Controller logIn_Controller = Get.put(LogIn_Controller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorApp.bacground,
        elevation: 0,
        centerTitle: true,
        title: Text("titleAuthLogin".tr,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: ColorApp.blacklight,
                )),
        leading: Text(""),
      ),
      body: WillPopScope(
          onWillPop: AlertExitApp,
          child: SafeArea(
              child: GetBuilder<LogIn_Controller>(
            builder: (logIn_Controller) => HandlingStatusRemotDataRequest(
                statusRequest: logIn_Controller.statusRequest,
                widget: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Form(
                      key: logIn_Controller.myKeyL,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          /*
                      شهادة نظام إدارة الجودة في فندق HOTEQ 500 تشير إلى أن الفندق قد حصل على شهادة تثبت أنه يتبع معايير عالية لضمان جودة الخدمات التي يقدمها.
                      يعني ذلك أن الفندق يدير عملياته بطريقة مرنة وفعالة لضمان رضا
                       العملاء وتلبية احتياجاتهم بشكل مستمر. تلك الشهادة تعكس التزام الفندق بتحقيق أعلى معايير الجودة وتحسين أدائه بشكل مستمر.
                      */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              LogoAuth(),
                              Image.asset(ImageAssetApp.HQ500,height:70,)
                            ],),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "WelcomApp".tr,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "WelcomAppHint".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontSize: 11, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFormAuth(
                            title: "fildEmail".tr,
                            hint: "user@example.com",
                            icon: Icons.email_outlined,
                            myController: logIn_Controller.email,
                            keyboardTypex: TextInputType.text,
                            valid: (val) {
                              return validinput(val!, 5, 30, "email");
                            },
                          ),
                          CustomTextFormAuth(
                            title: "fildPassword".tr,
                            hint: "********",
                            obscureText: logIn_Controller.isShowPassword,
                            icon: logIn_Controller.IconDataPassword,
                            onTapicon: () {
                              logIn_Controller.funShowPassword();
                            },
                            keyboardTypex: TextInputType.text,
                            myController: logIn_Controller.password,
                            valid: (val) {
                              return validinput(val!, 4, 13, "password");
                            },
                          ),
                          InkWell(
                            child: Text(
                              "titleBtnForgetpassword".tr,
                              style: Theme.of(context).textTheme.bodySmall,
                              textAlign: TextAlign.start,
                            ),
                            onTap: () {
                              logIn_Controller.Forgetpassword();
                            },
                          ),
                          CustomButtomAuth(
                            text: "titleBtnAuthLogin".tr,
                            onPressed: () {
                              logIn_Controller.login();
                            },
                            colorBg: ColorApp.primaryColor,
                            colorText: ColorApp.bacground,
                            elevation: 5,
                          ),
                          CustomButtomAuth(
                            text: "titleBtnAuthSignUp".tr,
                            onPressed: () {
                              logIn_Controller.signUp();
                            },
                            colorBg: ColorApp.secandryColor,
                            colorText: ColorApp.bacground,
                            elevation: 0,
                          ),
                        ],
                      ),
                    ))),
          )
          )
      ),
    );
  }
}
