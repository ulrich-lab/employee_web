// import 'dart:async';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:uuid/uuid.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/Models/attachement.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/Models/recent_chat.dart';
// import 'package:visitor_pass/Models/user.dart';
// import 'package:visitor_pass/Services/date_time_service.dart';
// import 'package:visitor_pass/config/locator/isar_bd.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/config/locator/storage_paths.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/utils/abc.dart';
// import 'package:visitor_pass/views/widget/attachment_renderers.dart';
// import 'package:visitor_pass/views/widget/bottom_inset.dart';
// import 'package:visitor_pass/views/widget/chat_field.dart';

// class AttachmentMessageSender extends StatefulWidget {
//   const AttachmentMessageSender({
//     super.key,
//     required this.attachmentsFuture,
//     this.tags,
//   });

//   final Future<List<Attachment>> attachmentsFuture;
//   final List<String>? tags;

//   @override
//   State<AttachmentMessageSender> createState() =>
//       _AttachmentMessageSenderState();
// }

// class _AttachmentMessageSenderState extends State<AttachmentMessageSender> {
//   late User self;
//   late User? other;
//   late Group? group;
//   late Attachment current;
//   late List<TextEditingController> controllers;
//   late List<Attachment> attachments;
//   late StreamSubscription<bool> keyboardListener;
//   late final attachmentsFuture = awaitAttachments();
//   bool isKeyboardVisible = false;
//   ChatController chatController = Get.put(locator<ChatController>());

//   @override
//   void initState() {
//     self = chatController.self;
//     other = chatController.other;
//     group = chatController.group;

//     keyboardListener = KeyboardVisibilityController().onChange.listen(
//       (event) {
//         if (!mounted) return;
//         setState(() {
//           isKeyboardVisible = event;
//         });
//       },
//     );

//     super.initState();
//   }

//   @override
//   void dispose() {
//     keyboardListener.cancel();
//     for (var controller in controllers) {
//       controller.dispose();
//     }

//     super.dispose();
//   }

//   Future<void> awaitAttachments() async {
//     attachments = [...(await widget.attachmentsFuture)];
//     controllers = attachments.map((_) => TextEditingController()).toList();
//     current = attachments[0];
//   }

//   Future<void> addNewAttachments() async {
//     List<Attachment>? newAttachments;
//     if (current.type == AttachmentType.document) {
//       newAttachments = await chatController.pickDocuments(
//           context, returnAttachments: true, mounted);
//     } else {
//       if (Platform.isAndroid) {
//         Navigator.pop(context, attachments);
//         return;
//       }
//       newAttachments = await chatController.pickAttachmentsFromGallery(
//         context,
//         returnAttachments: true,
//         mounted,
//       );
//     }

//     if (newAttachments == null) return;
//     setState(() {
//       attachments.addAll(newAttachments!);
//       controllers.addAll(
//         List.generate(
//           newAttachments.length,
//           (_) => TextEditingController(),
//         ),
//       );
//     });
//   }

//   Future<void> sendAttachments(String? conversationId) async {
//     for (var i = 0; i < controllers.length; i++) {
//       final attachment = attachments[i];

//       String messageId = const Uuid().v4();
//       String msgContent = controllers[i].text.trim();

//       if (msgContent.isEmpty && attachment.type == AttachmentType.document) {
//         msgContent = "\u00A0"; // espace insécable
//       }

//       // Copie du fichier selon la plateforme
//       if (ScreenUtil().screenWidth > 640) {
//         print("object===========1");
//         // final appDocDir = await getApplicationDocumentsDirectory();
//         // final targetPath = File('${appDocDir.path}/${attachment.fileName}');
//         // print("object===========${targetPath.path}");
//         await attachment.file!.copy(attachment.fileName);
//       } else {
//         await attachment.file!.copy(
//           DeviceStorage.getMediaFilePath(
//             attachment.fileName,
//           ),
//         );
//       }

//       chatController.sendMessageWithAttachments(
//         Message(
//           id: messageId,
//           content: msgContent,
//           status: MessageStatus.pending,
//           senderId: self.id,
//           receiverId: other?.id,
//           group: group,
//           timestamp: await DateTimeService.instance.getDateTime(),
//           attachment: attachment..uploadStatus = UploadStatus.uploading,
//         ),
//         conversationId,
//       );
//     }

