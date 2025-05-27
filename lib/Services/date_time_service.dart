import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:visitor_pass/Services/api-list.dart';

class DateTimeService {
  static final DateTimeService instance = DateTimeService._internal();
  static bool _getRightTime = false;

  DateTimeService._internal();

  factory DateTimeService() {
    return instance;
  }

  Future<void> init() async {
    // final response = await http.get(Uri.parse(APIList.getDateTime!));
    // final date = json.decode(response.body)['datetime'];
    // int difference = DateTime.parse(date).difference(DateTime.now()).inMinutes;
    // if (difference <= 1) {
    //   _getRightTime = true;
    // }
  }

  Future<DateTime> getDateTime() async {
    // if (_getRightTime) {
      return DateTime.now();
    // } else {
    //   final response = await http.get(Uri.parse(APIList.getDateTime!));
    //   final date = json.decode(response.body)['datetime'];
    //   return DateTime.parse(date);
    // }
  }
}
