import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restart_app/restart_app.dart';
import 'package:visitor_pass/Controllers/profile_controller.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor_pass/Models/employee_model.dart';
import 'package:visitor_pass/Models/profile_model.dart';
import 'package:visitor_pass/config/locator/isar_bd.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/login.dart';
import 'package:visitor_pass/views/pages/onbording/user_type.dart';
import '../Services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';

class GlobalController extends GetxController {
  Server server = Server();

  // UserService userService = UserService();
  bool profileLoader = true;
  String? bearerToken,
      siteName,
      siteEmail,
      siteLogo,
      currencyCode,
      currencyName;

  bool isUser = false;
  String? userId;
  String? userImage;
  String? userName;
  String? userEmail;

  initController() async {
    final validUser = box.read("is-user");
    isUser = validUser == "true";
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    if (isUser) {
      final token = await box.read('token');
      final myId = await box.read('user-id');
      bearerToken = token;
      userId = myId;
      Future.delayed(const Duration(milliseconds: 10), () {
        update();
      });
      Server.initClass(token: bearerToken);
    }
  }

  @override
  void onInit() {
    initController();
    super.onInit();
  }

  // getUserProfile() {
  //   server.getRequest(endPoint: APIList.profile).then((response) {
  //     if (response != null && response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       var profileData = ProfileModel.fromJson(jsonResponse);
  //       userName = profileData.data!.profile!.name;
  //       userEmail = profileData.data!.profile!.email;
  //       userImage = profileData.data!.profile!.image;
  //       Future.delayed(const Duration(milliseconds: 10), () {
  //         update();
  //       });
  //     }
  //   });
  // }

  userLogout({BuildContext? context}) async {
    // getValue();
    // await userService.removeSharedPreferenceData();
    await box.erase();
    isUser = false;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    await clearMessages();
    // Get.delete<ProfileController>();
  }

  clearMessages() async {
    // await locator<IsarDb>().clearMessages();
  }

//   getValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     String? stringValue = prefs.getString('token');

//     return stringValue;
//   }

//   updateFcmUnSubscribe() async {
//     SharedPreferences storage = await SharedPreferences.getInstance();
//     var deviceToken = storage.getString('deviceToken');
//     Map body = {
//       "device_token": deviceToken,
//       "topic": null,
//     };
//     String jsonBody = json.encode(body);
//     server
//         .postRequest(endPoint: APIList.fcmUnSubscribe, body: jsonBody)
//         .then((response) {
//       if (response != null && response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);
//         print(jsonResponse);
//       }
//     });
//   }

//   //  Server server = Server();
}

class ColleugueController extends GetxController {
  RxBool isLoadingGetColleagueList = false.obs;
  var colleagueList = <EmployeeModel>[].obs;

  // @override
  // void onInit() {
  //   super.onInit();
  //   if (colleagueList.isEmpty) {
  //     getColleaugueList();
  //   }
  // }

  // Future<void> getColleaugueList() async {
  //   Server server = Server();
  //   if (isLoadingGetColleagueList.value) return;
  //   isLoadingGetColleagueList.value = true;
  //   UserService userService = UserService();
  //   final String currentId = await userService.getEmployeeId();
  //   try {
  //     server.getRequest(endPoint: APIList.getEmployeeList).then(
  //       (response) {
  //         isLoadingGetColleagueList.value = false;
  //         if (response != null && response.statusCode == 200) {
  //           colleagueList.value = [];
  //           for (var el in json.decode(response.body)['data']['data']) {
  //             final item = EmployeeModel.fromJson(el);
  //             if (item.id != currentId) {
  //               colleagueList.add(item);
  //             }
  //           }
  //         }
  //       },
  //     );
  //   } catch (e) {}
  // }
}
