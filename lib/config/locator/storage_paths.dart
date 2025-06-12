// // import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:injectable/injectable.dart';

// @singleton
// @preResolve
// class DeviceStorage {
//   static late final String appDocsDirPath;
//   static late final String tempDirPath;
//   static late final String mediaDirPath;

//   DeviceStorage._();

//   @factoryMethod
//   static Future<DeviceStorage> init() async {
//     // appDocsDirPath = (await getApplicationDocumentsDirectory()).path;
//     // tempDirPath = (await getTemporaryDirectory()).path;
//     // mediaDirPath = await initMediaDir();
//      appDocsDirPath = "";
//     tempDirPath = "";
//     mediaDirPath = "";
//     return DeviceStorage._();
//   }

//   static Future<String> initMediaDir() async {
//     // final dir = Directory("$appDocsDirPath/media");
//     // if (!(await dir.exists())) {
//     //   await dir.create(recursive: true);
//     // }
//     return "";
//   }

//   static String getMediaFilePath(String fileName) {
//     return "$mediaDirPath/$fileName";
//   }

//   static String getTempFilePath(String fileName) {
//     return "$tempDirPath/$fileName";
//   }
// }
