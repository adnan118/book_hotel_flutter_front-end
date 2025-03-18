import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/Scanner/ReadCodeInvoice_Controller.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';

import '../../Controller/orders/detailsOrderController.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/listRoomSearch.dart';
import '../../Widget/Scanner/templateInvoice.dart';

class ReadCodeInvoice extends StatelessWidget {
  ReadCodeInvoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ReadCodeController readCodeController = Get.put(ReadCodeController());

    return Scaffold(
        body: GetBuilder<HomePageHotelApp_ControllerImp>(
      builder: (homePageHotelApp_ControllerImp) =>
          !homePageHotelApp_ControllerImp.isDoingSearch
              ? GetBuilder<ReadCodeController>(
                  builder: (controller) => controller.isThereInvoice == false
                      ? TemplateInvoice(
                          nameHotel: "afamia alcham",
                          addressHotel: "Syria / Hama",
                          taxID: "118259",
                          email: "Email: afamiaalcham@gmail.com",
                          guestID: "000",
                          startDate: "Start Date ",
                          endDate: "End Date ",
                          ordersId: "0",
                          ordersPrice: "0",
                          ordersTotalprice: "0",
                          ordersStause: "0",
                          ordersDays: "0",
                          cols: ["Desc", "Price", "Days", "Total", "Net"],
                          cell: ["---", "0", "0", "0", "0"],
                          newScann: () {
                            controller.scanQRCode();
                          },
                          newScanngalary: () {
                            controller.scanBarcodeFromGallery();
                          },
                          clearInv: () {
                            controller.clearIsThereInvoice();
                          },
                        )
                      //                                    "${detailsOrder_Controller.data[index].ordersUsersid}\n
                      //                                    ${detailsOrder_Controller.data[index].ordersDatetime}\n
                      //                                    ${detailsOrder_Controller.data[index].ordersDatetimeEnd}\n
                      //                                    ${detailsOrder_Controller.data[index].ordersId}\n
                      //                                    ${detailsOrder_Controller.data[index].ordersPrice}\n
                      //                                    ${detailsOrder_Controller.data[index].ordersTotalprice}\n
                      //                                    ${detailsOrder_Controller.pandingOrders_Controller.convertStaus(detailsOrder_Controller.ordersModel.ordersStause)}\n
                      //                                    ${detailsOrder_Controller.data[index].ordersDays}"),
                      : TemplateInvoice(
                          nameHotel: "afamia alcham",
                          addressHotel: "Syria / Hama",
                          taxID: "118259",
                          email: "Email: afamiaalcham@gmail.com",
                          guestID: "${readCodeController.results[0]}",
                          startDate: "${readCodeController.results[1]}",
                          endDate: "${readCodeController.results[2]}",
                          ordersId: "${readCodeController.results[3]}",
                          ordersPrice: "${readCodeController.results[4]}",
                          ordersTotalprice: "${readCodeController.results[5]}",
                          ordersStause: "${readCodeController.results[6]}",
                          ordersDays: "${readCodeController.results[7]}",
                          cols: ["Desc", "Price", "Days", "Total", "Net"],
                          cell: [
                            "room",
                            "${readCodeController.results[4]}",
                            "${readCodeController.results[7]}",
                            "${readCodeController.results[5]}",
                            "${readCodeController.results[7]}",
                          ],
                          newScann: () {
                            controller.scanQRCode();
                          },
                          newScanngalary: () {
                            controller.scanBarcodeFromGallery();
                          },
                          clearInv: () {
                            controller.clearIsThereInvoice();
                          },
                        ),
                )
              : ListRoomSearch(
                  listRoomDataModel: homePageHotelApp_ControllerImp.listdata),
    ));
  }
}
