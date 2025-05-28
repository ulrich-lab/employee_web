import 'dart:async';
import 'dart:convert';
// import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:visitor_pass/Controllers/permission_controller.dart';
import 'package:visitor_pass/Services/api-list.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:mime/mime.dart';
import 'package:http/http.dart' as http;

class PermissionScreen extends StatefulWidget {
  @override
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  final PermissionController permissionController =
      Get.put(locator<PermissionController>());

  String _hoursOrDays = 'Jours/Mois';
  DateTime? _startDate;
  DateTime? _endDate;
  // TextEditingController _reasonController = TextEditingController();

  String _descriptionText = '';
  // TextEditingController _descriptionController = TextEditingController();
  // File? _selectedFile;
  bool _isUploading = false;
  double _uploadProgress = 0.0;
  bool _isImage = false;
  // String? imageUrl;

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

  // void _selectFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     File file = File(result.files.single.path!);
  //     String? mimeType = lookupMimeType(file.path);
  //     bool isImage = mimeType?.startsWith("image/") ?? false;

  //     setState(() {
  //       _selectedFile = file;
  //       _isImage = isImage;
  //       _fileUploadMultipart(file: file);
  //     });
  //   }
  // }

  // Future<void> _uploadFile() async {
  //   setState(() {
  //     _isUploading = true;
  //     _uploadProgress = 0.0;
  //   });

  //   for (int i = 1; i <= 10; i++) {
  //     await Future.delayed(Duration(milliseconds: 200));
  //     setState(() {
  //       _uploadProgress = i / 10;
  //     });
  //   }

  //   setState(() {
  //     _isUploading = false;
  //   });
  // }
  bool trustSelfSigned = true;

  // HttpClient getHttpClient() {
  //   HttpClient httpClient = HttpClient()
  //     ..connectionTimeout = const Duration(seconds: 10)
  //     ..badCertificateCallback =
  //         ((X509Certificate cert, String host, int port) => trustSelfSigned);

  //   return httpClient;
  // }

  // Future<void> _fileUploadMultipart({required File file}) async {
  //   setState(() {
  //     _isUploading = true;
  //     _uploadProgress = 0.0;
  //   });
  //   // UserService userService = UserService();
  //   String token = box.read('token');
  //   Map<String, String> headers = {
  //     'Authorization': token,
  //     'Content-Type': 'multipart/form-data',
  //   };
  //   final url = "${APIList.server}/api/v1/upload-file?upload_type=local";

  //   final httpClient = getHttpClient();

  //   final request = await httpClient.postUrl(Uri.parse(url));

  //   var multipart = await http.MultipartFile.fromPath('file', file.path);

  //   var requestMultipart = http.MultipartRequest("POST", Uri.parse(url));
  //   requestMultipart.headers.addAll(headers);
  //   requestMultipart.files.add(multipart);

  //   var msStream = requestMultipart.finalize();

  //   var totalByteLength = requestMultipart.contentLength;

  //   request.contentLength = totalByteLength;

  //   request.headers.set(HttpHeaders.contentTypeHeader,
  //       requestMultipart.headers[HttpHeaders.contentTypeHeader]!);

  //   Stream<List<int>> streamUpload = msStream.transform(
  //     StreamTransformer.fromHandlers(
  //       handleData: (data, sink) {
  //         sink.add(data);
  //         setState(() {
  //           _uploadProgress += (data.length);
  //         });
  //       },
  //       handleError: (error, stack, sink) {
  //         setState(() {
  //           _isUploading = false;
  //         });
  //         throw error;
  //       },
  //       handleDone: (sink) {
  //         sink.close();
  //         setState(() {
  //           _isUploading = false;
  //         });
  //       },
  //     ),
  //   );

  //   await request.addStream(streamUpload);

  //   final httpResponse = await request.close();
  //   var statusCode = httpResponse.statusCode;
  //   final responseBody = await httpResponse.transform(utf8.decoder).join();

  //   if (statusCode == 200) {
  //     setState(() {
  //       imageUrl = jsonDecode(responseBody)['file_url'];
  //     });
  //   } else {}
  // }

  // void _cancelUpload() {
  //   setState(() {
  //     _selectedFile = null;
  //     _isUploading = false;
  //     _uploadProgress = 0.0;
  //   });
  // }

