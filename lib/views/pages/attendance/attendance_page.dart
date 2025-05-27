import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visitor_pass/Models/schedule_model.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/views/pages/attendance/qr_code_scanner.dart';
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
  AttendanceController attendanceController = locator<AttendanceController>();
  // bool isLoading = false;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
        child: GetBuilder<AttendanceController>(
          init: locator<AttendanceController>(),
          builder: (attendance) => Obx(
            () {
              return attendance.commonLoader.value ||
                      attendance.profileUsers.value.id == null
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        attendance.profileUsers.value.name
                                            .toString(),
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
                              // const SizedBox(height: 45),
                              // Text(
                              //   attendance.currentTime.toString(),
                              //   style: const TextStyle(
                              //     fontSize: 18,
                              //     fontWeight: FontWeight.w700,
                              //     color: AppColor.primaryColor,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 6,
                              // ),
                              // Text(
                              //   attendance.currentDate.toString(),
                              //   style: const TextStyle(
                              //     fontSize: 14,
                              //     fontWeight: FontWeight.w600,
                              //     color: AppColor.hintColor,
                              //   ),
                              // ),
                              // const SizedBox(height: 20),

                              // SizedBox(
                              //   width: 190,
                              //   // height: 48,
                              //   child: attendance.showClockin.value
                              //       ? Form(
                              //           key: _formKey,
                              //           child: TextFormField(
                              //             controller: clockInController,
                              //             textInputAction: TextInputAction.done,
                              //             keyboardType: TextInputType.text,
                              //             cursorColor: AppColor.primaryColor,
                              //             validator: (value) => value!.isEmpty
                              //                 ? 'field_cant_be_empty'.tr
                              //                 : null,
                              //             decoration: InputDecoration(
                              //               contentPadding:
                              //                   const EdgeInsets.symmetric(
                              //                       vertical: 10.0,
                              //                       horizontal: 10.0),
                              //               errorBorder: OutlineInputBorder(
                              //                 borderRadius:
                              //                     BorderRadius.circular(5.0),
                              //                 borderSide: const BorderSide(
                              //                   width: 1,
                              //                   color: AppColor.redColor,
                              //                 ),
                              //               ),
                              //               focusedErrorBorder:
                              //                   OutlineInputBorder(
                              //                 borderRadius:
                              //                     BorderRadius.circular(5.0),
                              //                 borderSide: const BorderSide(
                              //                   width: 1,
                              //                   color: AppColor.redColor,
                              //                 ),
                              //               ),
                              //               hintText: 'work_from'.tr,
                              //               hintStyle: const TextStyle(
                              //                 fontWeight: FontWeight.w500,
                              //                 fontSize: 16,
                              //                 color: AppColor.hintColor,
                              //               ),
                              //               fillColor: Colors.red,
                              //               focusedBorder:
                              //                   const OutlineInputBorder(
                              //                 borderRadius: BorderRadius.only(
                              //                     topLeft: Radius.circular(5),
                              //                     bottomLeft: Radius.circular(5)),
                              //                 borderSide: BorderSide(
                              //                     width: 1,
                              //                     color: AppColor.primaryColor),
                              //               ),
                              //               enabledBorder:
                              //                   const OutlineInputBorder(
                              //                 borderRadius: BorderRadius.only(
                              //                   topLeft: Radius.circular(5),
                              //                   bottomLeft: Radius.circular(5),
                              //                   topRight: Radius.circular(5),
                              //                   bottomRight: Radius.circular(5),
                              //                 ),
                              //                 borderSide: BorderSide(
                              //                     width: 1,
                              //                     color: AppColor.borderColor),
                              //               ),
                              //             ),
                              //             onFieldSubmitted: (value) {
                              //               //add code
                              //             },
                              //           ),
                              //         )
                              //       : Center(
                              //           child: Text(
                              //             'work_from'.tr +
                              //                 ': ${attendance.workFrom}',
                              //             style: const TextStyle(
                              //               fontSize: 16,
                              //               fontWeight: FontWeight.w500,
                              //               color: AppColor.primaryColor,
                              //             ),
                              //           ),
                              //         ),
                              // ),
                              const SizedBox(height: 40),
                              Container(
                                // height: ScreenSize(context).mainHeight / 4.5,
                                // width: ScreenSize(context).mainWidth / 2.2,
                                height: 160,
                                width: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                        color: attendance.clockOut == ''
                                            ? attendance.showClockin.value
                                                ? AppColor.primaryColor
                                                    .withOpacity(0.7)
                                                : AppColor.redColor
                                                    .withOpacity(0.7)
                                            : Colors.black.withOpacity(.7),
                                        blurRadius: 15.0,
                                        offset: const Offset(0.0, 0.75))
                                  ],
                                ),
                                child: attendance.clockOut == ''
                                    ? attendance.showClockin.value
                                        ? ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColor.primaryColor,
                                              shape: const StadiumBorder(),
                                            ),
                                            onPressed: () async {
                                              String result1 = await Get.to(
                                                  () => QrCodeScanner());

                                              attendance.clockInUpdate(
                                                  context, result1);

                                              (context as Element)
                                                  .markNeedsBuild();
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  Images.login,
                                                  height: 42,
                                                  width: 42,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      right: box.read('lang') ==
                                                              'ar'
                                                          ? 15
                                                          : 0,
                                                      bottom:
                                                          box.read('lang') ==
                                                                  'ar'
                                                              ? 5
                                                              : 0),
                                                  child: attendance.loader.value
                                                      ? CircularProgressIndicator
                                                          .adaptive(
                                                          backgroundColor:
                                                              Colors.white,
                                                        )
                                                      : Text(
                                                          'clock_in'.tr,
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                ),
                                              ],
                                            ),
                                          )
                                        : ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  AppColor.redColor,
                                              shape: const StadiumBorder(),
                                            ),
                                            onPressed: () {
                                              showAlertDialog(context);
                                            },
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  Images.menuLogout,
                                                  height: 42,
                                                  width: 42,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'clock_out'.tr,
                                                  style: const TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                    : ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          shape: const StadiumBorder(),
                                        ),
                                        onPressed: () {},
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'you_are_clocked_out'.tr,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'clock_in'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.primaryColor,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          attendance.showClockin.value
                                              ? const Text(
                                                  'N/A',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              : Text(
                                                  attendance.clockIN.value,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'clock_out'.tr,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w700,
                                              color: AppColor.primaryColor,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          attendance.clockOut == ''
                                              ? const Text(
                                                  'N/A',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                )
                                              : Text(
                                                  attendance.clockOut
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color:
                                                        AppColor.primaryColor,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                        ],
                                      )
                                    ],
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
                                          onChanged:
                                              (String? newValue) async {},
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
                                          children:
                                              attendance.attendenceList.map(
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
        attendanceController.clockOutUpdate(context);
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

  Widget scheduleItem(ScheduleItemModel item) {
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        height: size.height * 0.18,
        decoration: BoxDecoration(color: Colors.white),
        child: Row(
          children: [
            Container(
              width: 5,
              color: Colors.green,
            ),
            SizedBox(width: 10),
            Container(
              width: size.width * 0.8,
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.date ?? ""),
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 15,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text('On Time')
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
                              '${item.checkinTime ?? "__:__"} Am',
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
                              '${item.checkoutTime ?? "__:__"} PM',
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
                              '03h 48m',
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


/**
 * 
 * 
 *  SmartRefresher(
                                              enablePullDown: true,
                                              enablePullUp: false,
                                              controller: _refreshController,
                                              onRefresh: () async {
                                                attendance.getAttendanceList();
                                                _refreshController
                                                    .refreshCompleted();
                                              },
                                              onLoading: () async {
                                                // context
                                                //     .read<TransactionProvider>()
                                                //     .getListOfTransaction();
                                              },
                                              child: 
                                    )
 */