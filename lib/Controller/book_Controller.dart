import 'package:book_hotel/Data/Model/BookModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Core/Constant/color.dart';
import '../Core/Services/services.dart';
import '../DB/handlingData.dart';
import '../DB/statusRequest.dart';
import '../Data/DataSource/Remote/bookRemoteData.dart';
import '../Data/Model/couponModel.dart';

class Book_Controller extends GetxController {
  int discountcoupon = 0;
  String? couponname;
  String? couponId;
  TextEditingController? controllerCoupon;
  late StatusRequest statusRequest;

  Myservices myservices = Get.find();
  BookRemoteData bookRemoteData = BookRemoteData(Get.find());

  List<BookModel> data = [];
  double totalPriceOrdersRoom = 0;
  int totalCountRoom = 0;
  int typetotalCount = 0;
  CouponModel? couponModel;

  add(Roomid) async {
    update();
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await bookRemoteData.addBookRemoteData(
        myservices.sharedPref.getInt("users_id").toString()!, Roomid);
    print("$response *****");
    //
    print("010101001101010101");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response != null && response['status'] == "success") {
        //  data.addAll(response['data']);
        Get.rawSnackbar(
          backgroundColor: ColorApp.primaryColor.withOpacity(0.8),
          borderRadius: 20,
          margin: EdgeInsets.symmetric(horizontal: 3),
          title: "Done".tr,
          messageText: Text(
            "bodyDoneAdd".tr,
            style: TextStyle(color: ColorApp.blackdark, fontSize: 15),
          ),
        );
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  remove(Roomid) async {
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await bookRemoteData.removeBookRemoteData(
        myservices.sharedPref.getInt("users_id").toString()!, Roomid);
    print("$response *****");
    //
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          backgroundColor: ColorApp.primaryColor.withOpacity(0.8),
          borderRadius: 20,
          margin: EdgeInsets.symmetric(horizontal: 3),
          title: "Done".tr,
          messageText: Text(
            "bodyDoneDelete".tr,
            style: TextStyle(color: ColorApp.blackdark, fontSize: 15),
          ),
        );
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
    refreshPage();
  }

  int CountPro = 0;

  ///////////////////////////////s
  resetVarCard() {
    totalCountRoom = 0;
    totalPriceOrdersRoom = 0;
    typetotalCount = 0;
    data.clear(); //عشان اذا لم يبقى من المنتج اي قطعة يتم حذفه من القائمة ولا يبقى بها
  }

  refreshPage() {
    resetVarCard();
    viewCard(); //اعادة تشغيل صفحة
  }

  //////////////////////////////e

  viewCard() async {
    //loading
    statusRequest = StatusRequest.loading;
    update(); //ليعميل اللودينغ بعد  refreshPage
    var response = await bookRemoteData.getDataBookRemoteData(
      myservices.sharedPref.getInt("users_id").toString()!,
    );
    print("${response['data'] is num && response['data'].isFinite}   ");

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        //شرط انو اذا مافي بيانات لا يضل عم يعرض لودينغ لا نهائي
        if (response['data']['status'] == "success") {
          List dataresponse = response["data"]['data'];
          Map dataresponsecountprice = response["priceCount"];
          data.clear(); //عشان اذا لم يبقى من المنتج اي قطعة يتم حذفه من القائمة ولا يبقى بها
          data.addAll(dataresponse.map((e) => BookModel.fromJson(e)));

          totalCountRoom = (dataresponsecountprice["totalCountRoom"]);
          totalPriceOrdersRoom =
              ((dataresponsecountprice["totalPriceRoom"])).toDouble();
          update();
        }
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

//////////////////coupon

  goTocheckout() {
    /* if (data.isEmpty) {
      return Get.snackbar("Warning", "card is empty");
    }*/
    Get.toNamed("/CheckOut", arguments: {
      "coupon_id": couponId ?? "0",
      "orders_price": totalPriceOrdersRoom.toString(),
      "discountcoupon": discountcoupon.toString(),
    });
  }

  checkCouponPresses() async {
    //loading
    statusRequest = StatusRequest.loading;
    update();
    var response = await bookRemoteData.checkCoupon(controllerCoupon!.text);
    print("$response *****");
    //
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> datacoupon = response['data'];
        couponModel = CouponModel.fromJson(datacoupon);
        discountcoupon = couponModel!.couponDiscount!;
        couponname = couponModel!.couponName;
        couponId = couponModel!.couponId.toString();
      } else {
        // statusRequest = StatusRequest.failuer;
        discountcoupon = 0;
        couponname = null;
        couponId = null;
        Get.snackbar("titleerrorprofile".tr, "Couponisnotvalid".tr);
      }
    }
    update();
  }

  double t = 0;

  getTotalPriceAfterDiscount(days) {
    t = (totalPriceOrdersRoom - totalPriceOrdersRoom * discountcoupon / 100) *
        days;
    return (totalPriceOrdersRoom -
            totalPriceOrdersRoom * discountcoupon / 100) *
        days;
  }

  //////
  goToCustomBooking(BookModel) {
    Get.toNamed("/CustomBooking", arguments: {
      "bookModel": BookModel,
    });
  }

  @override
  void onInit() {
    controllerCoupon = TextEditingController();
    viewCard();
    super.onInit();
  }
}
