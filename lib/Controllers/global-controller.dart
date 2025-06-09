import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Models/employee_model.dart';
import 'package:visitor_pass/main.dart';
import '/services/server.dart';

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
    final validUser = prefs.getString("is-user");
    isUser = validUser == "true";
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    if (isUser) {
      final token = await prefs.getString('token');
      final myId = await prefs.getString('user-id');
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
    await prefs.clear();
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
