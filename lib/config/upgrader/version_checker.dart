// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:package_info_plus/package_info_plus.dart';
// import 'package:visitor_pass/Services/api-list.dart';
// import 'package:wakelock_plus/wakelock_plus.dart';
// import 'package:r_upgrade/r_upgrade.dart';

// enum UpgradeMethod {
//   all,
//   hot,
//   increment,
// }

// class VersionChecker extends StatefulWidget {
//   final Widget child;

//   const VersionChecker({super.key, required this.child});
//   @override
//   State<VersionChecker> createState() => _VersionCheckerState();
// }

// class _VersionCheckerState extends State<VersionChecker> {
//   UpgradeMethod? upgradeMethod;

//   int? id;

//   RUpgradeInstallType installType = RUpgradeInstallType.normal;

//   NotificationVisibility notificationVisibility =
//       NotificationVisibility.VISIBILITY_VISIBLE;

//   NotificationStyle notificationStyle = NotificationStyle.planTime;

//   bool compareVersion(String v1, String v2) {
//     List<String> v1Parts = v1.split('.');
//     List<String> v2Parts = v2.split('.');

//     int maxLength =
//         v1Parts.length > v2Parts.length ? v1Parts.length : v2Parts.length;

//     for (int i = 0; i < maxLength; i++) {
//       int v1Part = i < v1Parts.length ? int.parse(v1Parts[i]) : 0;
//       int v2Part = i < v2Parts.length ? int.parse(v2Parts[i]) : 0;

//       if (v1Part > v2Part) {
//         return false; // v1 est supérieur à v2
//       } else if (v1Part < v2Part) {
//         return true; // v1 est inférieur à v2
//       }
//     }
//     return false; // Les versions sont égales
//   }

//   Future<void> _checkForUpdates(BuildContext context) async {
//     PackageInfo packageInfo = await PackageInfo.fromPlatform();
//     String version = packageInfo.version;

//     try {
//       final response =
//           await http.get(Uri.parse("${APIList.server}/api/v1/get-app"));
//       if (response.statusCode == 200) {
//         final resVersion = json.decode(response.body)['version'];

//         if (compareVersion(version, resVersion)) {
//           _showUpdateDialog(context, json.decode(response.body)['url'],
//               json.decode(response.body)['name']);
//         }
//       } else {
//         throw Exception('Failed to check version');
//       }
//     } catch (e) {
//       // ScaffoldMessenger.of(context).showSnackBar(
//       //   SnackBar(content: Text('Error checking for updates: $e')),
//       // );
//     }
//   }

//   void _showUpdateDialog(BuildContext context, link, name) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Télécharger la nouvelle version'),
//           content: _buildDownloadWindow(),
//           actions: [
//             id == null
//                 ? TextButton(
//                     onPressed: () async {
//                       Navigator.of(context).pop();
//                       await _downloadAndInstallUpdate(context, link, name);
//                     },
//                     child: const Text('Nouvelle version disponible'),
//                   )
//                 : StreamBuilder(
//                     stream: RUpgrade.stream,
//                     builder: (BuildContext context,
//                         AsyncSnapshot<DownloadInfo> snapshot) {
//                       if (snapshot.hasData) {
//                         return Text(snapshot.data!.status ==
//                                 DownloadStatus.STATUS_RUNNING
//                             ? "Downloading..."
//                             : snapshot.data!.status ==
//                                     DownloadStatus.STATUS_SUCCESSFUL
//                                 ? 'Installer la nouvelle version'
//                                 : 'Failed try again');
//                       } else {
//                         return const Text("Loading....");
//                       }
//                     },
//                   ),
//           ],
//         );
//       },
//     );
//   }

//   Future<void> _downloadAndInstallUpdate(
//       BuildContext context, link, name) async {
//     WakelockPlus.enable();

//     try {
//       if (id == null) {
//         if (upgradeMethod != null) {
//           ScaffoldMessenger.of(context)
//               .showSnackBar(SnackBar(content: Text(getUpgradeMethod())));
//           return;
//         }
//         id = await RUpgrade.upgrade(
//           link,
//           fileName: '$name.apk',
//           installType: installType,
//           notificationStyle: notificationStyle,
//           notificationVisibility: notificationVisibility,
//           useDownloadManager: false,
//         );
//         upgradeMethod = UpgradeMethod.all;
//         setState(() {});
//       } else {
//         installUpdate();
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//       WakelockPlus.disable();
//     }
//   }

