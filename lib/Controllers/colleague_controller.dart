// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:visitor_pass/Models/employee_model.dart';
// import 'package:visitor_pass/Services/api-list.dart';

// import '../Services/server.dart';

// class CollegueController extends GetxController {
//   Server server = Server();

//   RxBool isLoadingGetColleagueList = false.obs;
//   var colleagueList = <EmployeeModel>[];

//   // @override
//   // void onInit() {
//   //   super.onInit();
//   //   getColleaugue();
//   // }

//   getColleaugueList() {
//     if (isLoadingGetColleagueList.value) return;
//     isLoadingGetColleagueList.value = true;
//     try {
//       server.getRequest(endPoint: APIList.getEmployeeList).then(
//         (response) {
//           isLoadingGetColleagueList.value = false;
//           if (response != null && response.statusCode == 200) {
//             colleagueList = [];
//             for (var el in json.decode(response.body)['data']) {
//               colleagueList.add(EmployeeModel.fromJson(el));
//             }
//           }
//         },
//       );
//     } catch (e) {
//     }
//   }
// }
