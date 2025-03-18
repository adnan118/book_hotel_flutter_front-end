import 'package:get/get.dart';

import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/checkoutRemoteData.dart';
import 'dataRoom_Controllrt.dart';

class CheckOut_Controller extends GetxController{
  DataRoom_Controller dataRoom_Controller=Get.put(DataRoom_Controller());

  String  varchoosePaymentway="1";
 // String ? varchooseShipping;

  late String couponId;
  late String priceOrders;
  late String discountcoupon;

  late StatusRequest statusRequest =StatusRequest.none;
  Myservices myservices =Get.find();
  CheckoutRemoteData checkoutRemoteData  =Get.put(CheckoutRemoteData(Get.find()));


  ChoosePaymentway(val){
    varchoosePaymentway=val;
    update();
  }
  ChooseShipping(val){
//    varchooseShipping=val;
    update();
  }

  checkout()async{
    if(varchoosePaymentway==null) return Get.snackbar("error", "select payment way");

    //loading
    statusRequest = StatusRequest.loading;
    update();
    Map data={
      "orders_usersid": myservices.sharedPref.getInt("users_id").toString() 	,
      "orders_type": "0",//varchooseShipping  ,
      "orders_price":  priceOrders ,
      "orders_coupon": couponId,
      "orders_payments":  varchoosePaymentway.toString(),
      "discountcoupon":discountcoupon.toString(),
      "orders_days":dataRoom_Controller.daysDifference.toString(),
      "orders_datetime_end":dataRoom_Controller.checkout.toString()
    };
    var response = await checkoutRemoteData.checkout(
        data
    );
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        Get.offAllNamed("/homePageHotelApp");
        Get.snackbar("Done".tr, "bodydonerorder".tr);
        print ("Doooooon Add Data");
      }else{
        statusRequest = StatusRequest.none;
        Get.snackbar("Warning".tr, "bodyWarning".tr);
      }
    }
    update();
  }



  @override
  void onInit() {
    couponId=Get.arguments["coupon_id"];
    priceOrders=Get.arguments["orders_price"];
    discountcoupon=Get.arguments["discountcoupon"].toString() ;
   // getShippingAddress();
    super.onInit();
  }
}