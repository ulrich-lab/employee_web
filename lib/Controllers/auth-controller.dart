import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visitor_pass/Models/login_model.dart';
import 'package:visitor_pass/Models/profile_model.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/drawer_view_page.dart';
import '../views/widget/bottom_nav.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'global-controller.dart';

class AuthController extends GetxController {
  // UserService userService = UserService();
  // final Validators _validators = Validators();
  Server server = Server();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  bool loader = false;

  changeVisibility() {
    obscureText = !obscureText;
    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
  }

  void loginOnTap({BuildContext? context, String? login, String? pass}) async {
    loader = true;

    Future.delayed(const Duration(milliseconds: 10), () {
      update();
    });
    // String? token = await FirebaseMessaging.instance.getToken();
    // var passValidator = _validators.validatePassword(value: pass);
    // if (passValidator == null) {
    dynamic body = {
      'phone_number': login?.toString().trim(),
      'password': pass?.toString().trim(),
      // 'token': token
    };

    String jsonBody = json.encode(body);
    server
        .postRequest(endPoint: APIList.login, body: jsonBody, withHeader: false)
        .then(
      (response) {
        if ((response['employee'] != null)) {
          final jsonResponse = response;
          print("===========${jsonResponse}");
          var profile = Profile.fromJson(jsonResponse['employee']);
          box.write('profile', jsonEncode(profile.toJson()));
          box.write('company_id', jsonResponse['employee']['company_id']);

          var loginData = LoginModel.fromJson(jsonResponse);

          var bearerToken = 'Bearer ' + "${loginData.token}";
          box.write('is-user', "true");

          box.write('token', bearerToken);
          box.write('user-id', loginData.employee?.id.toString());
          box.write('user-id', loginData.employee?.id.toString());
          box.write('employee_id', loginData.employee?.id.toString());
          box.write('email', loginData.employee?.email.toString());
          box.write('image', loginData.employee?.profilePicture.toString());
          box.write('name',
              "${loginData.employee!.firstname.toString()} ${loginData.employee!.lastname.toString()}");
          box.write('phone', loginData.employee!.phoneNumber.toString());

          Server.initClass(token: bearerToken);

          Get.put(GlobalController()).initController();

          emailController.clear();
          passwordController.clear();
          loader = false;
          Future.delayed(const Duration(milliseconds: 10), () {
            update();
          });
          if (ScreenUtil().screenWidth > 640) {
            Get.offAllNamed("/SideBar");
          } else {
            Get.offAllNamed("/BottomNav");
          }

          Get.rawSnackbar(
            message: "Connexion reussie",
            backgroundColor: Colors.green,
            snackPosition: SnackPosition.TOP, 
          );
        } else {
          loader = false;
          Future.delayed(const Duration(milliseconds: 10), () {
            update();
          });
          Get.rawSnackbar(
            message: response.body['message'],
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
          );
          if ((response?.body['data']['mytype'] != 'Internal Staff')) {
            Get.rawSnackbar(
                message: "Not Internal Staff",
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.TOP);
          } else {
            final jsonResponse = response?.body;
            Get.rawSnackbar(
                message: "${jsonResponse['message']}",
                backgroundColor: Colors.red,
                snackPosition: SnackPosition.TOP);
          }
        }
      },
    );
    // ).catchError((error) {
    //   loader = false;
    //   Future.delayed(const Duration(milliseconds: 10), () {
    //     update();
    //   });
    //   Get.rawSnackbar(message: 'Something wrong');
    // });
    // } else {
    //   loader = false;
    //   Future.delayed(const Duration(milliseconds: 10), () {
    //     update();
    //   });
    //   Get.rawSnackbar(message: 'Please enter phone number and password');
    // }
  }

  // refreshToken(context) async {
  //   server.getRequest(endPoint: APIList.refreshToken).then((response) {
  //     if (response != null && response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       var refreshData = RefreshTokenModel.fromJson(jsonResponse);
  //       var newToken = 'Bearer ' + "${refreshData.data!.token}";
  //       userService.saveBoolean(key: 'is-user', value: true);
  //       userService.saveString(key: 'token', value: refreshData.data!.token);

  //       return true;
  //     } else {
  //       Get.find<GlobalController>().userLogout(context: context);
  //       return false;
  //     }
  //   });
  // }

  updateFcmSubscribe(email) async {
    // SharedPreferences storage = await SharedPreferences.getInstance();
    // var deviceToken = storage.getString('deviceToken');
    // Map body = {
    //   "device_token": deviceToken,
    //   "topic": email,
    // };
    // String jsonBody = json.encode(body);
    // server
    //     .postRequest(endPoint: APIList.fcmSubscribe, body: jsonBody)
    //     .then((response) {
    //   if (response != null && response.statusCode == 200) {
    //     final jsonResponse = json.decode(response.body);
    //     print(jsonResponse);
    //   }
    // });
  }

  Future<void> getIpInfo({
    Function(dynamic)? onSuccess,
    Function(String)? onFailure,
  }) async {
    try {
      final response = await http.get(Uri.parse('http://ip-api.com/json/'));
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (onSuccess != null) {
          onSuccess(response.body);
        }
      } else {}
    } catch (err) {
      rethrow;
    }
  }
}
// { "Content-Type": "application/json; charset=UTF-8",
// "User-Agent": "PostmanRuntime/7.39.0",
// "Accept": "*/*",
// "Cache-Control": "no-cache",
// "Postman-Token": "64ba877c-6484-46d7-b3bc-7e786a4e12e5",
// "Host": "vvims-fodec.happynessarl.com",
// "Accept-Encoding": "gzip, deflate, br",
// "Connection": "keep-alive" }
