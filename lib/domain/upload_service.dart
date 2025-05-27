import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:visitor_pass/Services/api-list.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:http/http.dart' as http;

class UploadService {
  // final Map<String, UploadTask> _uploadTasks = {};
  // static UploadService instance = UploadService();

  static bool trustSelfSigned = true;

  static HttpClient getHttpClient() {
    HttpClient httpClient = HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback =
          ((X509Certificate cert, String host, int port) => trustSelfSigned);

    return httpClient;
  }

  static Future<void> upload({
    required String taskId,
    required File file,
    required String path,
    required void Function(String url) onUploadDone,
    required void Function() onUploadError,
  }) async {
    String token = box.read('token');
    Map<String, String> headers = {
      'Authorization': token,
      'Content-Type': 'multipart/form-data',
    };
    final url = "${APIList.server}$path";

    final httpClient = getHttpClient();

    final request = await httpClient.postUrl(Uri.parse(url));

    var multipart = await http.MultipartFile.fromPath('file', file.path);

    var requestMultipart = http.MultipartRequest("POST", Uri.parse(url));
    requestMultipart.headers.addAll(headers);
    requestMultipart.files.add(multipart);

    var msStream = requestMultipart.finalize();

    var totalByteLength = requestMultipart.contentLength;

    request.contentLength = totalByteLength;

    request.headers.set(HttpHeaders.contentTypeHeader,
        requestMultipart.headers[HttpHeaders.contentTypeHeader]!);

    Stream<List<int>> streamUpload = msStream.transform(
      StreamTransformer.fromHandlers(
        // handleData: (data, sink) {
        //   sink.add(data);
        //   setState(() {
        //     _uploadProgress += (data.length);
        //   });
        // },
        handleError: (error, stack, sink) {
          onUploadError();
          throw error;
        },
        handleDone: (sink) {
          sink.close();
          // setState(() {
          //   _isUploading = false;
          // });
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();
    var statusCode = httpResponse.statusCode;
    final responseBody = await httpResponse.transform(utf8.decoder).join();
    if (statusCode == 200) {
      var imageUrl = jsonDecode(responseBody)['file_url'];
      onUploadDone(imageUrl);
    } else {}
  }

  // static Future<void> cancelUpload(String taskId) async {
  //   final task = instance._uploadTasks[taskId];
  //   if (task == null) return;

  //   await task.cancel();
  //   instance._uploadTasks.remove(taskId);
  // }

  // static Stream<TaskSnapshot>? getUploadStream(String taskId) {
  //   final task = instance._uploadTasks[taskId];
  //   if (task == null) return null;

  //   return task.snapshotEvents;
  // }
}
