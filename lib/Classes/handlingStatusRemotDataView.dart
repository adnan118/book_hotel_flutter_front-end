import 'package:flutter/material.dart';
import '../../DB/statusRequest.dart';
import '../Core/Constant/imageasset.dart';

///// DataView
class HandlingStatusRemotDataView extends StatelessWidget {
  const HandlingStatusRemotDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offinternetfailuer
            ? Center(
                child: Column(
                children: [
                  Image.asset(ImageAssetApp.disconnect_internet),
                  Text("No Internet!")
                ],
              ))
            : statusRequest == StatusRequest.serverfailuer
                ? Center(
                    child: Column(
                    children: [
                      Image.asset(ImageAssetApp.server_failure),
                      Text("Server failure")
                    ],
                  ))
                : statusRequest == StatusRequest.failuer
                    ? Center(
                        child: Column(
                        children: [
                          Image.asset(ImageAssetApp.no_data),
                          Text("No Data")
                        ],
                      ))
                    : widget;
  }
}

//////  DataRequest

class HandlingStatusRemotDataRequest extends StatelessWidget {
  const HandlingStatusRemotDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);
  final StatusRequest statusRequest;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: CircularProgressIndicator())
        : statusRequest == StatusRequest.offinternetfailuer
            ? Center(
                child: Column(
                children: [
                  Image.asset(ImageAssetApp.disconnect_internet),
                  Text("No Internet!")
                ],
              ))
            : statusRequest == StatusRequest.serverfailuer
                ? Center(
                    child: Container(
                      color:Colors.transparent ,
                      child: Column(
                        children: [
                          Image.asset(ImageAssetApp.server_failure),
                          Text("server failuer")
                        ],
                      ),
                    ))
                : widget;
  }
}