  bool _validateFields() {
    return _startDate != null &&
        _endDate != null &&
        _descriptionText.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ScreenUtil().screenWidth > 640
          ? null
          : AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
              leading: Container(
                margin: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.close,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
              ),
              title: Text(
                'Permission',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Flexible(
                flex: 7,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        Images.backArrow,
                        height: 24,
                        width: 24,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    // DropdownButton for Heure / Jours/Mois
                    SizedBox(height: 25.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: DropdownButton<String>(
                        value: _hoursOrDays,
                        isExpanded: true,
                        underline: SizedBox(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _hoursOrDays = newValue!;
                            _startDate = null;
                            _endDate = null;
                          });
                        },
                        items: <String>['Heure', 'Jours/Mois']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context, true),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Date de debut',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                _startDate == null
                                    ? 'Selectionner'
                                    : _hoursOrDays == 'Heure'
                                        ? DateFormat.Hm().format(_startDate!)
                                        : DateFormat.yMd().format(_startDate!),
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context, false),
                            child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: 'Date de fin',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                _endDate == null
                                    ? 'Selectionner'
                                    : _hoursOrDays == 'Heure'
                                        ? DateFormat.Hm().format(_endDate!)
                                        : DateFormat.yMd().format(_endDate!),
                                style: TextStyle(
                                  color: AppColor.primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50.h),

                    // Obx(() {
                    //   print(
                    //       "========${permissionController.reasonList.length}");
                    //   return Padding(
                    //     padding: const EdgeInsets.symmetric(vertical: 8.0),
                    //     child: Container(
                    //       height: 48,
                    //       width: double.infinity,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           width: 1,
                    //           color: AppColor.borderColor,
                    //         ),
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //       child: ButtonTheme(
                    //         alignedDropdown: true,
                    //         child: DropdownButtonHideUnderline(
                    //           child: DropdownButton(
                    //               padding: EdgeInsets.only(right: 5),
                    //               icon: SvgPicture.asset(
                    //                 Images.down,
                    //                 height: 8,
                    //                 width: 8,
                    //               ),
                    //               borderRadius: const BorderRadius.all(
                    //                   Radius.circular(5)),
                    //               isExpanded: true,
                    //               menuMaxHeight:
                    //                   ScreenSize(context).mainHeight / 3,
                    //               items: permissionController.reasonList
                    //                   .map(
                    //                     (el) => DropdownMenuItem(
                    //                         child: Text(
                    //                           el,
                    //                           style: TextStyle(
                    //                             color: Colors.black,
                    //                             fontWeight: FontWeight.w500,
                    //                           ),
                    //                         ),
                    //                         value: el),
                    //                   )
                    //                   .toList(),
                    //               value:
                    //                   permissionController.currentReason.value,
                    //               onChanged: (String? newValue) {
                    // permissionController.currentReason.value =
                    //     newValue ?? "SICK";

                    //                 (context as Element).markNeedsBuild();
                    //               }),
                    //         ),
                    //       ),
                    //     ),
                    //   );
                    // }),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      padding: EdgeInsets.all(8),
                      child: TextField(
                        // controller: _descriptionController,
                        // maxLines: 7,
                        decoration: InputDecoration(
                          labelText: 'Motif',
                          // label: Padding(
                          //   padding: EdgeInsets.symmetric(
                          //       vertical: 12.w, horizontal: 8.h),
                          //   child: Text("Description....."),
                          // ),
                          border: InputBorder.none,
                          labelStyle: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        onChanged: (text) {
                          permissionController.currentReason.value = text;
                        },
                      ),
                    ),

                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              // controller: _descriptionController,
                              maxLines: 7,
                              decoration: InputDecoration(
                                labelText: 'Description...',
                                // label: Padding(
                                //   padding: EdgeInsets.symmetric(
                                //       vertical: 12.w, horizontal: 8.h),
                                //   child: Text("Description....."),
                                // ),
                                border: InputBorder.none,
                                labelStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              onChanged: (text) {
                                setState(() {
                                  _descriptionText = text;
                                });
                              },
                            ),
                          ),
                          // Container(
                          //   width: double.infinity,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                               
                          //       SizedBox(),
                          //       _selectedFile != null
                          //           ? IconButton(
                          //               onPressed: () {
                          //                 setState(() {
                          //                   _selectedFile = null;
                          //                 });
                          //               },
                          //               icon: Icon(
                          //                 Icons.delete_outlined,
                          //                 color: Colors.grey,
                          //               ),
                          //             )
                          //           : IconButton(
                          //               onPressed: _selectFile,
                          //               icon: Icon(
                          //                 Icons.attach_file,
                          //                 color: Colors.grey,
                          //               ),
                          //             ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text('Annuler'),
                        ),
                        SizedBox(width: 12.w),
                        Obx(() {
                          return Expanded(
                            child: ElevatedButton(
                              onPressed: _validateFields()
                                  ? permissionController
                                          .isLoadingInsertLeave.value
                                      ? null
                                      : () {
                                          permissionController.insertLeave(
                                            comment: _descriptionText,
                                            start_date: _startDate.toString(),
                                            end_date: _endDate.toString(),
                                            leave_type: "OTHER",
                                            file_url: null,
                                            onSuccess: () async {
                                              await Get.rawSnackbar(
                                                message:
                                                    "Permission Envoyee avec success",
                                                backgroundColor: Colors.green,
                                                snackPosition:
                                                    SnackPosition.TOP,
                                              );
                                            },
                                          );
                                        }
                                  : null,
                              style: _validateFields()
                                  ? ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor)
                                  : null,
                              child: permissionController
                                      .isLoadingInsertLeave.value
                                  ? SizedBox(
                                      width: ScreenUtil().screenWidth > 640
                                          ? 5.w
                                          : 30.w,
                                      height: ScreenUtil().screenWidth > 640
                                          ? 5.w
                                          : 30.w,
                                      child: CircularProgressIndicator.adaptive(
                                        backgroundColor: Colors.white,
                                      ),
                                    )
                                  : Text('Envoyer'), //irgQ4pGaMd#qHydK+OUbU9S
                            ),
                          );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar:
    );
  }
}
