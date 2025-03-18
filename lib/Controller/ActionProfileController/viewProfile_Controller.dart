import 'dart:io';

import 'package:book_hotel/Data/Model/ProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import '../../Core/Services/services.dart';
import '../../DB/CRUD.dart';
import '../../DB/handlingData.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/EditProfileRemoteData.dart';
import '../../Data/DataSource/Remote/viewProfileRemoteData.dart';

class ViewProfile_Controller extends GetxController {
  GlobalKey<FormState> myKeyEp = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  ViewProfileRemoteData viewProfileRemoteData =
      ViewProfileRemoteData(Get.find());
  EditProfileRemoteData editProfileRemoteData =
      EditProfileRemoteData(Get.find());
  Myservices myservices = Get.find();
  ProfileModel? profileModel;

  List<ProfileModel> data = [];
  late TextEditingController fullname;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController desc;
  late var users_image;

  goToEditProfile() {
    Get.offNamed("/EditProfile");
  }

  goToProfile() {
    Get.offNamed("/ViewProfile");
  }

  @override
  getDataProfile() async {
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await viewProfileRemoteData
        .getDataProfile(myservices.sharedPref.getInt("users_id").toString()!);
    print("$response *****");
    //
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        if (data == null) {
          Get.defaultDialog(
            title: "Loading".tr,
            middleText: "Please Waiting",
            content: CircularProgressIndicator(),
            onCancel: () {},
          );
        } else {
          ProfileModel profile = ProfileModel.fromJson(response["data"]);
          data.add(profile);
          print(data);
          fullname = TextEditingController(text: profile.usersFullName);
          email = TextEditingController(text: profile.usersEmail);
          phone = TextEditingController(text: profile.usersPhone);
          password = TextEditingController(text: profile.usersPassword);
          desc = TextEditingController(text: profile.usersDesc);
          users_image = profile.usersImage!;
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  ////////////////////edit profile
  XFile? xfile;
  File? myfile;

  chooesImg() async {
    update();
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    myfile = File(xfile!.path);
    print(myfile);

    update();
  }

  @override
  setDataEditProfile() async {
    var formdata = myKeyEp.currentState;

    if (formdata!.validate()) {
      //loading
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (myfile == null) {
        print("$response ****uuuuu$users_image*");
        response = await editProfileRemoteData.getDataEditProfileWithoutFile(
          myservices.sharedPref.getInt("users_id").toString()!,
          fullname.text,
          email.text,
          phone.text,
          password.text,
          desc.text,
          users_image,
        );
        statusRequest = StatusRequest.none;
        update();
      } else {


        response = await editProfileRemoteData.getDataEditProfileWithFile(
          myservices.sharedPref.getInt("users_id").toString()!,
          fullname.text,
          email.text,
          phone.text,
          password.text,
          desc.text,
          users_image,
          myfile,
        );
        update();
      }
      print("$response ***vvvvv**");
      print(myfile);
      statusRequest = handlingData(response);
      Get.offAllNamed("/homePageHotelApp");
      update();
    }
  }

  @override
  void onInit() async {
    await getDataProfile();

    super.onInit();
  }

////////////////img
}
