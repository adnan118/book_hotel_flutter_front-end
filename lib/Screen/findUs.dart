import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../Controller/findUs_Controller.dart';
import '../Controller/homePageHotelApp_Controler.dat.dart';
import '../Widget/FindUs/getInfoMyLocation.dart';
import '../Widget/General/listRoomSearch.dart';

class FindUs extends StatelessWidget {
  FindUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindUs_Controller findUs_Controller = Get.put(FindUs_Controller());

    return GetBuilder<HomePageHotelApp_ControllerImp>(
        builder: (homePageHotelApp_ControllerImp) => GetBuilder<
                FindUs_Controller>(
            builder: (controller) => ListView(
                  children: [
                    !homePageHotelApp_ControllerImp.isDoingSearch
                        ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                width: 200,
                                height: 400,
                                margin: EdgeInsets.all(5),
                                child: Card(
                                    child: Stack(
                                      children: [
                                        GoogleMap(
                                            onMapCreated:
                                                (GoogleMapController gmc) {},
                                            initialCameraPosition:
                                                controller.kGooglePlex,
                                            ///////////////////////
                                            circles: controller.mycircles,
                                            /////////////////////////////
                                            markers: controller.Mymarker,
                                            ///////////////////////////polygons
                                            polygons: controller.myPolygon(),
                                            ////////////////////////////type map
                                            mapType: MapType.normal
                                            //////////////////////////

                                            ),
                                      ],
                                    )),
                              ),
                              GetInfoMyLocation()
                            ],
                          )
                        : ListRoomSearch(
                            listRoomDataModel:
                                homePageHotelApp_ControllerImp.listdata),
                  ],
                )));
  }
}

/*
* https://console.cloud.google.com/google/maps-apis/api-list?project=app-shop-6c915
  افتح صفحة ادخال معلومات الدفع مع هي الصفحة
* */
