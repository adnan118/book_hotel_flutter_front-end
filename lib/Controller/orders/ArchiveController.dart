import 'package:get/get.dart';

import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/bookRemoteData.dart';
import '../../Data/Model/OrdersModel.dart';
 class ArchiveOrders_Controller extends GetxController{

  Myservices myservices =Get.find();
   BookRemoteData archiveRemoteData = BookRemoteData(Get.find());

  List <OrdersModel>data=[];
  late StatusRequest statusRequest ;
  @override
  getOrders( 	)async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    var response = await archiveRemoteData.getDataArchive( myservices.sharedPref.getInt("users_id").toString()!);
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listData=response["data"];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }


  convertPaymentWay(val){
    if(val ==0){return "Cash";}
    else if(val ==1){return "Bank Card";}
  }
  convertShippingWay(val){
    if(val ==0){return "Delivery";}
    else{return "Parcel Shop";}
  }
  convertStaus(val){
    if(val ==1){return "Current";}
    else if(val==0){return "Processes";}
    else{return "Archive";}
  }
  convertCoupon(val){
    if(val >0){return "Used";}
    else{return "Did not use";}
  }
  submitRatingfromcontroller(int orderid ,String comment, rating)async{
  //data.clear();
    //loading
  statusRequest = StatusRequest.loading;
    update();
    var response = await archiveRemoteData.Rating(
       orderid.toString(),
      comment.toString(),
      rating.toString()
    );
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
       print("success rating........");
       Get.snackbar("".tr, "thnks".tr);
       getOrders();
      }else{
        Get.snackbar("".tr, "nothnks".tr);
    //     statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  @override
  void onInit() {
    getOrders();
    super.onInit();
  }
}