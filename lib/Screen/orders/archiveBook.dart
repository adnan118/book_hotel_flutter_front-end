import 'package:book_hotel/Widget/MyNotification/avatarImag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Classes/handlingStatusRemotDataView.dart';
import '../../Controller/orders/ArchiveController.dart';
import '../../Core/Constant/color.dart';
import '../../Data/Model/OrdersModel.dart';
import '../../Widget/General/CustTitle.dart';
import 'ShowRating.dart';

class ArchiveBook extends StatelessWidget {
  const ArchiveBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArchiveOrders_Controller archiveOrders_Controller =
        Get.put(ArchiveOrders_Controller());
    return Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: GetBuilder<ArchiveOrders_Controller>(
              builder: (archiveOrders_Controller) =>
                  HandlingStatusRemotDataView(
                      statusRequest: archiveOrders_Controller.statusRequest,
                      widget: ListView.builder(
                        itemCount: archiveOrders_Controller.data.length,
                        itemBuilder: (context, index) => CardOrdersList(
                          listData: archiveOrders_Controller.data[index],
                        ),
                      )))),
    );
  }
}

class CardOrdersList extends GetView<ArchiveOrders_Controller> {
  final OrdersModel listData;

  const CardOrdersList({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustTitle(
                text: "Basic Data", color: ColorApp.blackdark, sizeText: 13),
            Row(
              children: [
                Text(
                    " User-ID          :  \n Num_Invoice   : \n Status           : ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10, color: ColorApp.blacklight)),
                Text(
                    " ${listData.ordersUsersid}     \n ${listData.ordersId}   \n ${controller.convertStaus(listData.ordersStause)}      ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10, color: ColorApp.blacklight)),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            CustTitle(
                text: "General Data", color: ColorApp.blackdark, sizeText: 13),
            Row(
              children: [
                Text(
                    " Booking-Price          : \n Payment                 :    \n Booking-Date          : \n  Booking-Coupone   :   ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10, color: ColorApp.blacklight)),
                Text(
                    "${listData.ordersTotalprice}  \$ \n   ${controller.convertPaymentWay(listData.ordersPayments)}   \n ${listData.ordersDatetime}   \n ${controller.convertCoupon(listData.ordersCoupon)}           ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10, color: ColorApp.blacklight)),
              ],
            ),
            Row(
              children: [
                Text(" Total-Price :  ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10, color: ColorApp.blacklight)),
                Text(" ${listData.ordersTotalprice}  \$       ",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 10, color: ColorApp.blacklight)),
                Spacer(),
                IconButton(
                    onPressed: () {
                      Get.toNamed("/DetailsOrder",
                          arguments: {"ordersmodel": listData});
                    },
                    icon: Image.asset(
                      "assets/images/iconsviewmore.png",
                      fit: BoxFit.cover,
                      height: 45,
                      width: 45,
                    )),
                listData.ordersRating == 0
                    ? IconButton(
                        onPressed: () {
                          showRating(context, listData.ordersId);
                        },
                        icon: Image.asset(
                          "assets/images/iconstar.png",
                          fit: BoxFit.cover,
                          height: 28,
                          width: 28,
                        ))
                    : IconButton(
                        onPressed: () {
                          showRating(context, listData.ordersId);
                        },
                        icon: Image.asset(
                          "assets/images/iconstars.png",
                          fit: BoxFit.cover,
                          height: 28,
                          width: 28,
                        ))
              ],
            ),
            Row(

              children: [
                Text("Rating",  style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  fontSize: 13,
                  color: ColorApp.blacklight,
                )),
                SizedBox(width: 20,),
                Text("stars",  style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  fontSize: 13,
                  color: ColorApp.blacklight,
                )),
                SizedBox(width: 5,),
                Text(listData.ordersRating.toString(),  style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(
                  fontSize: 13,
                  color: ColorApp.blacklight,
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
