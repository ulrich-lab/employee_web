// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:visitor_pass/Controllers/dashboard_controller.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../pages/visitor/visitor_information.dart';

class VisitorCard extends StatefulWidget {
  VisitorCard({
    Key? key,
    required this.name,
    required this.statusName,
    required this.id,
    required this.visitorID,
    required this.status,
    required this.image,
    required this.checkInAt,
    required this.checkOutAt,
    required this.createdAt,
    required this.raison,
  }) : super(key: key);
  final String name;
  final String id;
  final String visitorID;
  final String status;
  final String statusName;
  final String image;
  final String checkInAt;
  final String checkOutAt;
  final String createdAt;
  final String raison;

  @override
  State<VisitorCard> createState() => _VisitorCardState();
}

class _VisitorCardState extends State<VisitorCard> {
  final DashboardController dashboard = Get.put(locator<DashboardController>());
  bool switchValue = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => VisitorInformationPage(
                  status: widget.status,
                  id: widget.id,
                  visitorId: widget.visitorID,
                  checkOutAt: widget.checkOutAt,
                ),
            duration: Duration(milliseconds: 400),
            transition: Transition.rightToLeft);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: Container(
          // height: 102,
          width:
              ScreenSize(context).mainWidth > 640 ? 0.35.sw : double.infinity,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColor.borderColor),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('./assets/new/calendar_icon.png'),
                      Container(
                        width: ScreenSize(context).mainWidth > 640
                            ? 0.1.sw
                            : 0.3.sw,
                        child: Text(
                          widget.createdAt != "" ? widget.createdAt : "",
                          style: TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                  widget.checkInAt != ""
                      ? Row(
                          children: [
                            SvgPicture.asset(
                              'assets/new/clock.svg',
                              width: 15,
                              height: 15,
                              color: AppColor.primaryColor,
                            ),
                            SizedBox(width: 2.w),
                            Text(
                              widget.checkInAt,
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        )
                      : SizedBox(),
                  Row(
                    children: [
                      Text(
                        'Remind me',
                        style: TextStyle(fontSize: 8),
                      ),
                      Transform.scale(
                        scale: 0.5,
                        child: CupertinoSwitch(
                          value: switchValue,
                          activeColor: CupertinoColors.activeBlue,
                          onChanged: (bool? value) {
                            setState(() {
                              switchValue = !switchValue;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Row(
                    children: [
                      widget.image != ""
                          ? CachedNetworkImage(
                              imageUrl: widget.image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 18,
                                  horizontal: 14,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 60,
                                width: 60,
                              ),
                              placeholder: (context, url) => Shimmer.fromColors(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 18, horizontal: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/visitor.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  height: 60,
                                  width: 60,
                                ),
                                baseColor: Colors.grey[300]!,
                                highlightColor: Colors.grey[400]!,
                              ),
                              errorWidget: (context, url, error) => Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 18, horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/visitor.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 60,
                                width: 60,
                              ),
                            )
                          : SizedBox(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/new/personne.svg',
                                width: 15,
                                height: 15,
                                color: AppColor.primaryColor,
                              ),
                              SizedBox(width: 12.w),
                              SizedBox(
                                width: ScreenSize(context).mainWidth > 640
                                    ? 0.1.sw
                                    : 0.5.sw,
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: AppColor.nameColor,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 4.h),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/new/badge.svg',
                                width: 15,
                                height: 15,
                                color: AppColor.primaryColor,
                              ),
                              SizedBox(width: 12.w),
                              Container(
                                width: ScreenSize(context).mainWidth > 640
                                    ? 0.1.sw
                                    : 0.45.sw,
                                child: Text(
                                  'Raison'.tr + ': ' + widget.raison,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColor.hintColor,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          // Text(
                          //   'status'.tr + ': ' + widget.statusName,
                          //   style: const TextStyle(
                          //     fontWeight: FontWeight.w400,
                          //     fontSize: 12,
                          //     color: AppColor.hintColor,
                          //   ),
                          // ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/new/clock.svg',
                                width: 15,
                                height: 15,
                                color: AppColor.primaryColor,
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                '30 min',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: AppColor.hintColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.status == "PENDING")
                    Container(
                      width: ScreenSize(context).mainWidth > 640
                          ? 0.33.sw
                          : 0.8.sw,
                      padding:
                          const EdgeInsets.only(top: 2, right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _cancelAlert(context);
                            },
                            child: Text(
                              "reject".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kSecondaryColor,
                              minimumSize: Size(50, 40),
                              padding: EdgeInsets.only(left: 20, right: 20),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              _approveAlert(context);
                            },
                            child: Text(
                              "approve".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColor.primaryColor,
                              minimumSize: Size(50, 40),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (widget.status == "ACCEPTED")
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 0, right: 10, left: 10),
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              _checkOut(context);
                            },
                            child: Text(
                              "checkout".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.primaryColor,
                                minimumSize: Size(50, 40)),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              if (widget.status == "REJECTED")
                Text(
                  "Reject".tr,
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
            ],
          ),
        ),
      ),
    );
  }

  _cancelAlert(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      title: "reject".tr,
      desc: "are_you_sure_reject".tr,
      buttons: [
        DialogButton(
          child: Text(
            "yes".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            dashboard.changeStatus(context, widget.id, "rejected");
            Get.back();
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "no".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }

  _approveAlert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "approve".tr,
      desc: "are_you_sure_approve".tr,
      buttons: [
        DialogButton(
          child: Text(
            "yes".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            dashboard.changeStatus(context, widget.id, "accepte");
            Get.back();
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "no".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }

  _checkOut(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "check_out".tr,
      desc: "are_you_sure_checkout".tr,
      buttons: [
        DialogButton(
          child: Text(
            "yes".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () {
            print(widget.visitorID);
            dashboard.changeStatus(context, widget.visitorID, "checkout");
            Get.back();
          },
          color: AppColor.primaryColor,
        ),
        DialogButton(
          child: Text(
            "no".tr,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () => Navigator.pop(context),
          color: AppColor.redColor,
        )
      ],
    ).show();
  }
}
