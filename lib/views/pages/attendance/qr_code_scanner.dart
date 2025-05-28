// import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// // import 'package:permission_handler/permission_handler.dart';

// class QrCodeScanner extends StatefulWidget {
//   const QrCodeScanner({Key? key}) : super(key: key);

//   @override
//   State<QrCodeScanner> createState() => _QrCodeScannerState();
// }

// class _QrCodeScannerState extends State<QrCodeScanner> {
//   MobileScannerController cameraController = MobileScannerController();
//   bool _screenOpened = false;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black.withOpacity(0.5),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: Container(
//             // padding: EdgeInsets.all(12),
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.grey,
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.close,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             color: Colors.white,
//             icon: ValueListenableBuilder(
//               valueListenable: cameraController.torchState,
//               builder: (context, state, child) {
//                 switch (state) {
//                   case TorchState.off:
//                     return const Icon(Icons.flash_off, color: Colors.grey);
//                   case TorchState.on:
//                     return const Icon(Icons.flash_on, color: Colors.yellow);
//                 }
//               },
//             ),
//             iconSize: 32.0,
//             onPressed: () => cameraController.toggleTorch(),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           MobileScanner(
//             allowDuplicates: false,
//             controller: cameraController,
//             onDetect: (barcode, args) {
//               _foundBarcode(barcode, args);
//             },
//           ),
//           QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5)),
//           // _isLoading
//           //     ? Positioned(
//           //         child: Stack(
//           //           children: [
//           //             Container(
//           //               height: double.infinity,
//           //               width: double.infinity,
//           //               color: Colors.black38,
//           //             ),
//           //             const LinearProgressIndicator(minHeight: 5),
//           //           ],
//           //         ),
//           //       )
//           //     : const SizedBox()
//         ],
//       ),
//     );
//   }

//   Future<void> _foundBarcode(
//       Barcode barcode, MobileScannerArguments? args) async {
//     if (!_screenOpened) {
//       final String code = barcode.rawValue ?? "___";
//       _screenOpened = false;

//       Navigator.of(context).pop(code.split(":").last);
//     }
//   }
// }

// class QRScannerOverlay extends StatelessWidget {
//   const QRScannerOverlay({Key? key, required this.overlayColour})
//       : super(key: key);

//   final Color overlayColour;

//   @override
//   Widget build(BuildContext context) {
//     double scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 200.0
//         : 330.0;
//     return Stack(children: [
//       ColorFiltered(
//         colorFilter: ColorFilter.mode(overlayColour, BlendMode.srcOut),
//         child: Stack(
//           children: [
//             Container(
//               decoration: const BoxDecoration(
//                   color: Colors.red, backgroundBlendMode: BlendMode.dstOut),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 height: scanArea,
//                 width: scanArea,
//                 decoration: BoxDecoration(
//                   color: Colors.red,
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       Align(
//         alignment: Alignment.center,
//         child: CustomPaint(
//           foregroundPainter: BorderPainter(),
//           child: SizedBox(
//             width: scanArea + 25,
//             height: scanArea + 25,
//           ),
//         ),
//       ),
//     ]);
//   }
// }

// class BorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     const width = 4.0;
//     const radius = 20.0;
//     const tRadius = 3 * radius;
//     final rect = Rect.fromLTWH(
//       width,
//       width,
//       size.width - 2 * width,
//       size.height - 2 * width,
//     );
//     final rrect = RRect.fromRectAndRadius(rect, const Radius.circular(radius));
//     const clippingRect0 = Rect.fromLTWH(
//       0,
//       0,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect1 = Rect.fromLTWH(
//       size.width - tRadius,
//       0,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect2 = Rect.fromLTWH(
//       0,
//       size.height - tRadius,
//       tRadius,
//       tRadius,
//     );
//     final clippingRect3 = Rect.fromLTWH(
//       size.width - tRadius,
//       size.height - tRadius,
//       tRadius,
//       tRadius,
//     );

//     final path = Path()
//       ..addRect(clippingRect0)
//       ..addRect(clippingRect1)
//       ..addRect(clippingRect2)
//       ..addRect(clippingRect3);

//     canvas.clipPath(path);
//     canvas.drawRRect(
//       rrect,
//       Paint()
//         ..color = Colors.white
//         ..style = PaintingStyle.stroke
//         ..strokeWidth = width,
//     );
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// class BarReaderSize {
//   static double width = 200;
//   static double height = 200;
// }

// class OverlayWithHolePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Colors.black54;
//     canvas.drawPath(
//         Path.combine(
//           PathOperation.difference,
//           Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
//           Path()
//             ..addOval(Rect.fromCircle(
//                 center: Offset(size.width - 44, size.height - 44), radius: 40))
//             ..close(),
//         ),
//         paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }

// @override
// bool shouldRepaint(CustomPainter oldDelegate) {
//   return false;
// }

// class ScanReturnData {
//   final String response;
//   final LocData loc;

//   ScanReturnData({required this.response, required this.loc});
// }

// class LocData {
//   final double lat;
//   final double long;
//   LocData({
//     required this.lat,
//     required this.long,
//   });
// }
