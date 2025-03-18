import 'package:get/get.dart';
import '../Auth/Screen/fpPages/ForgetPassword.dart';
import '../Auth/Screen/fpPages/GetVerflyCodeFP.dart';
import '../Auth/Screen/fpPages/ResetPassword.dart';
import '../Auth/Screen/fpPages/SuccsessReset.dart';
import '../Auth/Screen/getVerflyCodeSignUp.dart';
import '../Auth/Screen/login.dart';
import '../Auth/Screen/signUp.dart';
import '../Auth/Screen/succsessSignUp.dart';
import '../Core/Localization/languageItems/language.dart';
import '../Core/MiddleWare/mymiddleware.dart';
import '../Screen/ActionProfile/editProfile.dart';
import '../Screen/ActionProfile/viewProfile.dart';
import '../Screen/InfoRooms/checkout.dart';
import '../Screen/InfoRooms/customBooking.dart';
import '../Screen/InfoRooms/dataRoom.dart';
import '../Screen/InfoRooms/rooms.dart';
import '../Screen/MakeBooking/generateQr.dart';
import '../Screen/MyFavorit.dart'; 
import '../Screen/Scanner/ReadCodeInvoice.dart'; 
import '../Screen/findUs.dart';
import '../Screen/homeHotelApp.dart';
import '../Screen/homePageHotelApp.dart';
import '../Screen/myMooking.dart';
import '../Screen/myNotification.dart';
import '../Screen/offers.dart';
import '../Screen/onboarding.dart';
import '../Screen/orders/archiveBook.dart'; 
import '../Screen/orders/detailsOrder.dart';
import '../Screen/orders/mainTapOrders.dart';
import '../Screen/orders/pendingBook.dart'; 

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => Language(), middlewares: [Mymiddleware()]),

  //////////////////Auth
  GetPage(name: "/Login", page: () => Login()),
  GetPage(name: "/SignUp", page: () => SignUp()),
  GetPage(name: "/GetVerflyCodeSignUp", page: () => GetVerflyCodeSignUp()),
  GetPage(name: "/SuccsessSignUp", page: () => SuccsessSignUp()),
  GetPage(name: "/Language", page: () => Language()),
  //FP
  GetPage(name: "/GetVerflyCodeFP", page: () => GetVerflyCodeFP()),
  GetPage(name: "/ForgetPassword", page: () => ForgetPassword()),
  GetPage(name: "/SuccsessReset", page: () => SuccsessReset()),
  GetPage(name: "/ResetPassword", page: () => ResetPassword()),

  //Home Page
  GetPage(name: "/homePageHotelApp", page: () => homePageHotelApp()),
  GetPage(name: "/homeHotelApp", page: () => homeHotelApp()),
  GetPage(name: "/MyNotification", page: () => MyNotification()),
  GetPage(name: "/ViewProfile", page: () => ViewProfile()),
  GetPage(name: "/EditProfile", page: () => EditProfile()),

  //Favorit save page
  GetPage(name: "/MyFavorit", page: () => MyFavorit()),

  //Find us Page

  GetPage(name: "/FindUs", page: () => FindUs()),

  //Scanner Page
  GetPage(
      name: "/GenerateQr",
      page: () => GenerateQr(
            value: '',
            w: 0,
            h: 0,
          )),
  GetPage(name: "/ReadCodeInvoice", page: () => ReadCodeInvoice()),

  ////data room
  GetPage(name: "/DataRoom", page: () => DataRoom()),
  GetPage(name: "/Room", page: () => Room()),
  GetPage(name: "/CustomBooking", page: () => CustomBooking()),
  //offers
  GetPage(name: "/Offers", page: () => Offers()),

  GetPage(name: "/OnBoarding", page: () => OnBoarding()),
  //booking
  GetPage(name: "/MyMooking", page: () => MyBooking()),
  GetPage(name: "/CheckOut", page: () => CheckOut()),
  GetPage(name: "/MainTapOrders", page: () => MainTapOrders()),
  GetPage(name: "/DetailsOrder", page: () => DetailsOrder()),
  GetPage(name: "/ArchiveBook", page: () => ArchiveBook()),
  GetPage(name: "/PendingBook", page: () => PendingBook()),
  GetPage(name: "/CurrentBook", page: () => CurrentBook()),

  /////admins
 
];
