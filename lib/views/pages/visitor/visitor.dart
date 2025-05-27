import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Controllers/dashboard_controller.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/views/pages/search/search_screen.dart';
import 'package:visitor_pass/views/widget/empty_screen.dart';
import '../../../constants/constants.dart';
import '../../widget/visitor_card.dart';

class VisitorListPage extends StatefulWidget {
  VisitorListPage({Key? key}) : super(key: key);

  @override
  State<VisitorListPage> createState() => _VisitorListPageState();
}

class _VisitorListPageState extends State<VisitorListPage>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _onRefresh();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final TextEditingController searchTextController = TextEditingController();
  final TextEditingController clockInController = TextEditingController();

  final DashboardController dashboard = Get.put(locator<DashboardController>());
  bool validate = false;
  bool clockIn = true;
  bool clockingOut = true;

  Future<void> _onRefresh() async {
    dashboard.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.white,
        body: GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScreenSize(context).mainWidth > 640
                ? SizedBox(height: 20.h)
                : SizedBox(
                    height: 40,
                  ),
            ScreenSize(context).mainWidth > 640
                ? SizedBox()
                : Text(
                    'My Visitors'.tr,
                    style: TextStyle(
                      // color: AppColor.primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
            ScreenSize(context).mainWidth > 640
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(height: 24),
                      SearchWidget(),
                      SizedBox(height: 26.h),
                    ],
                  ),
            TabBar(
              // isScrollable: true,
              indicatorPadding: EdgeInsets.zero,
              unselectedLabelColor: Color(0XFF404040),
              // labelColor: Color(0XFF404040),
              indicatorColor: kSecondaryColor,

              labelPadding: EdgeInsets.zero,
              tabs: <Tab>[
                Tab(text: "Upcoming"),
                Tab(text: "Accepted"),
                Tab(text: "Rejected"),
              ],
              controller: _tabController,
            ),
            Container(
              height: 0.7.sh,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  Obx(() {
                    return SingleChildScrollView(
                      child: Column(
                          children: dashboard.visitors.isEmpty
                              ? [
                                 SizedBox(
                                    height: 80.h,
                                  ),
                                  Center(
                                    child: EmptyScreen(
                                      message: "Pas de visit",
                                      // title: "Visits",
                                    ),
                                  )
                                ]
                              : dashboard.visitors.map((e) {
                                  return e.status.toString().split(".").last ==
                                          "PENDING"
                                      ? VisitorCard(
                                          image: e.image.toString(),
                                          name: e.name.toString(),
                                          id: e.id.toString(),
                                          visitorID: e.regNo.toString(),
                                          status: e.status
                                              .toString()
                                              .split(".")
                                              .last,
                                          statusName: e.statusName.toString(),
                                          checkInAt: e.checkInAt.toString(),
                                          checkOutAt: e.checkOutAt.toString(),
                                          raison: e.raison ?? "",
                                          createdAt: e.createAt.toString())
                                      : SizedBox();
                                }).toList()),
                    );
                  }),
                  Obx(() {
                    return SingleChildScrollView(
                      child: Column(
                          children: dashboard.visitors.isEmpty
                              ? [
                                  SizedBox(
                                    height: 80.h,
                                  ),
                                  Center(
                                    child: EmptyScreen(
                                      message: "Pas de visit",
                                      // title: "Visits",
                                    ),
                                  )
                                ]
                              : dashboard.visitors.map((e) {
                                  return e.status.toString().split(".").last ==
                                          "ACCEPTED"
                                      ? VisitorCard(
                                          image: e.image.toString(),
                                          name: e.name.toString(),
                                          id: e.id.toString(),
                                          visitorID: e.regNo.toString(),
                                          status: e.status
                                              .toString()
                                              .split(".")
                                              .last,
                                          statusName: e.statusName.toString(),
                                          checkInAt: e.checkInAt.toString(),
                                          raison: e.raison ?? "",
                                          checkOutAt: e.checkOutAt.toString(),
                                          createdAt: e.createAt.toString())
                                      : SizedBox();
                                }).toList()),
                    );
                  }),
                  Obx(() {
                    return SingleChildScrollView(
                      child: Column(
                          children: dashboard.visitors.isEmpty
                              ? [
                                 SizedBox(
                                    height: 80.h,
                                  ),
                                  Center(
                                    child: EmptyScreen(
                                      message: "Pas de visit",
                                      // title: "Visits",
                                    ),
                                  )
                                ]
                              : dashboard.visitors.map((e) {
                                  return e.status.toString().split(".").last ==
                                          "REJECTED"
                                      ? VisitorCard(
                                          image: e.image.toString(),
                                          name: e.name.toString(),
                                          id: e.id.toString(),
                                          visitorID: e.regNo.toString(),
                                          status: e.status
                                              .toString()
                                              .split(".")
                                              .last,
                                          statusName: e.statusName.toString(),
                                          raison: e.raison ?? "",
                                          checkInAt: e.checkInAt.toString(),
                                          checkOutAt: e.checkOutAt.toString(),
                                          createdAt: e.createAt.toString())
                                      : SizedBox();
                                }).toList()),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
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
        child: const Center(
          child: Text(
            "Yes, Sure",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
      onPressed: () {
        clockingOut = false;
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
        child: const Center(
          child: Text(
            "No, Cancel",
            style: TextStyle(
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

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text(
        "Are you sure you want to clock out?",
        style: TextStyle(
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

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
