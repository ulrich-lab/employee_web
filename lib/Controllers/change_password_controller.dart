// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

import 'package:visitor_pass/domain/profile_repository.dart';

import '../constants/constants.dart';
import '/services/api-list.dart';
import '/services/server.dart';
import '/services/user-service.dart';

@lazySingleton
class ChangePasswordController extends GetxController {
  final ProfileRepository profileRepository;
  // UserService userService = UserService();
  Server server = Server();
  TextEditingController passwordCurrentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

  bool passwordLoader = false;
  ChangePasswordController({
    required this.profileRepository,
    // required this.passwordLoader,
  });

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  updateUserPassword({BuildContext? context}) async {
    passwordLoader = true;
    update();
    // Map body = {
    //   'password_current': passwordCurrentController.text,
    //   'password': passwordController.text,
    //   'password_confirmation': passwordConfirmController.text,
    // };
    var res = await profileRepository.updatePassword(
        currentPassword: passwordCurrentController.text,
        newPassword: passwordController.text);

    res.fold(
      (failure) {
        passwordLoader = false;
        update();
      },
      (success) async {
        Get.back();
        Get.rawSnackbar(
          snackPosition: SnackPosition.TOP,
          title: 'Change Password',
          message: 'Successfully Updated Password',
          backgroundColor: AppColor.greenColor.withOpacity(.9),
          maxWidth: ScreenSize(context!).mainWidth / 1.007,
          margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
        );
        passwordCurrentController.clear();
        passwordController.clear();
        passwordConfirmController.clear();
        passwordLoader = false;
        Future.delayed(const Duration(milliseconds: 10), () {
          update();
        });
        
      },
    );

    // String jsonBody = json.encode(body);
    // print(jsonBody);
    // server
    //     .postRequestWithToken(endPoint: APIList.changePassword, body: jsonBody)
    //     .then((response) {
    //   final jsonResponse = json.decode(response?.body??"");
    //   print(jsonResponse);
    //   if (response != null && response.statusCode == 200) {
    //     Get.back();
    //     Get.rawSnackbar(
    //       snackPosition: SnackPosition.TOP,
    //       title: 'Change Password',
    //       message: 'Successfully Updated Password',
    //       backgroundColor: AppColor.greenColor.withOpacity(.9),
    //       maxWidth: ScreenSize(context!).mainWidth / 1.007,
    //       margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    //     );
    //     passwordCurrentController.clear();
    //     passwordController.clear();
    //     passwordConfirmController.clear();
    //     passwordLoader = false;
    //     Future.delayed(Duration(milliseconds: 10), () {
    //       update();
    //     });
    //   } else if (response != null && response.statusCode == 422) {
    //     if (jsonResponse['data']['message']['password_current'] != null) {
    //       Get.rawSnackbar(
    //         snackPosition: SnackPosition.TOP,
    //         title: 'Change Password',
    //         message: jsonResponse['data']['message']['password_current'].toString(),
    //         backgroundColor: AppColor.redColor.withOpacity(.9),
    //         maxWidth: ScreenSize(context!).mainWidth / 1.007,
    //         margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    //       );

    //     } else if (jsonResponse['data']['message']['password'] != null) {
    //       Get.rawSnackbar(
    //         snackPosition: SnackPosition.TOP,
    //         title: 'Change Password',
    //         message: jsonResponse['data']['message']['password'].toString(),
    //         backgroundColor: AppColor.redColor.withOpacity(.9),
    //         maxWidth: ScreenSize(context!).mainWidth / 1.007,
    //         margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    //       );

    //     } else if (jsonResponse['data']['message']['password_confirmation'] != null) {
    //       Get.rawSnackbar(
    //         snackPosition: SnackPosition.TOP,
    //         title: 'Change Password',
    //         message: jsonResponse['data']['message']['password_confirmation'].toString(),
    //         backgroundColor: AppColor.redColor.withOpacity(.9),
    //         maxWidth: ScreenSize(context!).mainWidth / 1.007,
    //         margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    //       );
    //     }
    //     passwordLoader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //   } else {
    //     passwordLoader = false;
    //     Future.delayed(const Duration(milliseconds: 10), () {
    //       update();
    //     });
    //     Get.rawSnackbar(
    //       snackPosition: SnackPosition.TOP,
    //       title: 'Change Password',
    //       message:  'Please enter valid input',
    //       backgroundColor: AppColor.redColor.withOpacity(.9),
    //       maxWidth: ScreenSize(context!).mainWidth / 1.007,
    //       margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    //     );
    //   }
    // });
  }
}
