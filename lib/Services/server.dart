import 'dart:convert';
// import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import '/Services/api-list.dart';

class Server {
  static String? bearerToken;

  static initClass({String? token}) {
    bearerToken = token!;
  }

  Future<dynamic> getRequest({String? endPoint}) async {
    // HttpClient client = HttpClient();
    try {
      // client.badCertificateCallback =
      //     ((X509Certificate cert, String host, int port) => true);
      // return await http.get(Uri.parse(endPoint!), headers: _getHttpHeaders(),);
      return await http.get(
        Uri.parse(endPoint!),
        headers: _getHttpHeaders(),
      );
    } catch (error) {
      return null;
    } finally {
      // client.close();
    }
  }

  // Future<dynamic> getRequestNotToken({String? endPoint}) async {
  //   HttpClient client = HttpClient();
  //   try {
  //     client.badCertificateCallback =
  //         ((X509Certificate cert, String host, int port) => true);
  //     return await http.get(Uri.parse(endPoint!),
  //         headers: _getHttpHeadersNotToken());
  //   } catch (error) {
  //     return null;
  //   } finally {
  //     client.close();
  //   }
  // }

  // Future<dynamic> getRequestSettings(endPoint) async {
  //   HttpClient client = HttpClient();
  //   try {
  //     return await http.get(Uri.parse(APIList.server! + endPoint!),
  //         headers: getAuthHeaders());
  //   } catch (error) {
  //     return null;
  //   } finally {
  //     client.close();
  //   }
  // }

  // Future<dynamic> getRequestWithParam(
  //     {String? endPoint, var categoryId, bool? forCheckIn}) async {
  //   HttpClient client = HttpClient();
  //   try {
  //     client.badCertificateCallback =
  //         ((X509Certificate cert, String host, int port) => true);
  //     return await http.get(
  //       Uri.parse(forCheckIn ?? false
  //           ? endPoint!
  //           : "${APIList.server!}$categoryId/show"),
  //       headers: _getHttpHeaders(),
  //     );
  //   } catch (error) {
  //     return null;
  //   } finally {
  //     client.close();
  //   }
  // }

  Future<dynamic> postRequest({
    required String endPoint,
    String? body,
    bool withHeader = true,
  }) async {
    try {
      Dio dio = Dio(
        BaseOptions(
          validateStatus: (_) => true, 
        ),
      );

      
      dio.interceptors.add(
        LogInterceptor(
          responseBody: true,
          requestBody: true,
          logPrint: (obj) => debugPrint(obj.toString()),
        ),
      );

      // Définir les bons headers
      final headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
      };

      final response = await dio.post(
        endPoint,
        data: body,
        options: Options(
          headers: headers,
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      );

      // Log du status
      debugPrint("Status Code: ${response.statusCode}");

      // Retourne la data ou null si erreur
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return response.data;
      } else {
        debugPrint(
            "Request failed: ${response.statusCode} ${response.statusMessage}");
        return null;
      }
    } on DioException catch (e) {
      debugPrint("DioException: ${e.message}");
      debugPrint("Status Code: ${e.response?.statusCode}");
      debugPrint("Response data: ${e.response?.data}");
      return null;
    } catch (e) {
      debugPrint("Unexpected error: $e");
      return null;
    }
  }

  // Future<dynamic> postRequestWithToken({String? endPoint, String? body}) async {
  //   // HttpClient client = HttpClient();
  //   try {
  //     // client.badCertificateCallback =
  //     //     ((X509Certificate cert, String host, int port) => true);
  //     return await http.post(
  //       Uri.parse(endPoint!),
  //       headers: _getHttpHeaders(),
  //       body: body,
  //     );
  //   } catch (error) {
  //     return null;
  //   } finally {
  //     // client.close();
  //   }
  // }

  // Future<dynamic> postRequestWithTokenFormData(
  //     {String? endPoint, required Map<String, String> formData}) async {
  //   Map<String, String> headers = {
  //     'Authorization': bearerToken!,
  //     'Content-Type': 'multipart/form-data',
  //   };
  //   // HttpClient client = HttpClient();
  //   try {
  //     // client.badCertificateCallback =
  //     //     ((X509Certificate cert, String host, int port) => true);

  //     var request = http.MultipartRequest('POST', Uri.parse(endPoint!));
  //     request.headers.addAll(headers);

  //     formData.forEach((key, value) {
  //       request.fields[key] = value;
  //     });

  //     var streamedResponse = await request.send();
  //     var response = await http.Response.fromStream(streamedResponse);

  //     return response;
  //   } catch (error) {
  //     print("Error: $error");
  //     return null;
  //   } finally {
  //     // client.close();
  //   }
  // }

  // Future<dynamic> putRequest({String? endPoint, String? body}) async {
  //   // HttpClient client = HttpClient();
  //   try {
  //     // client.badCertificateCallback =
  //     //     ((X509Certificate cert, String host, int port) => true);
  //     return await http.put(Uri.parse(endPoint!),
  //         headers: _getHttpHeaders(), body: body);
  //   } catch (error) {
  //     return null;
  //   } finally {
  //     // client.close();
  //   }
  // }

  Future<dynamic> multipartRequest({endPoint, String? filepath}) async {
    Map<String, String> headers = {
      'Authorization': bearerToken!,
      'Content-Type': 'multipart/form-data',
    };

    // HttpClient client = HttpClient();
    try {
      var request;

      request = http.MultipartRequest('POST', Uri.parse(endPoint!))
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('face', filepath!));
      final res = await request.send();
      var response = await http.Response.fromStream(res);
      return response;
    } catch (error) {
      print(error);
      return null;
    } finally {
      // client.close();
    }
  }

  // Future<dynamic> getRequestParam({String? endPoint, body}) async {
  //   // HttpClient client = HttpClient();
  //   var uri =
  //       Uri.https(APIList.apiUrl!, APIList.apiEndPoint! + endPoint!, body);
  //   try {
  //     return await http.get(uri, headers: _getHttpHeaders());
  //   } catch (error) {
  //     return null;
  //   } finally {
  //     // client.close();
  //   }
  // }

  // Future<dynamic> deleteRequest({String? endPoint}) async {
  //   // HttpClient client = HttpClient();
  //   try {
  //     // client.badCertificateCallback =
  //     //     ((X509Certificate cert, String host, int port) => true);
  //     return await http.delete(Uri.parse(endPoint!),
  //         headers: _getHttpHeaders());
  //   } catch (error) {
  //     return null;
  //   } finally {
  //     // client.close();
  //   }
  // }

  static Map<String, String> _getHttpHeaders() {
    Map<String, String> headers = new Map<String, String>();
    headers['Authorization'] = bearerToken!;
    headers['Content-type'] = 'application/json';
    return headers;
  }

  // static Map<String, String> _getHttpHeadersNotToken() {
  //   Map<String, String> headers = new Map<String, String>();
  //   headers['Content-Type'] = 'application/json; charset=UTF-8';
  //   // headers['Accept'] = '*/*';?
  //   return headers;
  // }

  // static Map<String, String> getAuthHeaders() {
  //   Map<String, String> headers = new Map<String, String>();
  //   headers['Content-Type'] = 'application/json; charset=UTF-8';

  //   return headers;
  // }

  // Future<DateTime> getDateTime() async {
  //   try {
  //     final response = await http.get(Uri.parse(APIList.getDateTime!));
  //     final date = json.decode(response.body)['datetime'];
  //     return DateTime.parse(date);
  //   } catch (error) {
  //     return DateTime.now();
  //   }
  // }
}
