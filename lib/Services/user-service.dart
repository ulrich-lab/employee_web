// import 'package:shared_preferences/shared_preferences.dart';
// import '/services/server.dart';

// class UserService {
//   SharedPreferences? prefs;
//   Server server = Server();

//   saveString({String? key, String? value}) async {
//     prefs = await SharedPreferences.getInstance();
//     return await prefs!.setString(key!, value!);
//   }

//   Future<String> getString(String key) async {
//     prefs = await SharedPreferences.getInstance();
//     return await prefs!.getString(key) ?? "";
//   }

//   saveBoolean({required String key, required bool value}) async {
//     prefs = await SharedPreferences.getInstance();
//     prefs!.setBool(key, value);
//   }

//   loginCheck() async {
//     prefs = await SharedPreferences.getInstance();
//     print(prefs!.getBool('is-user'));
//     if (prefs!.getBool('is-user') != null) {
//       return prefs!.getBool('is-user');
//     } else {
//       return false;
//     }
//   }

//   Future<bool?> getBool() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     bool? b = prefs.getBool('is-user');
//     print('kkokokkokokokokok');
//     print(b);
//     return b;
//   }

//   getUserId() async {
//     prefs = await SharedPreferences.getInstance();
//     if (prefs!.getString('user-id') != null) {
//       return prefs!.getString('user-id').toString();
//     } else {
//       return null;
//     }
//   }

//   getEmployeeId() async {
//     prefs = await SharedPreferences.getInstance();
//     if (prefs!.getString('employee_id') != null) {
//       return prefs!.getString('employee_id').toString();
//     } else {
//       return null;
//     }
//   }

//   getToken() async {
//     prefs = await SharedPreferences.getInstance();
//     if (prefs!.getString('token') != null) {
//       String? token = prefs!.getString('token');
//       return "Bearer " + token!;
//     } else {
//       return null;
//     }
//   }

//   removeSharedPreferenceData() async {
//     prefs = await SharedPreferences.getInstance();
//     prefs!.remove('is-user');
//     prefs!.remove('user-id');
//     prefs!.remove('token');
//     prefs!.remove('profile');
//     //
//     prefs!.remove('employee_id');
//     prefs!.remove('email');
//     prefs!.remove('image');
//     prefs!.remove('name');
//     prefs!.remove('phone');

//   }
// }
