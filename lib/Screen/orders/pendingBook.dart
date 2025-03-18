import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Classes/handlingStatusRemotDataView.dart';
import '../../Controller/orders/pandingController.dart';
import '../../Core/Constant/color.dart';
import '../../Data/Model/OrdersModel.dart';
import '../../Widget/General/CustTitle.dart';

class PendingBook extends StatelessWidget {
  const PendingBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PandingOrders_Controller pendingOrders_Controller=Get.put(PandingOrders_Controller());
    return Scaffold(

      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child:
          GetBuilder<PandingOrders_Controller>(
              builder: (pendingOrders_Controller)=>
                  HandlingStatusRemotDataView(
                      statusRequest: pendingOrders_Controller.statusRequest,
                      widget:   ListView.builder(
                        itemCount: pendingOrders_Controller.data.length,
                        itemBuilder: (context,index)=>
                            CardOrdersList(
                              listData: pendingOrders_Controller.data[index],
                            ),
                      ))
          )

      ),
    );
  }
}


class CardOrdersList extends GetView<PandingOrders_Controller> {
  final OrdersModel listData;
  const CardOrdersList({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PandingOrders_Controller pendingOrders_Controller=Get.put(PandingOrders_Controller());

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:20,vertical: 10),
        alignment: Alignment.centerLeft,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustTitle( text: "Basic Data",color:ColorApp.blackdark,sizeText: 13 ),
            Row(children: [
              Text(
                  " User-ID          :  \n Num_Invoice  : \n Status           : ",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12,color: ColorApp.blacklight)
              ),
              Text(
                  " ${listData.ordersUsersid}     \n ${listData.ordersId}   \n ${controller.convertStaus(listData.ordersStause)}      ",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12,color: ColorApp.blacklight)
              ),
            ],),
             SizedBox(height: 13,),
             CustTitle( text: "General Data",color:ColorApp.blackdark,sizeText: 13  ),

            Row(children: [
              Text(
                  " Booking-Price          : \n Payment                 :    \n Booking-Date          : \n  Booking-Coupone   :   ",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12,color: ColorApp.blacklight)
              ),
              Text(
                  "${listData.ordersTotalprice}  \$ \n   ${controller.convertPaymentWay(listData.ordersPayments)}   \n ${listData.ordersDatetime}   \n ${controller.convertCoupon(listData.ordersCoupon)}           ",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 12,color: ColorApp.blacklight)
              ),
            ],),
            Row(children: [
              Text(
                  " Total-Price :  ",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 13,color: ColorApp.primaryColor)
              ),
              Text(
                  " ${listData.ordersTotalprice}  \$       ",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 13,color: ColorApp.primaryColor)
              ),

              Spacer(),
              IconButton(onPressed: (){

                Get.toNamed("/DetailsOrder",arguments: {"ordersmodel":listData});
              }, icon:
              Image.asset(
                "assets/images/iconsviewmore.png",
                fit: BoxFit.cover,
                height: 45, width: 45,
              )),
              if(listData.ordersStause==0)



              IconButton(
                  onPressed: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      width: 280,
                      buttonsBorderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      title: 'Note'.tr,
                      desc: 'bodyNotedelete'.tr,
                      showCloseIcon: true,
                      btnOkText: "Continuebtn".tr,
                      btnOkColor: ColorApp.primaryColor,
                      descTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorApp.blacklight),
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorApp.blackdark),
                      buttonsTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorApp.bacground),
                      btnOkOnPress: () {

                        pendingOrders_Controller.deletOrders(listData.ordersId);
                        print("${pendingOrders_Controller.deletOrders(listData.ordersId)}");

                      },
                    ).show();
                  },
                  icon: Image.asset(
                    "assets/images/iconremove.png",
                    fit: BoxFit.cover,
                    height: 28,
                    width: 28,
                    color: ColorApp.orangeDeep,
                  )),
            ],),
          ],),
      ),
    );
  }
}
