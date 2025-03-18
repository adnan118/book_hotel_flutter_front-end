import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:qr_code_dart_scan/qr_code_dart_scan.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../homePageHotelApp_Controler.dat.dart';

class ReadCodeController extends GetxController {
  HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp =
      HomePageHotelApp_ControllerImp();
  var results = <String>[].obs; // تعريف الـ Set
  List data = [];
  bool isThereInvoice = false;
  late StatusRequest statusRequest;

  Myservices myservices = Get.find();

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        false,
        ScanMode.QR,
      );
      results.clear();
      var after = qrCode.split("\n");
      results.addAll(after);

      printResults();
      if (results.length != 8) {
        isThereInvoice = false;
      } else {
        isThereInvoice = true;
      }
      update();
    } on PlatformException {
      results.add('Failed to scan QR Code.');
    }
  }

  void printResults() {
    print("QRCode_Result:--");
    for (int i = 0; i < results.length; i++) {
      print("$i: ${results[i]}");
    }
  }

  Future<void> scanBarcodeFromGallery() async {
    String qrCode = 'Unknown';
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      final decoder = QRCodeDartScanDecoder(
        formats: [
          // You can restrict specific formats.
          BarcodeFormat.QR_CODE,
        ],
      );

      Result? qrCode = await decoder.decodeFile(XFile(pickedImage.path));

      if (qrCode != null) {
        results.clear();
        var after = qrCode!.toString().split("\n");
        results.addAll(after);
        printResults();
        update();
        if (results.length != 8) {
          results.clear();
          isThereInvoice = false;
          results.addAll(["000","0","Start Date ","End Date ","0","0","0","0"]);
        } else {
          isThereInvoice = true;
        }
      }else{
        results.clear();
        results.addAll(["0","0","0","0","0","0","0","0"]);
      }

      update();
    } else {
      results.add('No image selected');
    }
  }

  void clearIsThereInvoice() {
    isThereInvoice = false;
    update();
  }

  final invoiceNumber = "0000";
  final String guestName = "Muhammad Faisal Dori";
  final String startDate = "01-01-2024";
  final String endDate = "01-15-2024";
  final String accompanyingPersonnel = "2";
  final String categoriesRoom = "Luxury";
  final Color colorCategoriesRoom = Colors.purple.withOpacity(0.7);

  @override
  void onInit() {
    results = <String>[].obs; // Reset results list
    homePageHotelApp_ControllerImp.roomTopBooking;
    super.onInit();
  }
}
