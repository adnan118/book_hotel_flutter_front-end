import 'package:book_hotel/Data/Model/InvoiceModel.dart';
import 'package:get/get.dart';

import '../Classes/HandlingDataController.dart' ;
import '../Core/Services/services.dart';
import '../DB/statusRequest.dart';
import '../Data/DataSource/Remote/InvoiceRemoteData.dart';


class Invoice_Controller extends GetxController{

   InvoiceModel? invoiceModel;
  List data =[];

  late StatusRequest statusRequest ;
  Myservices myservices =Get.find();
   InvoiceRemoteData invoiceRemoteData = InvoiceRemoteData(Get.find());


  getData(roomId,ordersId)async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await invoiceRemoteData.getDataInvoice(myservices.sharedPref.getInt("users_id"),roomId,ordersId);

    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
      /////////////////
      List dataresponse= response["data"];
      data.addAll(response['data']);
print("2222222222222$data");

      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }


  @override
  void onInit() {
    super.onInit();
  }
}