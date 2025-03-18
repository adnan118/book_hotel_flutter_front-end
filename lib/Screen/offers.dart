import 'package:book_hotel/Controller/offers_Controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Classes/handlingStatusRemotDataView.dart';
import '../Core/Constant/color.dart';
import '../Widget/AvatarAction/btnback.dart';
import '../Widget/General/header1.dart';
import '../Widget/General/header2.dart';
import '../Widget/Offers/listRoomOffers.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Offers_Controller offersController = Get.put(Offers_Controller());
    return Scaffold(
      appBar: AppBar(
        title: Header1(
          text: "SeasonOffers".tr,
          color: Colors.black54,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Btnback(),
      ),

      body: GetBuilder<Offers_Controller>(
          builder: (offersController) => Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Header1(
                          text: "introoffer".tr,
                          color: ColorApp.blackdark,
                        ),
                        SizedBox(height: 15,),
                        Header2(
                          text: "intro2offer".tr,
                          color: ColorApp.blacklight,
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/images/imgoffersHello.png",
                      height: 70,
                      width: 70,
                    ),
                  ],
                ),
                SizedBox(height: 30,),
                HandlingStatusRemotDataView(
                  statusRequest: offersController.statusRequest,
                  widget: ListView.separated(
                    separatorBuilder:(BuildContext, int)=> SizedBox(height: 30,),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: offersController.data.length,
                    itemBuilder: (context, index) {
                      return ListRoomOffers(roomModel: offersController.data[index],);

                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