//     if (!context.mounted) return;
//     if (ScreenUtil().screenWidth > 640) {
//       Navigator.of(context).pop();
//     } else {
//       Navigator.of(context).popUntil((route) => route.settings.name == 'chat');
//     }
//     //
//   }

//   void removeSelectedAttachment() {
//     if (attachments.length == 1) {
//       Navigator.pop(context, []);
//       return;
//     }
//     setState(() {
//       final idx = attachments.indexOf(current);
//       attachments.removeAt(idx);
//       controllers[idx].dispose();
//       controllers.removeAt(idx);

//       if (widget.tags != null) {
//         widget.tags!.removeAt(idx);
//       }

//       current = attachments.first;
//     });
//   }

//   void selectAttachment(Attachment attachment) {
//     setState(() {
//       current = attachment;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;
//     return PopScope(
//       canPop: false,
//       onPopInvoked: (didPop) {
//         if (didPop) {
//           return;
//         }

//         Navigator.of(context).pop(attachments);
//       },
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Theme.of(context).brightness == Brightness.dark
//             ? colorTheme.backgroundColor
//             : const Color.fromARGB(236, 225, 233, 235),
//         body: Stack(
//           children: [
//             FutureBuilder(
//                 future: attachmentsFuture,
//                 builder: (context, snap) {
//                   if (snap.connectionState == ConnectionState.waiting) {
//                     return const Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   }

//                   final currentType = current.type;
//                   final currentImageRenderer = AttachmentRenderer(
//                     attachment: current.file!,
//                     attachmentType: currentType,
//                     fit: BoxFit.contain,
//                     controllable: true,
//                   );

