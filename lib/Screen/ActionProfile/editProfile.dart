import 'dart:io';

import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/Model/ProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Auth/Widget/customTextFormAuth.dart';
import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/findUs_Controller.dart';
import '../../Core/Function/validinput.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/Profile/view/stackHeader.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  ViewProfile_Controller viewProfile_Controller =
      Get.put(ViewProfile_Controller());
  FindUs_Controller findUs_Controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Header1(
            text: "tooltipMyProfile".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: SingleChildScrollView(
          child: InfoProfile(ListProfileModel: viewProfile_Controller.data),
        ));
  }
}

class InfoProfile extends GetView<ViewProfile_Controller> {
  final List<ProfileModel> ListProfileModel;

  InfoProfile({Key? key, required this.ListProfileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewProfile_Controller viewProfile_Controller =
        Get.put(ViewProfile_Controller());
    return GetBuilder<ViewProfile_Controller>(
        builder: (viewProfile_Controller) => HandlingStatusRemotDataRequest(
            statusRequest: viewProfile_Controller.statusRequest,
            widget: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: ListProfileModel.length,
                itemBuilder: (context, index) {
                  return Form(
                    key: viewProfile_Controller.myKeyEp,
                    child: Column(children: [
                      /////header
                      StackHeader(
                          bgImg: "assets/images/city_5.jpg",
                          profileImg: "${ListProfileModel[index].usersImage}",
                          profilMood: true,
                          isAsset: true),

                     Padding(
                       padding: EdgeInsets.only(right: 120, top: 0),
                     child: IconButton(
                       splashRadius: 25,
                       iconSize: 30,
                       icon:Image.asset(
                         "assets/images/iconadd.png",
                         fit: BoxFit.cover,
                         color: ColorApp.primaryColor,
                       ),
                       onPressed: ()   {
                         viewProfile_Controller.chooesImg();
                       },
                     ),),
                      ///// btn edit profile
                      BtnWithBorder(
                        color: ColorApp.primaryColor,
                        fontSize: 16,
                        text: "saveEdit".tr,
                        left: 260,
                        top: 20,
                        onPressed: ()  {
                           controller.setDataEditProfile();
                        },
                      ),

                      SizedBox(
                        height: 27,
                      ),

                      ///////// body

                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            /////name
                            CustomTextFormAuth(
                              title: "fildUsername".tr,
                              hint: "${ListProfileModel[index].usersFullName}",
                              obscureText: false,
                              icon: Icons.person,
                              myController: viewProfile_Controller.fullname!,
                              keyboardTypex: TextInputType.text,
                              valid: (val) {
                                return validinput(val!, 3, 20, "fullname");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildEmail".tr,
                              hint: "${ListProfileModel[index].usersEmail}",
                              icon: Icons.email_outlined,
                              myController: viewProfile_Controller.email,
                              keyboardTypex: TextInputType.text,
                              obscureText: false,
                              valid: (val) {
                                return validinput(val!, 5, 30, "email");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildPhone".tr,
                              hint: "${ListProfileModel[index].usersPhone}",
                              icon: Icons.phone,
                              myController: viewProfile_Controller.phone,
                              keyboardTypex: TextInputType.numberWithOptions(),
                              obscureText: false,
                              valid: (val) {
                                return validinput(val!, 5, 30, "phone");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildPassword".tr,
                              hint: "${ListProfileModel[index].usersPassword}",
                              obscureText: false,
                              icon: Icons.lock_outline,
                              keyboardTypex: TextInputType.text,
                              myController: viewProfile_Controller.password,
                              valid: (val) {
                                return validinput(val!, 4, 13, "password");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildDesc".tr,
                              hint: "${ListProfileModel[index].usersDesc}",
                              obscureText: false,
                              icon: Icons.description_outlined,
                              myController: viewProfile_Controller.desc!,
                              keyboardTypex: TextInputType.text,
                            ),
                      //      Image.file(viewProfile_Controller.file!),
                          ],
                        ),
                      )
                    ]),
                  );
                })));
  }
}

/*
 NameWithVerification(
                      textName: "${ListProfileModel[index].usersFullName}",
                      isverification: false,
                    ),
                    /////nk name + joined + Disc
                    NaknameWithJoinWithDisc(
                      nkName: "${ListProfileModel[index].usersName}",
                      joind:  "${ListProfileModel[index].usersCreateTime}",
                      textDiscribtion:  "${ListProfileModel[index].usersDesc}",
                    ),

                    /////////////////////////// Connection Data
                    ConnectionData(
                      image: "assets/images/iconmail.png",
                      content: "${ListProfileModel[index].usersEmail}",
                      mail1Phone2Link3Sms4: 1,
                    ),
                    ConnectionData(
                      image: "assets/images/iconphone.png",
                      content: "${ListProfileModel[index].usersPhone}",
                      mail1Phone2Link3Sms4: 2,
                    ),

                    LocationWithMap(),
*/
