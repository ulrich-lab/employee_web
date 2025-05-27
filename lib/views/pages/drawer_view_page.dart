import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:visitor_pass/Controllers/attendance_controller.dart';
import 'package:visitor_pass/Controllers/chat_controller.dart';
import 'package:visitor_pass/Controllers/contacts_controller.dart';
import 'package:visitor_pass/Controllers/dashboard_controller.dart';
import 'package:visitor_pass/Controllers/notification_controller.dart';
import 'package:visitor_pass/Controllers/permission_controller.dart';
import 'package:visitor_pass/Controllers/pre_register_controller.dart';
import 'package:visitor_pass/Controllers/profile_controller.dart'
    show ProfileController;
import 'package:visitor_pass/config/locator/isar_bd.dart' show IsarDb;
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/constants/constants.dart' show AppColor, Images;
import 'package:visitor_pass/utils/abc.dart' show isConnected;
import 'package:visitor_pass/views/pages/chat/base_chat.dart';
import 'package:visitor_pass/views/pages/dashboard/employee_dashboard_page.dart'
    show EmployeeDashboardPage;
import 'package:visitor_pass/views/pages/pre-register/pre_register.dart';
import 'package:visitor_pass/views/pages/pre-register/pre_register_add_page.dart';
import 'package:visitor_pass/views/pages/profile.dart' show ProfilePage;
import 'package:visitor_pass/views/pages/visitor/visitor.dart';
import 'package:visitor_pass/views/widget/cachedImage.dart' show CachedImage;
import 'package:visitor_pass/views/widget/clock_page.dart';
import 'package:visitor_pass/views/widget/loader.dart';

class SideBar extends StatefulWidget {
  SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();

  final ProfileController profile = Get.put(locator<ProfileController>());

  // final ChatController chatController = Get.put(locator<ChatController>());

  final NotificationController _notificationController =
      Get.put(locator<NotificationController>());

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

  bool _isLoading = false;

  updateLoading(value) {
    setState(() {
      _isLoading = value;
    });
  }

  @override
  void initState() {
    super.initState();
    updateLoading(true);
    profile.getUserProfile();
    attendanceController.getAttendanceList();
    attendanceController.getAttendanceStatus();
    // chatController.addContactsGroup();
    // contactPickerController.fetchContacts();
    dashboardController.getDashboard();
    _notificationController.initNotif();
    preRegisterController.getPreVisitors();
    permissionController.getLeavesList();
    permissionController.getReasonList();
    // _requestPermissions().then((isGranted) {
    //   if (isGranted) {
    // chatController.getStreamChat();
    //     // chatController.getAllEmployeeByDepartAndServices();
    //     getConnectivity();
    //   }
    // });
    updateLoading(false);
  }

