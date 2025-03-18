import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/Model/ProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/findUs_Controller.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/Profile/view/connectionData.dart';
import '../../Widget/Profile/view/locationWithMap.dart';
import '../../Widget/Profile/view/naknameWithJoin.dart';
import '../../Widget/Profile/view/nameWithVerification.dart';
import '../../Widget/Profile/view/stackHeader.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewProfile_Controller viewProfile_Controller = Get.put(
        ViewProfile_Controller());
    FindUs_Controller findUs_Controller = Get.find();

    return GetBuilder<ViewProfile_Controller>(
        builder: (controller) =>
            Scaffold(
                appBar: AppBar(
                  title: Header1(text: "tooltipMyProfile".tr, color: Colors.black54,),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading:Btnback(),
                ),
                body:InfoProfile(ListProfileModel: viewProfile_Controller.data,)
            )
    );
  }
}


class InfoProfile extends GetView<ViewProfile_Controller> {
  final List<ProfileModel>ListProfileModel;

  InfoProfile({Key? key, required this.ListProfileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        shrinkWrap: true,

    itemCount: ListProfileModel.length,
    itemBuilder: (context,index) {
      return  Column(
        children: [
          /////header
          StackHeader(bgImg: "assets/images/city_5.jpg",
              profileImg:   "${ListProfileModel[index].usersImage}",
              profilMood: true,
              isAsset: true),

          ///// btn edit profile
          BtnWithBorder(
            color: ColorApp.primaryColor,
            fontSize: 16,
            text: "Editprofile".tr,
            left: 260,
            top: 20,
            onPressed: () {
              controller.goToEditProfile();
            },
          ),

          SizedBox(height: 27,),

          ///////// body

          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                /////name
                NameWithVerification(
                  textName: "${ListProfileModel[index].usersFullName}",
                  isverification: true,
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

              ],
            ),
          ),
        ],

      );
    }
    );


    }
  }

