
/*

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/remoteController.dart';
import '../core/class/handlingStatusRemotDataView.dart';
import '../core/constant/color.dart';

class TestRemote extends StatelessWidget {
  const TestRemote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestGetData());
    return  Scaffold(
      appBar: AppBar(
        title: Text("Remot"),
        backgroundColor: ColorApp.primaryColor,
      ),
      body: GetBuilder<TestGetData>(
        builder: (controller){
          return HandlingStatusRemotDataView(
              statusRequest:controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: (context , index){
                    return Text("${controller.data}");
                  })
          );
        },
      ),
    );
  }
}


*/