import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pwa_install/pwa_install.dart';
import 'package:visitor_pass/Controllers/attendance_controller.dart';
import 'package:visitor_pass/Controllers/profile_controller.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/theme/color_theme.dart';
import 'package:visitor_pass/views/pages/attendance/qr_code_scanner.dart';
import 'package:visitor_pass/views/pages/profile.dart';
import 'package:visitor_pass/views/pages/visitor/visitor.dart';
import 'package:visitor_pass/views/shimmer/visitor-shimmer.dart';
import 'package:visitor_pass/views/widget/cachedImage.dart';
import 'package:visitor_pass/views/widget/custom_button.dart';
import 'package:visitor_pass/views/widget/dashboard_card.dart';
import 'package:visitor_pass/views/widget/empty_screen.dart';
import 'package:visitor_pass/views/widget/visitor_card.dart';

import '../../../Controllers/dashboard_controller.dart';

class EmployeeDashboardPage extends StatefulWidget {
  const EmployeeDashboardPage({Key? key}) : super(key: key);

  @override
  State<EmployeeDashboardPage> createState() => _EmployeeDashboardPageState();
}

class _EmployeeDashboardPageState extends State<EmployeeDashboardPage> {
  final DashboardController dashboard = Get.put(locator<DashboardController>());
  final AttendanceController attendance =
      Get.put(locator<AttendanceController>());
  final ProfileController profile = Get.put(locator<ProfileController>());

