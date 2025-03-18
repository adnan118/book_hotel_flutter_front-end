
import 'dart:async';

import 'package:book_hotel/Controller/orders/pandingController.dart';
import 'package:get/get.dart';

import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/bookRemoteData.dart';
import '../../Data/Model/OrdersModel.dart';
import '../../Data/Model/categoiresModel.dart';

class DetailsOrder_Controller extends GetxController{

  Myservices myservices =Get.find();
  List<OrdersModel> data=[];
  late StatusRequest statusRequest ;
   BookRemoteData detailsorderRemote = BookRemoteData(Get.find());
  PandingOrders_Controller pandingOrders_Controller = PandingOrders_Controller();


  late OrdersModel ordersModel;



  @override
  getDetailsOrders( 	)async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await detailsorderRemote.getDataDetails( ordersModel.ordersId);//
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listData=response["data"];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
        print(ordersModel.ordersId );
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  @override
  void onInit() {

    ordersModel=Get.arguments["ordersmodel"];
     getDetailsOrders();

    super.onInit();
  }
}