  Future<bool> _requestPermissions() async {
    final statuses = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    bool allGranted = statuses.values.every((status) => status.isGranted);

    if (!allGranted) {
      Get.snackbar(
        'Permission requise',
        'La permissions de Camera et microphone sont requis pour continuer',
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
    return true;
  }

  Future<void> getConnectivity() async {
    // if (await isConnected()) {
    //   await locator<IsarDb>().refreshContacts();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: _key,
          body: Column(
            children: [
              Flexible(
                flex: 075,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  color: AppColor.primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        // onTap: () => Get.to(ProfilePage()),
                        child: Container(
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: AppColor.greenC,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: CachedImage(
                              width: 30,
                              height: 30,
                              imageUrl: profile.profileUser.image.toString(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 12),
                      InkWell(
                        // onTap: () => Get.to(ProfilePage()),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              profile.profileUser.name.toString(),
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.backgroundCalendar),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "CNPS / NSIF",
                              // "FODECC /  CCODEF",
                              style: const TextStyle(
                                  fontSize: 10,
                                  color: AppColor.backgroundCalendar),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20.w),
                      SvgPicture.asset('assets/icons/qrcode.svg',
                          width: 18,
                          height: 18,
                          color: AppColor.backgroundCalendar),
                      SizedBox(width: 12),
                      SvgPicture.asset('assets/icons/bell.svg',
                          width: 18,
                          height: 18,
                          color: AppColor.backgroundCalendar),
                      SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 925,
                child: Row(
                  children: [
                    if (!isSmallScreen)
                      ExampleSidebarX(controller: _controller),
                    Expanded(
                      child: Container(
                        // color: Colors.grey[200],
                        child: Center(
                          child: _isLoading
                              ? Container(
                                  child: LoaderCircle(),
                                )
                              : _ScreensExample(
                                  controller: _controller,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    super.key,
    required SidebarXController controller,
  }) : _controller = controller;

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return SidebarX(
          controller: _controller,
          theme: SidebarXTheme(
            margin: const EdgeInsets.all(10),
            // decoration: BoxDecoration(
            //   color: t.primaryColor,
            //   borderRadius: BorderRadius.circular(20),
            // ),
            // hoverColor: t.primaryColor,
            // textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            selectedTextStyle: TextStyle(
              color: t.primaryColor,
            ),
            hoverTextStyle: TextStyle(
              color: t.primaryColor,
              fontWeight: FontWeight.w500,
            ),
            itemTextPadding: EdgeInsets.only(left: 12.w),
            selectedItemTextPadding: EdgeInsets.only(left: 12.w),
            // itemDecoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            //   border: Border.all(color: t.primaryColor),
            // ),
            selectedItemDecoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                // border: Border.all(
                //   color: actionColor.withOpacity(0.37),
                // ),
                // gradient: LinearGradient(
                //   colors: [accentCanvasColor, t.primaryColor],
                // ),

                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.28),
                //     blurRadius: 30,
                //   )
                // ],
                ),
            iconTheme: IconThemeData(
              color: t.cardColor,
              size: 10.w,
            ),
            selectedIconTheme: IconThemeData(
              color: t.primaryColor,
              size: 10.w,
            ),
          ),
          extendedTheme: SidebarXTheme(
            width: 60.w,
            decoration: BoxDecoration(
              color: t.scaffoldBackgroundColor,
            ),
          ),
          footerDivider:
              Divider(color: Colors.white.withOpacity(0.3), height: 1),
          // headerBuilder: (context, extended) {
          //   return SizedBox(
          //     height: 50.h,
          //     child: Padding(
          //       padding: const EdgeInsets.only(top: 25),
          //       // child: Assets.images.vvims.image(),
          //       child: Row(
          //         crossAxisAlignment: CrossAxisAlignment.center,
          //         // mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Text("CNPS"),
          //           ),
          //           SizedBox(width: 15),
          //           Text(
          //             "Security\n   Guard",
          //             style: TextStyle(
          //               fontWeight: FontWeight.bold,
          //               color: t.primaryColor,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   );
          // },
          items: [
            SidebarXItem(
              // icon: Icons.home,
              iconWidget: _controller.selectedIndex == 0
                  ? SvgPicture.asset(
                      Images.Nhome,
                      height: 16,
                      width: 16,
                    )
                  : SvgPicture.asset(
                      Images.Nhome,
                      height: 16,
                      width: 16,
                      color: Colors.grey,
                    ),

              label: 'Dashboard',
              onTap: () {
                debugPrint('Home');
              },
            ),
            SidebarXItem(
              iconWidget: _controller.selectedIndex == 1
                  ? SvgPicture.asset(Images.Nvisitors,
                      height: 16, width: 16, color: AppColor.primaryColor)
                  : SvgPicture.asset(
                      Images.Nvisitors,
                      height: 16,
                      width: 16,
                      color: Colors.grey,
                    ),
              label: 'Visiteurs',
            ),
            SidebarXItem(
              iconWidget: _controller.selectedIndex == 2
                  ? SvgPicture.asset(Images.Ncollegue,
                      height: 16, width: 16, color: AppColor.primaryColor)
                  : SvgPicture.asset(
                      Images.Ncollegue,
                      height: 16,
                      width: 16,
                      color: Colors.grey,
                    ),
              label: 'Messages',
              // selectable: false,
              // onTap: () => _showDisabledAlert(context),
            ),
            SidebarXItem(
              iconWidget: _controller.selectedIndex == 3
                  ? SvgPicture.asset(Images.Nappointment,
                      height: 16, width: 16, color: AppColor.primaryColor)
                  : SvgPicture.asset(
                      Images.Nappointment,
                      height: 16,
                      width: 16,
                      color: Colors.grey,
                    ),
              label: 'Enregistrement',
            ),
            SidebarXItem(
              iconWidget: _controller.selectedIndex == 4
                  ? SvgPicture.asset(Images.profile,
                      height: 16, width: 16, color: AppColor.primaryColor)
                  : SvgPicture.asset(
                      Images.profile,
                      height: 16,
                      width: 16,
                      color: Colors.grey,
                    ),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }
}

class _ScreensExample extends StatelessWidget {
  _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Builder(
      builder: (context) {
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            // final pageTitle = _getTitleByIndex(controller.selectedIndex);
            switch (controller.selectedIndex) {
              case 0:
                return Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: EmployeeDashboardPage(),
                    ),
                    Flexible(
                      flex: 4,
                      child: ClockPage(),
                    ),
                  ],
                );

              case 1:
                return Row(
                  children: [
                    Flexible(flex: 6, child: VisitorListPage()),
                    Flexible(
                      flex: 4,
                      child: ClockPage(),
                    ),
                  ],
                );

              case 2:
                return Row(
                  children: [
                    Flexible(flex: 4, child: Container()),
                    Flexible(flex: 6, child: SizedBox()),
                  ],
                );

              case 3:
                return Row(
                  children: [
                    Flexible(flex: 5, child: PreRegisterListPage()),
                    Flexible(
                      flex: 5,
                      child: PreRegisterAddPage(),
                    ),
                  ],
                );

              case 4:
                return Row(
                  children: [
                    Flexible(flex: 5, child: ProfilePage()),
                    Flexible(
                      flex: 5,
                      child: Container(),
                    ),
                  ],
                );
              default:
                return Text(
                  "not found",
                  style: theme.textTheme.headlineSmall,
                );
            }
          },
        );
      },
    );
  }
}
