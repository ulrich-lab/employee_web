import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Services/server.dart';
import 'package:visitor_pass/views/pages/drawer_view_page.dart';
import 'package:visitor_pass/views/pages/login.dart' show LoginPage;
import 'package:visitor_pass/views/pages/onbording/omboarding_screen.dart';
import 'package:visitor_pass/views/pages/onbording/user_type.dart'
    show UserType;
import 'package:visitor_pass/views/widget/bottom_nav.dart';
import '../../Controllers/auth-controller.dart';
import '../../Controllers/global-controller.dart';
import '../constants/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthController _authController = AuthController();

  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () => ({logInCheck()},),
    );
    // _start();
    super.initState();
  }

  logInCheck() async {
    if (Get.find<GlobalController>().isUser) {
      Server.initClass(token: "token");
      Get.put(GlobalController()).initController();
      if (ScreenSize(context).mainWidth > 640) {
        Get.offAllNamed("/SideBar");
      } else {
        Get.offAllNamed("/BottomNav");
      }
      // Get.off(
      //     () => ScreenSize(context).mainWidth > 640 ? SideBar() : BottomNav());
    } else {
      // Get.off(() => ScreenSize(context).mainWidth > 640
      //     ? UserType()
      //     : const OnboardingView());
      if (ScreenSize(context).mainWidth > 640) {
        Get.offAllNamed("/UserType");
      } else {
        Get.offAllNamed("/OnboardingView");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 60,
              width: 60,
              child: CircleAvatar(
                radius: 50,
                child: Image(
                  // height: 60,
                  // width: 60,
                  image: AssetImage(Images.logoIconWew),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
