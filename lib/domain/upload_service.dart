import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:visitor_pass/Services/api-list.dart';
import 'package:visitor_pass/main.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:http/http.dart' as http;

class UploadService {
  static Future<void> upload({
    required String taskId,
    required Uint8List bytes,
    required String fileName,
    required String path,
    required void Function(String url) onUploadDone,
    required void Function() onUploadError,
  }) async {
    String token = prefs.getString('token') ?? '';
    final url = "${APIList.server}$path";
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll({
        'Authorization': token,
        'Content-Type': 'multipart/form-data',
      });
      request.files.add(
        http.MultipartFile.fromBytes('file', bytes, filename: fileName),
      );
      var response = await request.send();
      if (response.statusCode == 200) {
        final respStr = await response.stream.bytesToString();
        var imageUrl = jsonDecode(respStr)['file_url'];
        onUploadDone(imageUrl);
      } else {
        onUploadError();
      }
    } catch (e) {
      onUploadError();
    }
  }
}
