import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Classes/HandlingDataController.dart';
import '../Core/Services/services.dart';
import '../DB/statusRequest.dart';
import '../Data/DataSource/Remote/homePageHotelAppRemoteData.dart';
import '../Data/Model/favoriteModel.dart';
import '../Data/Model/roomModel.dart';
import '../Screen/MyFavorit.dart';
import '../Screen/Scanner/ReadCodeInvoice.dart';
import '../Screen/findUs.dart';
import '../Screen/homeHotelApp.dart';

abstract class HomeController extends SearchMixController {
  initialData();

  getData();

  goToCategory(List categor, int selectCategor, String categoriesid);
}

class HomePageHotelApp_ControllerImp extends HomeController {
  HomePageHotelAppRemoteData homePageHotelAppRemoteData =
      HomePageHotelAppRemoteData(Get.find());
  Myservices myservices = Get.find();
  late StatusRequest statusRequest = StatusRequest.none;
  int CurrentPage = 0;
  int CurrentPageCategories = 0;

  String? username;
  List categories = [];
  List room = [];
  List roomTopBooking = [];
  FavoriteModel? favoriteModel;
  List<Widget> listPage = [
    homeHotelApp(),
    FindUs(),
   // MyFavorit(),
    ReadCodeInvoice(),
  ];

  //////////////////////////////////////// functions

  @override
  changPage(int page) {
    CurrentPage = page;
    update();
  }

  changPageCategories(int pageCat) {
    CurrentPageCategories = pageCat;
    update();
  }

  goToDataRoom(RoomModel) {
    Get.toNamed("/DataRoom", arguments: {
      "roomModel": RoomModel,
    });
  }

  @override
  goToCategory(categor, selectCategor, categoriesid) {
    Get.toNamed("/Room", arguments: {
      "categor": categor,
      "selectCategor": selectCategor,
      "catid": categoriesid,
    });
    update();
  }

  ///////////////////////// get all data home
  @override
  getData() async {
    //loading
    statusRequest = StatusRequest.loading;
    room.clear();
    update();
    var response = await homePageHotelAppRemoteData.getData();
    print("$response *****");
    //
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']["data"]);
        room.addAll(response['room']["data"]);
        print("00000000000000$room");

        if(response['roomTopBooking']["data"] == null){
          roomTopBooking.addAll(response['room']["data"]);
        }else {

          roomTopBooking.addAll(response['roomTopBooking']["data"]);
        }
        print("11111111111111111111$roomTopBooking");
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  goToViewProfile() {
    Get.toNamed("/ViewProfile");
    print("View Profile");
  }

  logOutExit() {
    Get.offAllNamed("/Language");
    //الغاء الاشتراك بالاشعارات
    // اشعار للكل
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    // اشعار لمستخدم معين
    String userId =
    myservices.sharedPref.getInt("users_id").toString()!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users ${userId}");

    myservices.sharedPref.clear();

    print("Log out");
  }

  initialData() {
    username = myservices.sharedPref.getString("users_name");
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic("users");
    searchController = TextEditingController();
    myFavoriteController.getData();
    initialData();
    getData();
    super.onInit();
  }
}

/////////////////////////
class SearchMixController extends GetxController {
  TextEditingController? searchController;

  HomePageHotelAppRemoteData homeRemoteData =
      HomePageHotelAppRemoteData(Get.find());

  late StatusRequest statusRequest = StatusRequest.success;

  List<RoomModel> listdata = [];
  bool isDoingSearch = false;

  checkSearch(val) {
    if (val == "") {
      //في البداية لايقوم بالبحث
      statusRequest = StatusRequest
          .none; //عند البحث عن شي غير موجود وحذفت البحث لاتعود الصفحة مع المنتجات الا بعد هذا الاجراء
      isDoingSearch = false;
    }
    update();
  }

  onPressSearchPro() {
    //عند الضغط على زر البحث
    isDoingSearch = true;
    searchData();
    update();
  }

  searchData() async {
    //loading
    statusRequest = StatusRequest.loading;
    var response = await homeRemoteData.getSearchData(searchController!.text);
    print("$response *****");
    //
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listdata.clear();
        List responsedata = response["data"];
        listdata.addAll(responsedata.map((e) => RoomModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
}
