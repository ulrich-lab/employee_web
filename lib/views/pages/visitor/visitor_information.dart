// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:visitor_pass/Controllers/dashboard_controller.dart';
import 'package:visitor_pass/Controllers/visitor-controller.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import '../../../Controllers/visitor_details_controller.dart';
import '../../shimmer/visitor_information_shimmer.dart';
import '../../../constants/constants.dart';

class VisitorInformationPage extends StatefulWidget {
  VisitorInformationPage(
      {Key? key,
      required this.id,
      this.status,
      this.visitorId,
      this.checkOutAt})
      : super(key: key);
  final String? id;
  final String? status;
  final String? visitorId;
  final String? checkOutAt;

  @override
  State<VisitorInformationPage> createState() => _VisitorInformationPageState();
}

class _VisitorInformationPageState extends State<VisitorInformationPage> {
  final VisitorController visitorController = Get.put(VisitorController());
  final DashboardController dashboard = Get.put(locator<DashboardController>());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      locator<VisitorDetailsController>().getVisitorDetails(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final visitorDetailsController =
        Get.put(locator<VisitorDetailsController>());

    return GetBuilder<VisitorDetailsController>(
        init: locator<VisitorDetailsController>(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'visitor_information'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColor.primaryColor,
                  ),
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: SvgPicture.asset(
                    Images.backArrow,
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ),
              bottomNavigationBar: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                margin: EdgeInsets.only(bottom: 20),
                child: controller.visitorDetails.statusName != "PENDING"
                    ? controller.visitorDetails.checkoutAt?.length == 0
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(58),
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _checkOut(widget.id);
                            },
                            child: Text(
                              "check_out".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          )
                        : SizedBox().marginZero
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              _cancelAlert(widget.id);
                            },
                            child: Text(
                              "reject".tr,
                              style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColor.nameColor,
                              padding: const EdgeInsets.only(
                                  left: 45.0,
                                  right: 45.0,
                                  top: 15.0,
                                  bottom: 15.0),
                              side: const BorderSide(
                                  color: AppColor.primaryColor, width: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),

                          OutlinedButton(
                            onPressed: () {
                              _approveAlert(widget.id);
                            },
                            child: Text(
                              "accept".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppColor.nameColor,
                              padding: const EdgeInsets.only(
                                  left: 45.0,
                                  right: 45.0,
                                  top: 15.0,
                                  bottom: 15.0),
                              backgroundColor: AppColor.primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          // if (controller.visitorDetails.status == "2" &&
                          //     controller.visitorDetails.checkoutAt?.length == 0)
                        ],
                      ),
              ),
              body: visitorDetailsController.loader
                  ? VisitorInformationShimmerPage()
                  : SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: CachedNetworkImage(
                                      imageUrl: controller.visitorDetails.image
                                          .toString(),
                                      imageBuilder: (context, imageProvider) =>
                                          CircleAvatar(
                                            radius: 40.0,
                                            backgroundColor: Colors.transparent,
                                            backgroundImage: imageProvider,
                                          ),
                                      placeholder: (context, url) =>
                                          Shimmer.fromColors(
                                            child: const CircleAvatar(
                                                radius: 40.0),
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
                                          ))),
                              SizedBox(
                                height: 15,
                              ),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.name,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                print(controller
                                                    .visitorDetails.name);
                                              },
                                              child: Text(
                                                "name".tr,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.hintColor),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.name
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 21.0,
                                  //       right: 0,
                                  //       top: 0,
                                  //       bottom: 0),
                                  //   child: Row(
                                  //     children: [
                                  //       SvgPicture.asset(
                                  //         Images.email,
                                  //         height: 18,
                                  //         width: 18,
                                  //       ),
                                  //       SizedBox(
                                  //         width: 14,
                                  //       ),
                                  //       Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(
                                  //             'email'.tr,
                                  //             style: TextStyle(
                                  //                 fontSize: 15,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 color: AppColor.hintColor),
                                  //           ),
                                  //           SizedBox(
                                  //             height: 4,
                                  //           ),
                                  //           Text(
                                  //             controller.visitorDetails.email
                                  //                 .toString(),
                                  //             style: TextStyle(
                                  //                 fontSize: 15,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 color: AppColor.nameColor),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 12,
                                  // ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Images.phone,
                                              height: 18,
                                              width: 18,
                                            ),
                                            const SizedBox(
                                              width: 14,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'phone'.tr,
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColor.hintColor),
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Text(
                                                  controller
                                                      .visitorDetails.phone
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          AppColor.nameColor),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () => _makePhoneCall(controller
                                              .visitorDetails.phone
                                              .toString()),
                                          child: Container(
                                            width: 60.w,
                                            height: 60.w,
                                            child: Lottie.asset(
                                                'assets/icons/phone.json'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // const SizedBox(
                                  //   height: 12,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 21.0,
                                  //       right: 0,
                                  //       top: 0,
                                  //       bottom: 0),
                                  //   child: Row(
                                  //     children: [
                                  //       SvgPicture.asset(
                                  //         Images.gender,
                                  //         height: 18,
                                  //         width: 18,
                                  //       ),
                                  //       SizedBox(
                                  //         width: 14,
                                  //       ),
                                  //       Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(
                                  //             'gender'.tr,
                                  //             style: TextStyle(
                                  //                 fontSize: 15,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 color: AppColor.hintColor),
                                  //           ),
                                  //           SizedBox(
                                  //             height: 4,
                                  //           ),
                                  //           Text(
                                  //             controller
                                  //                 .visitorDetails.genderName
                                  //                 .toString(),
                                  //             style: TextStyle(
                                  //                 fontSize: 15,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 color: AppColor.nameColor),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.company,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'company'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            SizedBox(
                                              width: 0.7.sw,
                                              child: Text(
                                                controller
                                                    .visitorDetails.companyName
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColor.nameColor),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 12,
                                  // ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(
                                  //       left: 21.0,
                                  //       right: 0,
                                  //       top: 0,
                                  //       bottom: 0),
                                  //   child: Row(
                                  //     children: [
                                  //       SvgPicture.asset(
                                  //         Images.name,
                                  //         height: 18,
                                  //         width: 18,
                                  //       ),
                                  //       SizedBox(
                                  //         width: 14,
                                  //       ),
                                  //       Column(
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text(
                                  //             'nid_no'.tr,
                                  //             style: TextStyle(
                                  //                 fontSize: 15,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 color: AppColor.hintColor),
                                  //           ),
                                  //           SizedBox(
                                  //             height: 4,
                                  //           ),
                                  //           Text(
                                  //             controller.visitorDetails
                                  //                 .nationalIdentificationNo
                                  //                 .toString(),
                                  //             style: TextStyle(
                                  //                 fontSize: 15,
                                  //                 fontWeight: FontWeight.w500,
                                  //                 color: AppColor.nameColor),
                                  //           ),
                                  //         ],
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.address,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'address'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.address
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.employee,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'employee'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.employee
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.purpose,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'purpose'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            SizedBox(
                                              width: 0.7.sw,
                                              child: Text(
                                                controller
                                                    .visitorDetails.purpose
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.date,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'date'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller.visitorDetails.date
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.clock,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'check_in'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller
                                                  .visitorDetails.checkinAt
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 21.0,
                                        right: 0,
                                        top: 0,
                                        bottom: 0),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          Images.clock,
                                          height: 18,
                                          width: 18,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'check_out'.tr,
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.hintColor),
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              controller
                                                  .visitorDetails.checkoutAt
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColor.nameColor),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ));
        });
  }

  _cancelAlert(id) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "Decline",
      desc: "Are you sure, want to decline ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () async {
            await dashboard.changeStatus(context, id, "checkout");
            locator<VisitorDetailsController>().getVisitorDetails(widget.id);
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }

  _approveAlert(id) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Approve",
      desc: "Are you sure, want to approve ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () async {
            await dashboard.changeStatus(context, widget.id, "accepte");
            locator<VisitorDetailsController>().getVisitorDetails(widget.id);
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }

  _checkOut(id) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Check Out",
      desc: "Are you sure, want to check out ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () async {
            await dashboard.changeStatus(context, id, "checkout");
            locator<VisitorDetailsController>().getVisitorDetails(widget.id);
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "No",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Impossible de lancer l\'appel $phoneNumber';
    }
  }
}
