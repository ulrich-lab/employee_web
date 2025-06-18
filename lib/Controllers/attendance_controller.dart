import 'dart:convert';
// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
// import 'package:location/location.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Models/attendance_model.dart';
import 'package:visitor_pass/Models/schedule_model.dart';
import 'package:visitor_pass/domain/attendance_repository.dart';
import 'package:visitor_pass/main.dart';

import '../constants/constants.dart';
import '/services/api-list.dart';
import '/services/server.dart';

@lazySingleton
class AttendanceController extends GetxController {
  final AttendanceRepository attendanceRepository;
  AttendanceController(this.attendanceRepository);
  // UserService userService = UserService();
  Server server = Server();
  TextEditingController workController = TextEditingController();
  RxBool commonLoader = true.obs;
  RxBool loader = false.obs;
  RxBool isLoadingGetAttendenceList = false.obs;
  RxBool loaders = false.obs;
  var profileUsers = Employee().obs;
  RxString currentDate = ''.obs;
  RxString currentTime = ''.obs;
  RxString clockIN = ''.obs;
  RxString clockOut = ''.obs;
  RxString workFrom = ''.obs;
  RxBool showClockin = true.obs;
  var attendenceList = <AttendanceData>[].obs;
  // Stream<AttendanceData?>? status;
  var attendance = AttendanceData().obs;

  // @override
  // void onInit() {
  //   getAttendanceStatus();
  //   getAttendanceList();
  //   super.onInit();
  // }

  Future<void>? getAttendanceStatus() async {
    // UserService userService = UserService();
    attendanceRepository
        .listenToAttendanceStatus(id: prefs.getString("user-id") ?? "")!
        .listen(
      (data) {
        attendance.value = data!;
      },
      onError: (error) {},
      onDone: () {},
    );
  }

  getAttendanceList() async {
    if (isLoadingGetAttendenceList.value) return;
    isLoadingGetAttendenceList.value = true;
    attendenceList.clear();
    // server.getRequest(endPoint: APIList.attendanceList).then((response) {
    //   if (response != null && response.statusCode == 200) {
    //     // attendenceList.
    //     final jsonResponse = json.decode(response.body);
    //     for (var el in jsonResponse['data']['auth_user_attendance']) {
    //       attendenceList.add(ScheduleItemModel.fromJson(el));
    //     }

    //     isLoadingGetAttendenceList.value = false;
    //   } else {
    //     isLoadingGetAttendenceList.value = false;
    //   }
    // });

    await attendanceRepository
        .attendanceList(id: prefs.getString("user-id") ?? "")
        .listen(
      (data) {
        attendenceList.value = data!;
         isLoadingGetAttendenceList.value = false;
      },
      onError: (error) {},
      onDone: () {},
    );

   
  }

  clockInUpdate(context, String data) async {
    // if (ScreenSize(context).mainWidth>650) {
    // if (ScreenUtil().screenWidth > 640) {
    loader.value = true;
    var r = attendanceRepository.clockIn(
      buildingId: data,
      id: prefs.getString("user-id") ?? "",
      long: "11.5170657",
      lat: "3.8727566",
    );
    r.then((result) {
      result.fold(
        (failure) {
          // Get.rawSnackbar(
          //   message: "you can make clock in at your position",
          //   backgroundColor: Colors.red,
          //   snackPosition: SnackPosition.TOP,
          // );
        },
        (success) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Clock In',
            message: 'Clocked In Successfully',
            backgroundColor: AppColor.greenColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.004,
            margin: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
          );
        },
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur inattendue')),
      );
    });
    loader.value = false;
    // } else {
    //   loader.value = true;
    //   Location location = Location();

    //   bool? _serviceEnabled;
    //   PermissionStatus? _permissionGranted;
    //   LocationData? _locationData;

    //   _serviceEnabled = await location.serviceEnabled();
    //   if (!_serviceEnabled) {
    //     _serviceEnabled = await location.requestService();
    //     if (!_serviceEnabled) {
    //       return;
    //     }
    //   }
    //   _permissionGranted = await location.hasPermission();
    //   if (_permissionGranted == PermissionStatus.denied) {
    //     _permissionGranted = await location.requestPermission();
    //     if (_permissionGranted != PermissionStatus.granted) {
    //       return;
    //     }
    //   }
    //   _locationData = await location.getLocation();
    //   double lat = _locationData.latitude ?? 0;
    //   double long = _locationData.longitude ?? 0;
    //   // UserService userService = UserService();
    //   var r = attendanceRepository.clockIn(
    //     buildingId: data,
    //     id: prefs.getString("user-id"),
    //     long: long.toString(),
    //     lat: lat.toString(),
    //   );
    //   r.then((result) {
    //     result.fold(
    //       (failure) {
    //         // Get.rawSnackbar(
    //         //   message: "you can make clock in at your position",
    //         //   backgroundColor: Colors.red,
    //         //   snackPosition: SnackPosition.TOP,
    //         // );
    //       },
    //       (success) {
    //         Get.rawSnackbar(
    //           snackPosition: SnackPosition.TOP,
    //           title: 'Clock In',
    //           message: 'Clocked In Successfully',
    //           backgroundColor: AppColor.greenColor.withOpacity(.9),
    //           maxWidth: ScreenSize(context!).mainWidth / 1.004,
    //           margin: const EdgeInsets.only(
    //             bottom: 20,
    //             left: 20,
    //             right: 20,
    //           ),
    //         );
    //       },
    //     );
    //   }).catchError((error) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Erreur inattendue')),
    //     );
    //   });
    //   loader.value = false;
    // }
  }

  clockOutUpdate(context) async {
    // UserService userService = UserService();
    var r = attendanceRepository.clockOut(id: prefs.getString("user-id") ?? "");
    r.then((result) {
      result.fold(
        (failure) {
          Get.rawSnackbar(
            message: "Something wrong",
            backgroundColor: Colors.red,
            snackPosition: SnackPosition.TOP,
          );
        },
        (success) {
          Get.rawSnackbar(
            snackPosition: SnackPosition.TOP,
            title: 'Clock Out',
            message: 'Clocked Out Successfully',
            backgroundColor: AppColor.greenColor.withOpacity(.9),
            maxWidth: ScreenSize(context!).mainWidth / 1.004,
            margin: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
            ),
          );
        },
      );
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur inattendue')),
      );
    });
    loader.value = false;
  }
}