  Future<void> _onRefresh() async {
    dashboard.onInit();
    attendance.getAttendanceStatus();
  }

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: ScreenSize(context).mainWidth > 640
            ? null
            : AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                leading: InkWell(
                  onTap: () => Get.to(ProfilePage()),
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
                        width: 45,
                        height: 45,
                        imageUrl: profile.profileUser.image.toString(),
                      ),
                    ),
                  ),
                ),
                title: InkWell(
                  onTap: () => Get.to(ProfilePage()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 0.5.sw,
                        child: Text(
                          profile.profileUser.name.toString(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: AppColor.textPrimaryColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "CNPS / NSIF",
                        // "FODECC /  CCODEF",
                        style: const TextStyle(
                            fontSize: 12, color: AppColor.textPrimaryColor),
                      ),
                      SizedBox(height: 12.w),
                    ],
                  ),
                ),
                actions: [
                  SvgPicture.asset('assets/icons/qrcode.svg',
                      width: 25, height: 25),
                  SizedBox(width: 12.w),
                  SvgPicture.asset('assets/icons/bell.svg',
                      width: 25, height: 25),
                  SizedBox(width: 12.w),
                ],
              ),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: ListView(
            children: [
              if (PWAInstall().installPromptEnabled)
                Padding(
                  padding:  EdgeInsets.only(right: 10.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorsLight.appBarColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 12.h),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8.0), // Border radius réduit
                        ),
                      ),
                      onPressed: () {
                        try {
                          PWAInstall().promptInstall_();
                        } catch (e) {
                          // Gestion d'erreur ici si besoin
                        }
                      },
                      child: Text(
                        'Installez l\'application',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ScreenSize(context).mainWidth > 640
                  ? SizedBox(height: 20.h)
                  : SizedBox(),

              Container(
                decoration: BoxDecoration(
                  color: AppColor.bgCheckColor,
                  borderRadius: ScreenSize(context).mainWidth > 640
                      ? BorderRadius.circular(10)
                      : null,
                ),
                padding: EdgeInsets.all(10),
                child: attendance.attendance.value.status == null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatDateTime(DateTime.now()),
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardCard(
                                icon: "./assets/icons/login.svg",
                                hours: null,
                                topic: "Arrival",
                                isCkockOut: false,
                                isLate: null,
                              ),
                              DashboardCard(
                                icon: "./assets/icons/logout.svg",
                                hours: null,
                                topic: "Depparture",
                                isCkockOut: true,
                                isLate: null,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: attendance.loader.value
                                ? Center(
                                    child: CircularProgressIndicator.adaptive(
                                      backgroundColor: AppColor.primaryColor,
                                    ),
                                  )
                                : CustomButtonCheck(
                                    background:
                                        AppColor.primaryColor.withOpacity(0.7),
                                    onPressed: () async {
                                      // if (ScreenUtil().screenWidth > 640) {
                                      attendance.clockInUpdate(context,
                                          "d94085cf-286a-4895-b346-14401c69736d");
                                      // } else {
                                      //   String result1 =
                                      //       await Get.to(() => QrCodeScanner());

                                      //   attendance.clockInUpdate(
                                      //       context, result1);
                                      // }
                                    },
                                    text: 'clock_in'.tr,
                                  ),
                          )
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            formatDateTime(DateTime.now()),
                            style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              DashboardCard(
                                icon: "./assets/icons/login.svg",
                                hours: attendance.attendance.value.attendance
                                            ?.checkinTime !=
                                        null
                                    ? DateFormat('HH:mm').format(
                                        DateTime.parse(attendance
                                                    .attendance
                                                    .value
                                                    .attendance
                                                    ?.checkinTime ??
                                                "")
                                            .add(
                                          Duration(hours: 1),
                                        ),
                                      )
                                    : attendance.attendance.value.attendance
                                        ?.checkinTime,
                                topic: "Arrivée",
                                isCkockOut: false,
                                isLate: attendance
                                    .attendance.value.attendance?.isLate,
                              ),
                              DashboardCard(
                                icon: "./assets/icons/logout.svg",
                                hours: attendance.attendance.value.attendance
                                            ?.checkoutTime !=
                                        null
                                    ? DateFormat('HH:mm').format(
                                        DateTime.parse(attendance
                                                .attendance
                                                .value
                                                .attendance
                                                ?.checkoutTime!)
                                            .add(
                                          Duration(hours: 1),
                                        ),
                                      )
                                    : attendance.attendance.value.attendance
                                        ?.checkoutTime,
                                topic: "Départ",
                                isCkockOut: true,
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          attendance.attendance.value.attendance
                                      ?.checkoutTime ==
                                  null
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: attendance.loader.value
                                      ? Center(
                                          child: CircularProgressIndicator
                                              .adaptive(
                                            backgroundColor: AppColor.redColor
                                                .withOpacity(0.7),
                                          ),
                                        )
                                      : CustomButtonCheck(
                                          background: AppColor.redColor
                                              .withOpacity(0.7),
                                          onPressed: () async {
                                            showAlertDialog(context);
                                          },
                                          text: 'clock_out'.tr,
                                        ),
                                )
                              : Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: attendance.loader.value
                                      ? Center(
                                          child: CircularProgressIndicator
                                              .adaptive(
                                            backgroundColor:
                                                Colors.black.withOpacity(.7),
                                          ),
                                        )
                                      : CustomButtonCheck(
                                          background:
                                              Colors.black.withOpacity(.7),
                                          onPressed: () {},
                                          text: 'you_are_clocked_out'.tr,
                                        ),
                                )
                        ],
                      ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        ScreenSize(context).mainWidth > 640 ? 1.w : 12.w,
                    vertical: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Demandes de visiteurs actifs'.tr,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (kDebugMode) {
                                print('view all visitors ------->>>');
                              }
                              Get.to(VisitorListPage());
                            },
                            child: Text(
                              'view_all'.tr,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: AppColor.primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // IconButton(
              //   onPressed: () async {
              //     await Future.delayed(Duration(seconds: 6));
              //     LocalNotification notification = LocalNotification(
              //       title: "title",
              //       body: "hello flutter!",
              //     );
              //     notification.onShow = () {
              //       print('onShow ${notification.identifier}');
              //     };
              //     notification.onClose = (closeReason) {
              //       // Only supported on windows, other platforms closeReason is always unknown.
              //       switch (closeReason) {
              //         case LocalNotificationCloseReason.userCanceled:
              //           // do something
              //           break;
              //         case LocalNotificationCloseReason.timedOut:
              //           // do something
              //           break;
              //         default:
              //       }
              //       // print('onClose ${_exampleNotification?.identifier} - $closeReason');
              //     };
              //     notification.onClick = () {
              //       print('onClick ${notification.identifier}');
              //     };
              //     notification?.onClickAction = (actionIndex) {
              //       print(
              //           'onClickAction ${notification?.identifier} - $actionIndex');
              //     };

              //     notification.show();
              //   },
              //   icon: Icon(
              //     Icons.add,
              //     color: Colors.black,
              //   ),
              // ),
              if (dashboard.loader.value) VisitorShimmer(),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: dashboard.visitors.isEmpty
                      ? [
                          EmptyScreen(
                            message: "Pas de visit",
                          )
                        ]
                      : dashboard.visitors.reversed.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VisitorCard(
                                image: e.image.toString(),
                                name: e.name.toString(),
                                id: e.id.toString(),
                                visitorID: e.id.toString(),
                                status: e.status.toString().split(".").last,
                                statusName: e.statusName.toString(),
                                checkInAt: e.checkInAt.toString(),
                                checkOutAt: e.checkOutAt.toString(),
                                createdAt: e.createAt.toString(),
                                raison: e.raison ?? ""),
                          );
                        }).toList()),
            ],
          ),
        ),
      );
    });
  }

  String formatDateTime(DateTime dateTime) {
    final DateFormat dayFormat = DateFormat('EEEE', 'fr_FR');
    final DateFormat dateFormat = DateFormat('dd MMMM, yyyy', 'fr_FR');
    final String day = dayFormat.format(dateTime);
    final String date = dateFormat.format(dateTime);
    return 'Aujourd\'hui, $day $date';
  }

  showAlertDialog(BuildContext context) {
    Widget continueButton = TextButton(
      child: Container(
        height: 45,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.primaryColor,
        ),
        child: Center(
          child: Text(
            'Oui'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () {
        attendance.clockOutUpdate(context);
        Get.back();
        (context as Element).markNeedsBuild();
      },
    );
    Widget cancelButton = TextButton(
      child: Container(
        height: 47,
        width: 102,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(width: 1, color: AppColor.primaryColor)),
        child: Center(
          child: Text(
            "Non".tr,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColor.primaryColor,
            ),
          ),
        ),
      ),
      onPressed: () {
        Get.back();
      },
    );

    AlertDialog alert = AlertDialog(
      content: Text(
        "Oui Depart".tr,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColor.primaryColor,
        ),
      ),
      actions: [
        continueButton,
        cancelButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
