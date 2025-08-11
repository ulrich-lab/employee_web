import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/Models/attendance_model.dart';
import 'package:visitor_pass/domain/attendance_repository.dart';
import 'package:visitor_pass/main.dart';

import '../constants/constants.dart';
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
    // loader.value = true;
    // var r = attendanceRepository.clockIn(
    //   buildingId: data,
    //   id: prefs.getString("user-id") ?? "",
    //   long: "11.5170657",
    //   lat: "3.8727566",
    // );
    // r.then((result) {
    //   result.fold(
    //     (failure) {
    //       // Get.rawSnackbar(
    //       //   message: "you can make clock in at your position",
    //       //   backgroundColor: Colors.red,
    //       //   snackPosition: SnackPosition.TOP,
    //       // );
    //     },
    //     (success) {
    //       Get.rawSnackbar(
    //         snackPosition: SnackPosition.TOP,
    //         title: 'Clock In',
    //         message: 'Clocked In Successfully',
    //         backgroundColor: AppColor.greenColor.withOpacity(.9),
    //         maxWidth: ScreenSize(context!).mainWidth / 1.004,
    //         margin: const EdgeInsets.only(
    //           bottom: 20,
    //           left: 20,
    //           right: 20,
    //         ),
    //       );
    //     },
    //   );
    // }).catchError((error) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Erreur inattendue')),
    //   );
    // });
    // loader.value = false;

    loader.value = true;
    Position position =await _determinePosition();
    // UserService userService = UserService();
    var r = attendanceRepository.clockIn(
      buildingId: data,
      id: prefs.getString("user-id") ?? "",
      long: position.longitude.toString(),
      lat: position.latitude.toString(),
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

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