//   Widget _buildDownloadWindow() => Container(
//         height: 100,
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         decoration: BoxDecoration(
//           color: Colors.grey[200],
//         ),
//         child: id != null
//             ? StreamBuilder(
//                 stream: RUpgrade.stream,
//                 builder: (BuildContext context,
//                     AsyncSnapshot<DownloadInfo> snapshot) {
//                   if (snapshot.hasData) {
//                     return Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: <Widget>[
//                         SizedBox(
//                           height: 75,
//                           width: 75,
//                           child: CircleDownloadWidget(
//                             backgroundColor: snapshot.data!.status ==
//                                     DownloadStatus.STATUS_SUCCESSFUL
//                                 ? Colors.green
//                                 : null,
//                             progress: snapshot.data!.percent! / 100,
//                             child: Center(
//                               child: Text(
//                                 snapshot.data!.status ==
//                                         DownloadStatus.STATUS_RUNNING
//                                     ? snapshot.data!.getSpeedString()
//                                     : getStatus(snapshot.data!.status),
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   } else {
//                     return const SizedBox(
//                       width: 60,
//                       height: 60,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2,
//                       ),
//                     );
//                   }
//                 },
//               )
//             : const Text(
//                 'Une nouvelle version est disponible. Voulez-vous la télécharger ?'),
//       );

//   String getStatus(DownloadStatus? status) {
//     if (status == DownloadStatus.STATUS_FAILED) {
//       id = null;
//       upgradeMethod = null;
//       return "Download_failed";
//     } else if (status == DownloadStatus.STATUS_PAUSED) {
//       return "Download_the_suspended";
//     } else if (status == DownloadStatus.STATUS_PENDING) {
//       return "Access_to_resources";
//     } else if (status == DownloadStatus.STATUS_RUNNING) {
//       return "In_the_download";
//     } else if (status == DownloadStatus.STATUS_SUCCESSFUL) {
//       return "Download successful";
//     } else if (status == DownloadStatus.STATUS_CANCEL) {
//       id = null;
//       upgradeMethod = null;
//       return "Download_the_cancel";
//     } else {
//       id = null;
//       upgradeMethod = null;
//       return "The_unknown";
//     }
//   }

//   String getUpgradeMethod() {
//     switch (upgradeMethod) {
//       case UpgradeMethod.all:
//         return "Are_already_starting_to_all_updates";
//       case UpgradeMethod.hot:
//         return "Have_begun_to_hot_update";
//       case UpgradeMethod.increment:
//         return "Has_already_started_to_incremental_updates";
//       default:
//         break;
//     }
//     return '';
//   }

//   String getUpgradeMethodName() {
//     switch (upgradeMethod) {
//       case UpgradeMethod.all:
//         return "Full_quantity_update";
//       case UpgradeMethod.hot:
//         return "Hot_update";
//       case UpgradeMethod.increment:
//         return "Incremental_updating";
//       default:
//         break;
//     }
//     return '';
//   }

//   @override
//   void initState() {
//     RUpgrade.setDebug(true);
//     waitTime;
//     _checkForUpdates(context);
//     super.initState();
//   }

//   void waitTime() async {
//     await Future.delayed(Duration(seconds: 2));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return widget.child;
//   }

//   Future<void> installUpdate() async {
//     if (upgradeMethod != UpgradeMethod.all && upgradeMethod != null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please_make_(${getUpgradeMethodName()}'),
//         ),
//       );
//       return;
//     }
//     if (id == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text("Currently_there_is_no_ID_can_be_installed")));
//       return;
//     }
//     final status = await RUpgrade.getDownloadStatus(id!);

//     if (status == DownloadStatus.STATUS_SUCCESSFUL) {
//       bool? isSuccess = await RUpgrade.install(id!, installType: installType);
//       if (isSuccess != null && isSuccess) {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("The_request_is_successful")));
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("The_current_ID_not_download")));
//     }
//   }
// }

// class CircleDownloadWidget extends StatelessWidget {
//   final double? progress;
//   final Widget? child;
//   final Color? backgroundColor;

//   const CircleDownloadWidget(
//       {Key? key, this.progress, this.child, this.backgroundColor})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return RepaintBoundary(
//       child: CustomPaint(
//         painter: CircleDownloadCustomPainter(
//           backgroundColor ?? Colors.grey[400],
//           Theme.of(context).primaryColor,
//           progress,
//         ),
//         child: child,
//       ),
//     );
//   }
// }

// class CircleDownloadCustomPainter extends CustomPainter {
//   final Color? backgroundColor;
//   final Color color;
//   final double? progress;

//   Paint? mPaint;

//   CircleDownloadCustomPainter(this.backgroundColor, this.color, this.progress);

//   @override
//   void paint(Canvas canvas, Size size) {
//     if (mPaint == null) mPaint = Paint();
//     double width = size.width;
//     double height = size.height;

//     Rect progressRect =
//         Rect.fromLTRB(0, height * (1 - progress!), width, height);
//     Rect widgetRect = Rect.fromLTWH(0, 0, width, height);
//     canvas.clipPath(Path()..addOval(widgetRect));

//     canvas.drawRect(widgetRect, mPaint!..color = backgroundColor!);
//     canvas.drawRect(progressRect, mPaint!..color = color);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
