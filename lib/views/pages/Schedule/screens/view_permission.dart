import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:visitor_pass/Controllers/permission_controller.dart';
import 'package:visitor_pass/Models/permission_model.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/views/pages/Schedule/schedule_screen.dart';

class ViewPermission extends StatefulWidget {
  ViewPermission({super.key, required this.canEdit, required this.leave});

  final bool canEdit;
  final Leave leave;

  @override
  State<ViewPermission> createState() => _ViewPermissionState();
}

class _ViewPermissionState extends State<ViewPermission> {
  final PermissionController permissionController =
      Get.put(locator<PermissionController>());

  String _hoursOrDays = 'date';

  DateTime? _startDate;

  DateTime? _endDate;

  String _reasonText = '';

  String _descriptionText = '';

  Future<void> _selectDate(BuildContext context, bool isStartDate) async {
    if (_hoursOrDays == 'Heure') {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (pickedTime != null) {
        setState(() {
          DateTime selectedDate = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            pickedTime.hour,
            pickedTime.minute,
          );
          if (isStartDate) {
            _startDate = selectedDate;
          } else {
            _endDate = selectedDate;
          }
        });
      }
    } else {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (pickedDate != null) {
        setState(() {
          if (isStartDate) {
            _startDate = pickedDate;
          } else {
            _endDate = pickedDate;
          }
        });
      }
    }
  }

  @override
  void initState() {
    _startDate = widget.leave.startDate;
    _endDate = widget.leave.endDate;
    _descriptionText = widget.leave.comment ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widget.canEdit
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
              margin: EdgeInsets.only(bottom: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _approveDelete(context, widget.leave.id);
                        },
                        icon: Icon(Icons.delete_outline_rounded),
                      ),
                      SizedBox(width: 2.w),
                      Text(
                        'Supprimer cette permission'.tr,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColor.hintColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          // _cancelAlert(widget.id);
                          Get.back();
                        },
                        child: Text(
                          "Annuler".tr,
                          style: TextStyle(
                              color: AppColor.primaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColor.nameColor,
                          padding: const EdgeInsets.only(
                              left: 45.0, right: 45.0, top: 15.0, bottom: 15.0),
                          side: const BorderSide(
                              color: AppColor.primaryColor, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),

                      Obx(() {
                        return OutlinedButton(
                          onPressed: () async {
                            await permissionController.updateLeave(
                                comment: _descriptionText,
                                start_date: _startDate.toString(),
                                end_date: _endDate.toString(),
                                leave_type: widget.leave.leaveType
                                    .toString()
                                    .split(".")
                                    .last,
                                leave_id: widget.leave.id ?? "",
                                onSuccess: () {
                                  Get.back();
                                });
                          },
                          child:
                              !permissionController.isLoadingUpdateLeave.value
                                  ? Text(
                                      "Envoyer".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : SizedBox(
                                      width: 20.w,
                                      height: 20.w,
                                      child: CircularProgressIndicator()),
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
                        );
                      }),
                      // if (controller.visitorDetails.status == "2" &&
                      //     controller.visitorDetails.checkoutAt?.length == 0)
                    ],
                  ),
                ],
              ),
            )
          : null,
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
          horizontal: 12.w,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  height: 0.25.sh,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: AppColor.backgroundCalendar,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 0.25.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                    "./assets/icons/start_calendar.svg"),
                              ),
                              Text(
                                "${DateFormat('dd').format(widget.leave.startDate!)}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.primaryColor.withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 0.31.sw),
                        SizedBox(
                          width: 0.25.sw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                child: SvgPicture.asset(
                                    "./assets/icons/end_calendar.svg"),
                              ),
                              Text(
                                "${DateFormat('dd').format(widget.leave.endDate!)}",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: AppColor.primaryColor.withOpacity(0.5),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    icon: SvgPicture.asset(
                      Images.backArrow,
                      height: 30,
                      width: 30,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "./assets/images/curve.png",
                    width: 0.5.sw,
                    height: 150.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      Images.phone,
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Type'.tr,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColor.hintColor),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          widget.leave.leaveType.toString().split(".").last,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColor.nameColor),
                        ),
                      ],
                    ),
                  ],
                ),
                // widget.canEdit
                //     ? Container(
                //         width: 40.w,
                //         height: 40.w,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: Colors.grey[200],
                //         ),
                //         padding: EdgeInsets.all(4),
                //         child: IconButton(
                //           onPressed: () {},
                //           icon: Icon(
                //             Icons.edit,
                //             size: 15,
                //           ),
                //         ),
                //       )
                //     : SizedBox()
              ],
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "./assets/icons/date.svg",
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date debut'.tr,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColor.hintColor),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          _startDate.toString().split(" ").first,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColor.nameColor),
                        ),
                      ],
                    ),
                  ],
                ),
                widget.canEdit
                    ? Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                          onPressed: () => _selectDate(context, true),
                          icon: Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "./assets/icons/date.svg",
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date fin'.tr,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColor.hintColor),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          _endDate.toString().split(" ").first,
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColor.nameColor),
                        ),
                      ],
                    ),
                  ],
                ),
                widget.canEdit
                    ? Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                          onPressed: () => _selectDate(context, false),
                          icon: Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "./assets/icons/clock.svg",
                      height: 22,
                      width: 22,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Status'.tr,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColor.hintColor,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            widget.leave.status?.split(".").last ?? "pending",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColor.nameColor,
                            ),
                            maxLines: 7,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  child: StatusCircle(
                    status: widget.leave.status?.split(".").last ?? "pending",
                  ),
                ),
              ],
            ),
            SizedBox(height: 22.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description'.tr,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColor.hintColor,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    SizedBox(
                      width: 0.7.sw,
                      child: Text(
                        _descriptionText,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColor.nameColor,
                        ),
                        maxLines: 7,
                      ),
                    ),
                  ],
                ),
                widget.canEdit
                    ? Container(
                        width: 40.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[200],
                        ),
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                          onPressed: () {
                            _showEditDialog();
                          },
                          icon: Icon(
                            Icons.edit,
                            size: 15,
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }

  _approveDelete(context, id) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "Supprime",
      desc: "etes vous sur de vouloir supprimer ?",
      buttons: [
        DialogButton(
          child: Text(
            "Yes",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          onPressed: () async {
            await permissionController.deleteLeave(leave_id: id);
            Get.back();
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

  Future<void> _showEditDialog() async {
    TextEditingController textController =
        TextEditingController(text: _descriptionText);

    String? result = await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Modifier la description'),
          content: TextField(
            autofocus: true,
            controller: textController,
            maxLines: 7,
            decoration: InputDecoration(
              labelText: 'Description...',
              border: InputBorder.none,
              labelStyle:
                  TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Annuler'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(textController.text);
              },
              child: Text('Enregistrer'),
            ),
          ],
        );
      },
    );

    if (result != null) {
      setState(() {
        _descriptionText = result;
      });
    }
  }
}
