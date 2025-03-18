import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Controller/findUs_Controller.dart';

class CardMap extends StatelessWidget {
  const CardMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FindUs_Controller findUs_Controller =Get.find();
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25),
      elevation: 2,
      child: Container(
        height: 200,
        child: GoogleMap(
          onMapCreated:(GoogleMapController gmc){
          } ,
          initialCameraPosition: CameraPosition(
            bearing: 10,
            target: FindUs_Controller.localMy,
            zoom: 16,
          ),
          ////////////////////////////type map
          mapType: MapType.satellite,
          //////////////////////////
          markers: findUs_Controller.Mymarker,

        ),
      ),
    );
  }
}
