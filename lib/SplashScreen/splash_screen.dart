import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Services/server.dart';
import 'package:visitor_pass/views/pages/drawer_view_page.dart';
import 'package:visitor_pass/views/pages/login.dart' show LoginPage;
import 'package:visitor_pass/views/pages/onbording/omboarding_screen.dart';
import 'package:visitor_pass/views/pages/onbording/user_type.dart' show UserType;
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
    // FirebaseMessaging.instance
    //     .getInitialMessage()
    //     .then((RemoteMessage? message) {});
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});
    Timer(
      const Duration(seconds: 2),
      () => ({logInCheck()},),
    );
    // _start();
    super.initState();
  }

  // update(String token) async {
  //   SharedPreferences storage = await SharedPreferences.getInstance();
  //   await storage.setString('deviceToken', token);
  // }

  logInCheck() async {
    if (Get.find<GlobalController>().isUser) {
      // _authController.refreshToken(context);
      Server.initClass(token: "token");
      Get.put(GlobalController()).initController();
      Get.off(() =>ScreenSize(context).mainWidth>640? SideBar():  BottomNav());
    } else {
      Get.off(() =>ScreenSize(context).mainWidth>640?  UserType(): const OnboardingView());
    }
  }

  @override
  Widget build(BuildContext context) {
    // double keyboardSize = MediaQuery.of(context).viewInsets.bottom;
    // box.write('keyboardHeight', keyboardSize);
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

  // Future<void> start() async {
  //   if (!_appStarted) {
  //     /// Starting Askless and other services
  //     await getIt
  //         .get<InitializeApp>()
  //         .start(onAutoReauthenticationFails: _onAutoReauthenticationFails);

  //     /// Configuring Askless to receive calls
  //     AsklessClient.instance.addOnReceiveCallListener(
  //       (ReceivingCall receivingCall) {
  //         getIt.get<UsersRepo>().readUser(receivingCall.remoteUserId).then(
  //           (res) {
  //             res.fold(
  //               (l) {
  //                 print(
  //                     "Accepting call failed! Could not read the remoteUser ${receivingCall.remoteUserId}: \"${l.error}\"");
  //               },
  //               (remoteUser) {
  //                 Get.toNamed(
  //                   "/call",
  //                   arguments: CallScreenArgs(
  //                     remoteUserId: receivingCall.remoteUserId,
  //                     callDirection: CallDirection.receivingCall,
  //                     remoteUserFullName: remoteUser.fullName,
  //                     videoCall: receivingCall.additionalData["videoCall"]!,
  //                     receivingCall: receivingCall,
  //                   ),
  //                 );
  //               },
  //             );
  //           },
  //         );
  //       },
  //     );
  //     _appStarted = true;
  //   }
  // }

  // void _start() {
  //   if (!_started) {
  //     _started = true;
  //     (() async {
  //       start().then((_) {
  //         // if (Get.find<GlobalController>().isUser) {
  //         if (getIt.get<AuthRepo>().isAuthenticated()) {
  //           Get.offAllNamed("/contact");
  //         } else {
  //           Get.offAllNamed("/login");
  //         }
  //       });
  //     })();
  //   }
  // }
}

// final _onAutoReauthenticationFails = () {
//   getIt.get<Logout>().call();
//   Get.offAllNamed("login");
// };
