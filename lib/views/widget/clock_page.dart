import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import 'package:get/get.dart';
import 'package:one_clock/one_clock.dart';
import 'package:visitor_pass/Controllers/permission_controller.dart'
    show PermissionController;
import 'package:visitor_pass/config/locator/locator.dart' show locator;
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/Schedule/schedule_screen.dart';
import 'package:visitor_pass/views/pages/Schedule/screens/permission_screen.dart';
import 'package:visitor_pass/views/widget/empty_screen.dart' show EmptyScreen;

class ClockPage extends StatelessWidget {
  ClockPage({super.key});

  DateTime dateTime = DateTime.now();
  final PermissionController permissionController =
      Get.put(locator<PermissionController>());
  final _key = GlobalKey<ExpandableFabState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        key: _key,
        type: ExpandableFabType.up,
        childrenAnimation: ExpandableFabAnimation.none,
        distance: 70,
        overlayStyle: ExpandableFabOverlayStyle(
          color: Colors.white.withOpacity(0.9),
        ),
        children: [
          Row(
            children: [
              Text('Permissions'),
              SizedBox(width: 20),
              FloatingActionButton.small(
                backgroundColor: AppColor.greyBck,
                heroTag: null,
                onPressed: () async {
                  final state = _key.currentState;
                  if (state != null) {
                    state.toggle();
                  }
                  Get.to(() => PermissionScreen());
                },
                child: SvgPicture.asset(
                  "./assets/icons/permission.svg",
                  width: 20.w,
                  height: 20.h,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('Rapports'),
              SizedBox(width: 20),
              FloatingActionButton.small(
                backgroundColor: AppColor.greyBck,
                heroTag: null,
                onPressed: null,
                child: Icon(
                  Icons.email,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text('Notifications'),
              SizedBox(width: 20),
              FloatingActionButton.small(
                backgroundColor: AppColor.greyBck,
                heroTag: null,
                onPressed: null,
                child: SvgPicture.asset(
                  "./assets/icons/bell.svg",
                  width: 20.w,
                  height: 20.h,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
          // FloatingActionButton.small(
          //   heroTag: null,
          //   onPressed: null,
          //   child: Icon(Icons.add),
          // ),
        ],
      ),
      body: Obx(() {
        return Container(
          width: double.infinity,
          height: double.infinity,
          // color: AppColor.textPrimaryDarkColor,
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Flexible(
                flex: 4,
                child: AnalogClock(
                  isLive: true,
                  // width: 120,
                  // height: 120,
                  datetime: dateTime,
                ),
              ),
              SizedBox(height: 100.h),
              Flexible(
                flex: 5,
                child: Container(
                  child: permissionController.loader.value ||
                          permissionController.leaveList.isEmpty
                      ? SizedBox()
                      : ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            final leave = permissionController.leaveList[index];

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.w, vertical: 12.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: StatusCircle(
                                          status:
                                              leave.status?.split(".").last ??
                                                  "pending",
                                        ),
                                      ),
                                      Container(
                                        width: 0.2.sw,
                                        height: 57.h,
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: AppColor.backgroundCalendar,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "description : ",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 0.1.sw,
                                                      child: Text(
                                                        "${leave.comment}",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            color: AppColor
                                                                .primaryColor
                                                                .withOpacity(
                                                                    0.5),
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 0.15.sw,
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        "Duree : ",
                                                        style: TextStyle(
                                                            fontSize: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        '${leave.startDate.toString().split(" ").first} - ${leave.endDate.toString().split(" ").first}',
                                                        style: TextStyle(
                                                            fontSize: 10),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // if (leave.status
                                                //         ?.split(".")
                                                //         .last ==
                                                //     "PENDING") {
                                                //   Get.to(() => ViewPermission(
                                                //         leave: leave,
                                                //         canEdit: true,
                                                //       ));
                                                // } else {
                                                //   Get.to(() => ViewPermission(
                                                //         leave: leave,
                                                //         canEdit: false,
                                                //       ));
                                                // }
                                              },
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(right: 8.w),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: leave.status
                                                            ?.split(".")
                                                            .last ==
                                                        "PENDING"
                                                    ? SvgPicture.asset(
                                                        "./assets/icons/edit.svg",
                                                        width: 18,
                                                        height: 18,
                                                      )
                                                    : SvgPicture.asset(
                                                        "./assets/icons/eye.svg",
                                                        width: 18,
                                                        height: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: permissionController.leaveList.length,
                        ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
