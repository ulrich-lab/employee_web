import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visitor_pass/Controllers/profile_controller.dart';
import 'package:visitor_pass/Models/attendance_model.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/views/widget/shimer_widget.dart';
import 'package:visitor_pass/views/widget/shimmer/attendance_shimmer.dart';
import 'package:visitor_pass/views/widget/textfield_builder_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../../Controllers/attendance_controller.dart';
import '../../../constants/constants.dart';

// ignore: must_be_immutable
class AttendancePage extends StatefulWidget {
  AttendancePage({Key? key}) : super(key: key);

  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  final TextEditingController clockInController = TextEditingController();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AttendanceController attendance = Get.put(locator<AttendanceController>());

  final ProfileController profile = Get.put(locator<ProfileController>());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'attendance'.tr,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Obx(
          () {
            return attendance.isLoadingGetAttendenceList.value
                ? const AttendanceShimmer()
                : SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'good_morning'.tr,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      "${profile.profileUser.first_name} ${profile.profileUser.last_name}",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CachedNetworkImage(
                                    imageUrl: attendance
                                        .profileUsers.value.image
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        CircleAvatar(
                                      radius: 40.0,
                                      backgroundColor: Colors.transparent,
                                      backgroundImage: imageProvider,
                                    ),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      child: const CircleAvatar(radius: 40.0),
                                      baseColor: Colors.grey[300]!,
                                      highlightColor: Colors.grey[400]!,
                                    ),
                                    errorWidget: (context, url, error) =>
                                        CircleAvatar(
                                      child: Image.asset(
                                        'assets/images/visitor.png',
                                        width: 100,
                                        height: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 5,
                                  child: TextFieldBuilder(
                                    name: '',
                                    prefixIcon: Icon(Icons.search),
                                    hint: "Search...",
                                    hintColor: Colors.grey,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Flexible(
                                  flex: 4,
                                  child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.70),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                      child: DropdownButton<String>(
                                        dropdownColor: Colors.white,
                                        value: "This Month",
                                        isExpanded: true,
                                        underline: Container(),
                                        iconDisabledColor: Colors.black,
                                        iconEnabledColor: Colors.black,
                                        onChanged: (String? newValue) async {},
                                        items: [
                                          "This Month",
                                          "This week",
                                          "Last three days"
                                        ].map((String option) {
                                          return DropdownMenuItem<String>(
                                            value: option,
                                            child: Text(option),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            attendance.attendenceList.length > 0
                                ? attendance.isLoadingGetAttendenceList.value
                                    ? ShimmerColumnWidget(
                                        itemHeight: 50,
                                        itemWith: double.infinity,
                                        shimmerHeight: double.infinity,
                                      )
                                    : Column(
                                        children: attendance.attendenceList.reversed.map(
                                          (element) {
                                            return Column(
                                              children: [
                                                scheduleItem(element),
                                                SizedBox(
                                                  height: 12,
                                                )
                                              ],
                                            );
                                          },
                                        ).toList(),
                                      )
                                : SizedBox(),
                            SizedBox(
                              height: 500,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
          },
        ),
      ),
    );
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
            'yes_sure'.tr,
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
            "no_cancel".tr,
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

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text(
        "sure_clock_out".tr,
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

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String formatCustmDate(input) {
    final date = DateTime.parse(input).toLocal();

    final formatter = DateFormat('EEEE, d MMMM y', 'fr_FR');
    final formatted = formatter.format(date);

    return formatted;
  }

  Widget scheduleItem(AttendanceData item) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: ScreenSize(context).mainWidth > 640
            ? size.height * 0.28
            : size.height * 0.18,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              width: 5,
              color: item.attendance?.isLate ?? false
                  ? Colors.redAccent
                  : Colors.green,
            ),
            SizedBox(width: 10),
            Container(
              width: ScreenSize(context).mainWidth > 640
                  ? size.width * 0.4
                  : size.width * 0.8,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.attendance?.checkinTime == null
                          ? "__:__"
                          : formatCustmDate(item.attendance!.checkinTime!)),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: item.attendance?.isLate ?? false
                              ? Colors.redAccent
                              : Colors.green.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: item.attendance?.isLate ?? false
                                    ? Colors.redAccent
                                    : Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(item.attendance?.isLate ?? false
                                ? "Late"
                                : 'On Time')
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Check In',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            Text(
                              item.attendance?.checkinTime != null
                                  ? DateFormat('HH:mm').format(
                                      DateTime.parse(
                                              item.attendance!.checkinTime!)
                                          .add(
                                        Duration(hours: 1),
                                      ),
                                    )
                                  : "__:__",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                          indent: 10,
                          // endIndent: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Check Out',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              item.attendance?.checkoutTime != null
                                  ? DateFormat('HH:mm').format(
                                      DateTime.parse(
                                              item.attendance?.checkoutTime)
                                          .add(
                                        Duration(hours: 1),
                                      ),
                                    )
                                  : "__:__",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ],
                        ),
                        VerticalDivider(
                          color: Colors.grey,
                          thickness: 2,
                          indent: 10,
                          // endIndent: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Totals Hours',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13),
                            ),
                            Text(
                              '__:__',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
