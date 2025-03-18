import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Widget/DalaRoom/titleGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';

import '../../Auth/Widget/customButtomAuth.dart';
import '../../Classes/handlingStatusRemotDataView.dart';
import '../../Controller/DataRoom/checkout_Controller.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/checkout/cardPaymentWay.dart';
import '../../Widget/checkout/priceCash.dart';
import '../../paypal/PayPalCheckOut.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckOut_Controller checkOut_Controller = Get.put(CheckOut_Controller());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CheckOut_Controller>(
            builder: (checkOutController) => Container(
                margin: EdgeInsets.symmetric(horizontal: 45),
                child: checkOut_Controller.varchoosePaymentway == "1"
                    ? CustomButtomAuth(
                        onPressed: () {
                          checkOut_Controller.checkout();
                        },
                        elevation: 3,
                        colorText: ColorApp.bacground,
                        colorBg: ColorApp.secandryColor,
                        text: "bookConfirm".tr,
                      )
                    : Text(""))),
        appBar: AppBar(
          title: Header1(
            text: "bookConfirm".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: GetBuilder<CheckOut_Controller>(
            builder: (checkOutController) => HandlingStatusRemotDataView(
                  statusRequest: checkOutController.statusRequest,
                  widget: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: ListView(children: [
                        TitleGroup(
                            icon: "assets/images/iconpay.png",
                            text: "ChoosePaymentWay".tr),
                        GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 25,
                                  crossAxisSpacing: 50),
                          shrinkWrap: true,
                          children: [
                            CardPaymentWay(
                              Img: "assets/images/iconaccountbank.png",
                              isActive:
                                  checkOutController.varchoosePaymentway == "0"
                                      ? true
                                      : false,
                              onTap: () {
                                checkOutController.ChoosePaymentway("0");
                              },
                            ),
                            CardPaymentWay(
                              Img: "assets/images/iconscash.png",
                              isActive:
                                  checkOutController.varchoosePaymentway == "1"
                                      ? true
                                      : false,
                              onTap: () {
                                checkOutController.ChoosePaymentway("1");
                              },
                            ),
                          ],
                        ),
                        Center(
                          child: Header1(
                              text:
                                  checkOutController.varchoosePaymentway == "1"
                                      ? "cash".tr
                                      : "accountbank".tr,
                              color: ColorApp.blacklight),
                        ),
                        //accountbank =0  //cash =1
                        SizedBox(
                          height: 30,
                        ),
                        checkOutController.varchoosePaymentway == "1"
                            ? PriceCash()
                            : Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            PaypalCheckout(
                                          sandboxMode: true,
                                          clientId:
                                              "AZ4Q8PrXEzjor2JFj6Tp-7Wd95Awu-dOxniekkKbS-DmTzM2WJ62JXQuDdkS3cFDCtqpEgFcfB-9Lg4a",
                                          secretKey:
                                              "EOhrzDNT4dnjDLwA8ccY63SxoDBILjo51VCkTWIom0icVVj4Kb3wvxr7BY6YdVAg9k1HO5yTnDE07ePs",
                                          returnURL: "success.snippetcoder.com",
                                          cancelURL: "cancel.snippetcoder.com",
                                          transactions: const [
                                            {
                                              "amount": {
                                                "total": '70',
                                                "currency": "USD",
                                                "details": {
                                                  "subtotal": '70',
                                                  "shipping": '0',
                                                  "shipping_discount": 0
                                                }
                                              },
                                              "description":
                                                  "The payment transaction description.",
                                              // "payment_options": {
                                              //   "allowed_payment_method":
                                              //       "INSTANT_FUNDING_SOURCE"
                                              // },
                                              "item_list": {
                                                "items": [
                                                  {
                                                    "name": "Apple",
                                                    "quantity": 4,
                                                    "price": '5',
                                                    "currency": "USD"
                                                  },
                                                  {
                                                    "name": "Pineapple",
                                                    "quantity": 5,
                                                    "price": '10',
                                                    "currency": "USD"
                                                  }
                                                ],
                                              }
                                            }
                                          ],
                                          note:
                                              "Contact us for any questions on your booking.",
                                          onSuccess: (Map params) async {
                                            print("onSuccess: $params");
                                          },
                                          onError: (error) {
                                            print("onError: $error");
                                            Navigator.pop(context);
                                          },
                                          onCancel: () {
                                            print('cancelled:');
                                          },
                                        ),
                                      ));
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      foregroundColor: Colors.white,
                                      shape: const BeveledRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(1),
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/paypal.png",
                                          width: 100,
                                          height: 100,
                                        ),
                                        Center(
                                          child: Header1(
                                              text: "PayPal",
                                              color: ColorApp.thirdColor),
                                        ),
                                      ],
                                    )),
                              )




                              
                      ])),
                )));
  }
}
