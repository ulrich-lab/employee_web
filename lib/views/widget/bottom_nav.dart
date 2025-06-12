import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart'; // Import du package
import 'package:visitor_pass/Controllers/attendance_controller.dart';
import 'package:visitor_pass/Controllers/dashboard_controller.dart';
import 'package:visitor_pass/Controllers/notification_controller.dart';
import 'package:visitor_pass/Controllers/permission_controller.dart';
import 'package:visitor_pass/Controllers/pre_register_controller.dart';
import 'package:visitor_pass/Controllers/profile_controller.dart';
import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/config/upgrader/version_checker.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/Schedule/schedule_screen.dart';
import 'package:visitor_pass/views/pages/dashboard/employee_dashboard_page.dart';
import 'package:visitor_pass/views/pages/pre-register/pre_register.dart';
import 'package:visitor_pass/views/pages/visitor/visitor.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final ProfileController profile = Get.put(locator<ProfileController>());

  // final ChatController chatController = Get.put(locator<ChatController>());

  // final NotificationController _notificationController =
  //     Get.put(locator<NotificationController>());

  AttendanceController attendanceController =
      Get.put(locator<AttendanceController>());

  // ContactPickerController contactPickerController =
  //     Get.put(locator<ContactPickerController>());

  DashboardController dashboardController =
      Get.put(locator<DashboardController>());

  PreRegisterController preRegisterController =
      Get.put(locator<PreRegisterController>());

  final PermissionController permissionController =
      Get.put(locator<PermissionController>());

  final List navigation = [
    EmployeeDashboardPage(),
    ScheduleScreen(),
    VisitorListPage(),
    SizedBox(),
    PreRegisterListPage()
  ];

  int selectedIndex = 0;

  late StreamSubscription subscription;

  var isDeviceConnected = true;

  @override
  void initState() {
    super.initState();
    profile.getUserProfile();
    attendanceController.getAttendanceList();
    attendanceController.getAttendanceStatus();
    // chatController.addContactsGroup();
    // contactPickerController.fetchContacts();
    dashboardController.getDashboard();
    // _notificationController.initNotif();
    preRegisterController.getPreVisitors();
    permissionController.getLeavesList();
    permissionController.getReasonList();
    // _requestPermissions().then((isGranted) {
    //   if (isGranted) {
    //     chatController.getStreamChat();
    //     chatController.getAllEmployeeByDepartAndServices();
    //     getConnectivity();
    //   }
    // });
    // _requestPermissions().then((isGranted) {
    //   if (isGranted) {
    //     chatController.getStreamChat();
    //     chatController.getAllEmployeeByDepartAndServices();
    //     getConnectivity();
    //   }
    // });
  }

  Future<bool> _requestPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);

    if (!allGranted) {
      Get.snackbar(
        'Permissions Required',
        'Camera and microphone permissions are required to proceed.',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  Future<void> getConnectivity() async {
    // if (await isConnected()) {
    //   await locator<IsarDb>().refreshContacts();
    // }
  }

  @override
  Widget build(BuildContext context) {
    void _onTap(int index) {
      selectedIndex = index;
      (context as Element).markNeedsBuild();
    }

    return Scaffold(
      body: Stack(
        children: [
          navigation[selectedIndex],
          !isDeviceConnected
              ? Positioned(
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.black54,
                        child: const Center(
                          child: Text(
                            'Checking connection...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const LinearProgressIndicator(minHeight: 5),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColor.primaryColor,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 24,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.Nhome,
              height: 24,
              width: 24,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(
              Images.Nhome,
              height: 24,
              width: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.Nschedule,
              height: 24,
              width: 24,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(Images.Nschedule,
                height: 24, width: 24, color: AppColor.primaryColor),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.Nvisitors,
              height: 24,
              width: 24,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(Images.Nvisitors,
                height: 24, width: 24, color: AppColor.primaryColor),
            label: 'Visitors',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.Ncollegue,
              height: 24,
              width: 24,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(Images.Ncollegue,
                height: 24, width: 24, color: AppColor.primaryColor),
            label: 'Colleagues',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Images.Nappointment,
              height: 25.w,
              width: 32.w,
              color: Colors.grey,
            ),
            activeIcon: SvgPicture.asset(Images.Nappointment,
                height: 25.w, width: 32.w, color: AppColor.primaryColor),
            label: 'Appointments',
          ),
        ],
      ),
    );
  }
}