//                   return Stack(
//                     children: [
//                       Center(
//                         child: KeyboardDismissOnTap(
//                           child: widget.tags != null
//                               ? Hero(
//                                   tag: widget
//                                       .tags![attachments.indexOf(current)],
//                                   child: currentImageRenderer,
//                                 )
//                               : currentImageRenderer,
//                         ),
//                       ),
//                       AvoidBottomInset(
//                         conditions: const [false],
//                         child: Expanded(
//                           child: Container(
//                             margin: const EdgeInsets.only(top: 48),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.stretch,
//                               children: [
//                                 const Spacer(),
//                                 Offstage(
//                                   offstage: isKeyboardVisible,
//                                   child: Preview(
//                                     attachments: attachments,
//                                     current: current,
//                                     onAttachmentClicked: selectAttachment,
//                                     onDeleteClicked: removeSelectedAttachment,
//                                   ),
//                                 ),
//                                 Column(children: [
//                                   Padding(
//                                     padding: const EdgeInsets.symmetric(
//                                         horizontal: 8.0),
//                                     child: ChatField(
//                                       textController: controllers[
//                                           attachments.indexOf(current)],
//                                       leading: GestureDetector(
//                                         onTap: addNewAttachments,
//                                         child: Icon(
//                                           Icons.add_box_rounded,
//                                           size: 24.0,
//                                           color: colorTheme.greyColor,
//                                         ),
//                                       ),
//                                       actions: [
//                                         GestureDetector(
//                                           child: const Icon(
//                                               Icons.hide_source_rounded),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   const SizedBox(height: 8),
//                                   Container(
//                                     color: const Color.fromARGB(152, 0, 0, 0),
//                                     padding: const EdgeInsets.only(
//                                       top: 12.0,
//                                       bottom: 32,
//                                       left: 12,
//                                       right: 12,
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         GestureDetector(
//                                           onTap: () {},
//                                           child: Container(
//                                             padding: const EdgeInsets.symmetric(
//                                               horizontal: 12,
//                                               vertical: 10,
//                                             ),
//                                             decoration: BoxDecoration(
//                                               color: Theme.of(context)
//                                                           .brightness ==
//                                                       Brightness.dark
//                                                   ? colorTheme.appBarColor
//                                                   : const Color.fromARGB(
//                                                       255, 242, 251, 254),
//                                               borderRadius:
//                                                   BorderRadius.circular(24),
//                                             ),
//                                             child: SizedBox(
//                                               width: 0.6.sw,
//                                               child: Text(
//                                                 group != null
//                                                     ? group!.name!
//                                                     : other!.name,
//                                                 overflow: TextOverflow.ellipsis,
//                                               ),
//                                             ),
//                                           ),
//                                         ),
//                                         InkWell(
//                                           onTap: () async {
//                                             sendAttachments(
//                                               group != null
//                                                   ? group!.id!
//                                                   : (await locator<IsarDb>()
//                                                           .getConversationId(
//                                                         getChatId(
//                                                             self.id, other!.id),
//                                                       )) ??
//                                                       null,
//                                             );
//                                           },
//                                           child: Container(
//                                             padding: const EdgeInsets.all(12),
//                                             decoration: BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 color: colorTheme.greenColor),
//                                             child: const Icon(
//                                               Icons.send,
//                                               color: Colors.white,
//                                             ),
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                 ]),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//             ListTile(
//               contentPadding: const EdgeInsets.symmetric(
//                 vertical: 52.0,
//                 horizontal: 12.0,
//               ),
//               leading: GestureDetector(
//                 onTap: () => Navigator.of(context).pop(attachments),
//                 child: const CircleAvatar(
//                   backgroundColor: Color.fromARGB(100, 0, 0, 0),
//                   foregroundColor: Colors.white,
//                   child: Icon(
//                     Icons.close,
//                   ),
//                 ),
//               ),
//               trailing: const Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Color.fromARGB(100, 0, 0, 0),
//                     foregroundColor: Colors.white,
//                     child: Icon(Icons.crop),
//                   ),
//                   SizedBox(width: 8),
//                   CircleAvatar(
//                     backgroundColor: Color.fromARGB(100, 0, 0, 0),
//                     foregroundColor: Colors.white,
//                     child: Icon(Icons.sticky_note_2),
//                   ),
//                   SizedBox(width: 8),
//                   CircleAvatar(
//                     backgroundColor: Color.fromARGB(100, 0, 0, 0),
//                     foregroundColor: Colors.white,
//                     child: Icon(Icons.text_format_outlined),
//                   ),
//                   SizedBox(width: 8),
//                   CircleAvatar(
//                     backgroundColor: Color.fromARGB(100, 0, 0, 0),
//                     foregroundColor: Colors.white,
//                     child: Icon(Icons.draw),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Preview extends StatelessWidget {
//   const Preview({
//     super.key,
//     required this.attachments,
//     required this.current,
//     required this.onDeleteClicked,
//     required this.onAttachmentClicked,
//   });

//   final List<Attachment> attachments;
//   final Attachment current;
//   final VoidCallback onDeleteClicked;
//   final Function(Attachment) onAttachmentClicked;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 24.0),
//         child: SizedBox(
//           height: 60,
//           child: ListView.separated(
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemCount: attachments.length,
//             itemBuilder: (context, idx) {
//               final attachment = attachments[idx];
//               final attachmentType = attachment.type;

//               return Center(
//                 child: GestureDetector(
//                     onTap: () => onAttachmentClicked(attachment),
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         border: current == attachment
//                             ? Border.all(
//                                 color: Colors.white,
//                                 width: 2,
//                               )
//                             : null,
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(6),
//                         child: Stack(
//                           alignment: Alignment.center,
//                           children: [
//                             SizedBox(
//                               height: 50,
//                               width: 50,
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(6),
//                                 child: AttachmentRenderer(
//                                   attachment: attachment.file!,
//                                   attachmentType: attachmentType,
//                                   fit: BoxFit.cover,
//                                   compact: true,
//                                 ),
//                               ),
//                             ),
//                             if (current == attachment) ...[
//                               Container(
//                                 width: 50,
//                                 height: 50,
//                                 color: Colors.black38,
//                                 child: GestureDetector(
//                                   onTap: onDeleteClicked,
//                                   child: const Icon(
//                                     Icons.delete,
//                                     color: Colors.white,
//                                     size: 32,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ],
//                         ),
//                       ),
//                     )),
//               );
//             },
//             separatorBuilder: (context, idx) {
//               return const SizedBox(width: 6);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
