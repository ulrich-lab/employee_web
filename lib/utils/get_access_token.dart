// import 'package:shared_preferences/shared_preferences.dart';

// Future<String?> getAccessToken() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String accessToken = prefs.getString('access_token') ?? '';
//   return accessToken.isNotEmpty ? "Bearer $accessToken" : null;
// }

// Future<void> saveAccessToken(String token) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//  await prefs.setString('access_token', token);
// }

// Future<void> saveAsSeen() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//  await prefs.setString('yes', 'yes');
// }

// Future<String?> getAsSeen() async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   String accessToken = prefs.getString('yes') ?? '';
//   return accessToken.isNotEmpty ? accessToken: null;
// }
