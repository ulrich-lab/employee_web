import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:visitor_pass/Controllers/permission_controller.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/Schedule/screens/permission_screen.dart';
import 'package:visitor_pass/views/pages/Schedule/screens/view_permission.dart';
import 'package:visitor_pass/views/widget/empty_screen.dart';

class ScheduleScreen extends StatefulWidget {
  ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool switchValue = false;
  final _key = GlobalKey<ExpandableFabState>();
  // bool empty = true;
  final PermissionController permissionController =
      Get.put(locator<PermissionController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.greyBck,
        title: Text(
          'Schedule',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontSize: 15, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return CustomScrollView(
          slivers: [
            // Add a SliverAppBar at the top

            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 380.w,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                // title: Text("Scrollable List Tab Scroller"),

                background: Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColor.backgroundCalendar,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                      weekendStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            permissionController.loader.value ||
                    permissionController.leaveList.isEmpty
                ? SliverFillRemaining(
                    child: Container(
                      height: 150.w,
                      child: Center(
                        child: EmptyScreen(
                          message: "Pas de Permission",
                          // title: "Permissions",
                        ),
                      ),
                    ),
                  )
                : SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (index == permissionController.leaveList.length) {
                          return SizedBox(height: 100);
                        }

                        if (index >= permissionController.leaveList.length)
                          return SizedBox.shrink();

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
                                      status: leave.status?.split(".").last ??
                                          "pending",
                                    ),
                                  ),
                                  Container(
                                    width: 0.8.sw,
                                    height: 57.h,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: AppColor.backgroundCalendar,
                                      borderRadius: BorderRadius.circular(10),
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
                                                  "Type : ",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  "${leave.leaveType?.split(".").last}",
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: AppColor
                                                          .primaryColor
                                                          .withOpacity(0.5),
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 0.6.sw,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    "Duree : ",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    '${leave.startDate.toString().split(" ").first} - ${leave.endDate.toString().split(" ").first}',
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            if (leave.status?.split(".").last ==
                                                "PENDING") {
                                              Get.to(() => ViewPermission(
                                                    leave: leave,
                                                    canEdit: true,
                                                  ));
                                            } else {
                                              Get.to(() => ViewPermission(
                                                    leave: leave,
                                                    canEdit: false,
                                                  ));
                                            }
                                          },
                                          child: Container(
                                            margin:
                                                EdgeInsets.only(right: 12.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: leave.status
                                                        ?.split(".")
                                                        .last ==
                                                    "PENDING"
                                                ? SvgPicture.asset(
                                                    "./assets/icons/edit.svg")
                                                : SvgPicture.asset(
                                                    "./assets/icons/eye.svg"),
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
                      childCount: permissionController.leaveList.length + 1,
                    ),
                  )
          ],
        );
      }),
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
    );
  }
}

class StatusCircle extends StatelessWidget {
  final String status;

  StatusCircle({required this.status});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    IconData icon;

    // Define colors and icons based on the status value
    switch (status.toLowerCase()) {
      case 'accepted':
        backgroundColor = Colors.green;
        icon = Icons.check;
        break;
      case 'rejected':
        backgroundColor = Colors.red;
        icon = Icons.close;
        break;
      case 'pending':
        backgroundColor = Colors.orange;
        icon = Icons.hourglass_empty;
        break;
      default:
        backgroundColor = Colors.grey;
        icon = Icons.help_outline;
    }

    return Container(
      width: 60.h, // Diameter of the circle
      height: 60.h,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20.h,
          ),
          SizedBox(height: 4.h),
          Text(
            status,
            style: TextStyle(
                fontSize: 6, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
