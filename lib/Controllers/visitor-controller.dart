import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Controllers/dashboard_controller.dart';
import '../Models/visitor_model.dart';
import '../Models/visitor_details_model.dart';
import '../Services/api-list.dart';
import '../constants/constants.dart';
import '../services/server.dart';



class VisitorController extends GetxController {
  Server server = Server();
  var loader = false.obs;
  var visitorList = <Visitor>[].obs;
  var visitorSearchList = <Visitor>[].obs;
  var visitorDetails = VisitorDetails().obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   getVisitors();
  // }

  getVisitors() async {
    loader.value = true;

    visitorList.value = <Visitor>[];
    server.getRequest(endPoint: APIList.visitorList).then((response) {
      if (response != null && response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var visitorListData = VisitorListModel.fromJson(jsonResponse);
        visitorList.value = <Visitor>[];
        visitorList.addAll(visitorListData.data!.visitor!);
        loader.value = false;
      } else {
        loader.value = false;

        return null;
      }
    });
  }

  getSearchedVisitors(name) async {
    if (name.toString().isEmpty) {
      getVisitors();
    } else {
      loader.value = true;

      server
          .getRequest(endPoint: (APIList.visitorSearchList! + "$name"))
          .then((response) {
        if (response != null && response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          print(jsonResponse);
          var visitorSearchListData = VisitorListModel.fromJson(jsonResponse);
          visitorList.value = <Visitor>[];
          visitorList.addAll(visitorSearchListData.data!.visitor!);
          loader.value = false;
        } else {
          loader.value = false;

          return null;
        }
      });
    }
  }

  changeStatus(context, id, status) {
    loader.value = false;

    // server
    //     .getRequest(endPoint: (APIList.changeStatus! + "$id" + "/" + "$status"))
    //     .then((response) async {
    //   if (response != null && response.statusCode == 200) {
    //     final jsonResponse = jsonDecode(response.body);
    //     loader.value = true;
    //     getVisitors();
    //     Get.find<DashboardController>().onInit();

    //     Get.rawSnackbar(
    //       snackPosition: SnackPosition.TOP,
    //       title: 'Check In Status',
    //       message: jsonResponse['data']['message'],
    //       backgroundColor: AppColor.greenColor.withOpacity(.9),
    //       maxWidth: ScreenSize(context!).mainWidth / 1.007,
    //       margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
    //     );
    //     loader.value = false;
    //   } else {
    //     loader.value = false;

    //     return null;
    //   }
    // });
    loader.value = false;
  }

  checkOut(context, visitorId) {
    loader.value = false;

    server
        .getRequest(endPoint: (APIList.checkOut! + "$visitorId"))
        .then((response) async {
      if (response != null && response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        loader.value = true;
        getVisitors();
        Get.find<DashboardController>().onInit();

        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Check Out',
          message: jsonResponse['data']['message'],
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader.value = false;
      } else if (response != null && response.statusCode == 404) {
        final jsonResponse = jsonDecode(response.body);
        loader.value = true;

        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Check Out',
          message: jsonResponse['data']['message'],
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        loader.value = false;
      } else {
        loader.value = false;

        return null;
      }
    });
  }
}
