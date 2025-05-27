// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/views/widget/buttons.dart';
// import 'package:visitor_pass/config/locator/locator.dart';

// class AttachmentPicker extends StatefulWidget {
//   const AttachmentPicker({super.key});

//   @override
//   State<AttachmentPicker> createState() => _AttachmentPickerState();
// }

// class _AttachmentPickerState extends State<AttachmentPicker> {
//   ChatController _chatController = Get.put(locator<ChatController>());
//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;

//     return Material(
//       color: Colors.transparent,
//       child: Container(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 32.0,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16.0),
//           color: Theme.of(context).brightness == Brightness.dark
//               ? colorTheme.appBarColor
//               : colorTheme.backgroundColor,
//         ),
//         child: GridView.count(
//           crossAxisCount: 3,
//           physics: const BouncingScrollPhysics(),
//           shrinkWrap: true,
//           children: [
//             LabelledButton(
//               onTap: () async {
//                 _chatController.pickDocuments(context, mounted);
//               },
//               backgroundColor: Colors.deepPurpleAccent,
//               label: 'Document',
//               child: const Icon(
//                 Icons.insert_page_break,
//                 size: 28,
//                 color: Colors.white,
//               ),
//             ),
//             LabelledButton(
//               onTap: () async {
//                 _chatController.navigateToCameraView(context, mounted);
//               },
//               label: 'Camera',
//               backgroundColor: Colors.redAccent[400],
//               child: const Icon(
//                 Icons.camera_alt_rounded,
//                 size: 28,
//                 color: Colors.white,
//               ),
//             ),
//             LabelledButton(
//               onTap: () async {
//                 _chatController.pickAttachmentsFromGallery(context, mounted);
//               },
//               label: 'Gallery',
//               backgroundColor: Colors.purple[400],
//               child: const Icon(
//                 Icons.photo_size_select_actual_rounded,
//                 size: 28,
//                 color: Colors.white,
//               ),
//             ),
//             if (Platform.isAndroid) ...[
//               LabelledButton(
//                 onTap: () async {
//                   _chatController.pickAudioFiles(context, mounted);
//                 },
//                 label: 'Audio',
//                 backgroundColor: Colors.orange[900],
//                 child: const Icon(
//                   Icons.headphones_rounded,
//                   size: 28,
//                   color: Colors.white,
//                 ),
//               )
//             ],
//             // LabelledButton(
//             //   onTap: () {
//             //     if (!mounted) return;
//             //     Navigator.pop(context);
//             //   },
//             //   label: 'Location',
//             //   backgroundColor: Colors.green[600],
//             //   child: const Icon(
//             //     Icons.location_on,
//             //     size: 28,
//             //     color: Colors.white,
//             //   ),
//             // ),
//             // LabelledButton(
//             //   onTap: () {
//             //     if (!mounted) return;
//             //     Navigator.pop(context);
//             //   },
//             //   label: 'Payment',
//             //   backgroundColor: Colors.teal[600],
//             //   child: CircleAvatar(
//             //     radius: 14,
//             //     backgroundColor: Colors.white,
//             //     child: Icon(
//             //       Icons.currency_rupee_rounded,
//             //       size: 18,
//             //       color: Colors.teal[600],
//             //     ),
//             //   ),
//             // ),
//             // LabelledButton(
//             //   onTap: () async {
//             //     if (!mounted) return;
//             //     Navigator.pop(context);
//             //   },
//             //   label: 'Contact',
//             //   backgroundColor: Colors.blue[600],
//             //   child: const Icon(
//             //     Icons.person,
//             //     size: 28,
//             //     color: Colors.white,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
