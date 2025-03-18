import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Classes/handlingStatusRemotDataView.dart';
import '../../Controller/Invoice_Controller.dart';
import '../../Controller/orders/detailsOrderController.dart';
import '../../Core/Constant/color.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/CustTitle.dart';
import '../../Widget/General/header1.dart';
import '../MakeBooking/generateQr.dart';

class DetailsOrder extends StatelessWidget {
  const DetailsOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailsOrder_Controller detailsOrder_Controller =
        Get.put(DetailsOrder_Controller());
    Invoice_Controller invoice_controller = Get.put(Invoice_Controller());
    return Scaffold(
      appBar: AppBar(
        title: Header1(
          text: "Bookingdetails".tr,
          color: Colors.black54,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Btnback(),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: GetBuilder<DetailsOrder_Controller>(
          builder: (detailsOrder_Controller) => HandlingStatusRemotDataRequest(
              statusRequest: detailsOrder_Controller.statusRequest,
              widget: ListView(
                children: [
                  Image.asset(
                    "assets/images/timecoast.gif",
                    width: 130,
                    height: 130,
                  ),
                  Center(
                    child: CustTitle(
                        color: ColorApp.secandryColor,
                        sizeText: 15,
                        text: "textmoredata".tr),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustTitle(
                      color: ColorApp.blacklight,
                      sizeText: 15,
                      text: "coast".tr),
                  Card(
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text("Price".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.thirdColor,
                                  )),
                          Text("Days".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.thirdColor,
                                  )),
                          Text("TotalPrice".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.thirdColor,
                                  )),
                        ]),
                        TableRow(children: [
                          Text(
                              "${detailsOrder_Controller.ordersModel.ordersPrice}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.blacklight,
                                  )),
                          Text(
                              "${detailsOrder_Controller.ordersModel.ordersDays}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.blacklight,
                                  )),
                          Text(
                              "${detailsOrder_Controller.ordersModel.ordersTotalprice}",
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.blacklight,
                                  )),
                        ]),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustTitle(
                      color: ColorApp.blacklight,
                      sizeText: 15,
                      text: "time".tr),
                  Card(
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text("start".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.thirdColor,
                                  )),
                          Text("end".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.thirdColor,
                                  )),
                        ]),
                        ...List.generate(
                          detailsOrder_Controller.data.length,
                          (index) => TableRow(children: [
                            Text(
                                "${detailsOrder_Controller.ordersModel.ordersDatetime}",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 13,
                                      color: ColorApp.blacklight,
                                    )),
                            Text(
                                "${detailsOrder_Controller.ordersModel.ordersDatetimeEnd}",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 13,
                                      color: ColorApp.blacklight,
                                    )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Card(
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text("status".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.thirdColor,
                                  )),
                        ]),
                        ...List.generate(
                          detailsOrder_Controller.data.length,
                          (index) => TableRow(children: [
                            Text(
                                "${detailsOrder_Controller.pandingOrders_Controller.convertStaus(detailsOrder_Controller.ordersModel.ordersStause)}"
                                    .tr,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontSize: 13,
                                      color: ColorApp.blacklight,
                                    )),
                          ]),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text("Qr".tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontSize: 13,
                                    color: ColorApp.thirdColor,
                                  )),
                        ]),
                        ...List.generate(
                          detailsOrder_Controller.data.length,
                          (index) => TableRow(children: [
                            GenerateQr(
                              h:130,
                                w: 130,
                                value:
                                    "${detailsOrder_Controller.data[index].ordersUsersid}\n${detailsOrder_Controller.data[index].ordersDatetime}\n${detailsOrder_Controller.data[index].ordersDatetimeEnd}\n${detailsOrder_Controller.data[index].ordersId}\n${detailsOrder_Controller.data[index].ordersPrice}\n${detailsOrder_Controller.data[index].ordersTotalprice}\n${detailsOrder_Controller.pandingOrders_Controller.convertStaus(detailsOrder_Controller.ordersModel.ordersStause)}\n${detailsOrder_Controller.data[index].ordersDays}"),
                          ]),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
