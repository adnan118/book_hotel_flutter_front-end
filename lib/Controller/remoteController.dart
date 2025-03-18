/*
import 'package:get/get.dart';

import '../DB/statusRequest.dart';
import '../core/functions/HandlingDataController.dart';
import '../data/datasource/remote/remoteData.dart';

class TestGetData extends GetxController{
  RemoteData remoteData = RemoteData(Get.find());

  List data=[];
  late StatusRequest statusRequest ;

  getData()async{
    //loading
    statusRequest = StatusRequest.loading;
    var response = await remoteData.getData();
print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        data.addAll(response['data']);
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
*/