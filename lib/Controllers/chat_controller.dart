// import 'dart:async';
// import 'dart:io';

// import 'package:audio_session/audio_session.dart';
// import 'package:camera/camera.dart';
// import 'package:extended_image/extended_image.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_sound/flutter_sound.dart';
// import 'package:get/get.dart';
// import 'package:injectable/injectable.dart';
// import 'package:logger/logger.dart';
// import 'package:mime/mime.dart';
// import 'package:multiselect_nested/models/multiselect_nested_item.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:uuid/uuid.dart';
// import 'package:visitor_pass/Models/attachement.dart';
// import 'package:visitor_pass/Models/contact.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/Models/message_status_model.dart';
// import 'package:visitor_pass/Models/recent_chat.dart';
// import 'package:visitor_pass/Models/user.dart';
// import 'package:visitor_pass/Services/date_time_service.dart';
// import 'package:visitor_pass/config/graphql/documents/chat.graphql.dart';
// import 'package:visitor_pass/config/locator/isar_bd.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/config/locator/storage_paths.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/domain/chat_repository.dart';
// import 'package:visitor_pass/domain/compression_service.dart';
// import 'package:visitor_pass/domain/download_service.dart';
// import 'package:visitor_pass/domain/upload_service.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/utils/abc.dart';
// import 'package:visitor_pass/utils/attachment_utils.dart';
// import 'package:visitor_pass/views/widget/attachment_sender.dart';
// import 'package:visitor_pass/views/widget/camera.dart';
// import 'package:visitor_pass/views/widget/gallery.dart';

// enum RecordingState {
//   notRecording,
//   recording,
//   recordingLocked,
//   paused,
// }

// class ChatState {
//   ChatState({
//     this.hideElements = false,
//     this.recordingState = RecordingState.notRecording,
//     this.showScrollBtn = false,
//     this.unreadCount = 0,
//     this.showEmojiPicker = false,
//     required this.recordingSamples,
//     required this.soundRecorder,
//     required this.messageController,
//     required this.fieldFocusNode,
//   });

//   final bool hideElements;
//   final RecordingState recordingState;
//   final TextEditingController messageController;
//   final FocusNode fieldFocusNode;
//   final FlutterSoundRecorder soundRecorder;
//   final bool showScrollBtn;
//   final int unreadCount;
//   final List<RecordingDisposition> recordingSamples;
//   final bool showEmojiPicker;

//   void dispose() {
//     fieldFocusNode.dispose();
//     messageController.dispose();
//     soundRecorder.closeRecorder();
//   }

//   ChatState copyWith({
//     bool? hideElements,
//     RecordingState? recordingState,
//     bool? showScrollBtn,
//     int? unreadCount,
//     bool? showEmojiPicker,
//     List<RecordingDisposition>? recordingSamples,
//   }) {
//     return ChatState(
//       hideElements: hideElements ?? this.hideElements,
//       recordingState: recordingState ?? this.recordingState,
//       showScrollBtn: showScrollBtn ?? this.showScrollBtn,
//       unreadCount: unreadCount ?? this.unreadCount,
//       showEmojiPicker: showEmojiPicker ?? this.showEmojiPicker,
//       messageController: messageController,
//       fieldFocusNode: fieldFocusNode,
//       soundRecorder: soundRecorder,
//       recordingSamples: recordingSamples ?? this.recordingSamples,
//     );
//   }
// }

// @lazySingleton
// class ChatController extends GetxController {
//   ChatRepository chatRepository;
//   ChatController(this.chatRepository);

//   final Rx<ChatState> state = ChatState(
//     messageController: TextEditingController(),
//     fieldFocusNode: FocusNode(),
//     soundRecorder: FlutterSoundRecorder(logLevel: Level.error),
//     recordingSamples: [],
//   ).obs;

//   late User self;
//   late User? other;
//   late Group? group;

//   late String otherUserContactName;
//   StreamSubscription<RecordingDisposition>? recordingStream;
//   var employeesByDepartAndServices = <MultiSelectNestedItem>[].obs;
//   var selectedEmployeesByDepartAndServices = <MultiSelectNestedItem>[].obs;
//   var createGroupLoading = false.obs;

//   var contacts = <Contact>[].obs;
//   var filteredContacts = <Contact>[].obs;
//   var selectedContacts = <Contact>[].obs;
//   var tabIndex = 1.obs;

//   var currentChatModel = CurrentChatModel().obs;

//   void filterContacts(String query) async {
//     filteredContacts.value = contacts
//         .where((contact) =>
//             contact.displayName.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//   }

//   void handleCheckboxChange(Contact contactId) {
//     selectedEmployeesByDepartAndServices.clear();
//     if (selectedContacts.any((el) => el.contactId == contactId.contactId)) {
//       selectedContacts.remove(contactId);
//     } else {
//       selectedContacts.add(contactId);
//     }
//   }

//   void addContactsGroup() async {
//     filteredContacts.value = await locator<IsarDb>().getContacts();
//     contacts.value = await locator<IsarDb>().getContacts();
//   }

//   @override
//   void onInit() {
//     addContactsGroup();
//     super.onInit();
//   }

//   void initUsers({
//     required User self,
//     User? other,
//     required String otherUserContactName,
//     Group? group,
//   }) {
//     this.self = self;
//     this.other = other;
//     this.group = group;
//     this.otherUserContactName = otherUserContactName;
//   }

//   Future<void> initRecorder() async {
//     await state.value.soundRecorder.openRecorder();
//     final session = await AudioSession.instance;
//     await session.configure(AudioSessionConfiguration(
//       avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
//       avAudioSessionCategoryOptions:
//           AVAudioSessionCategoryOptions.allowBluetooth |
//               AVAudioSessionCategoryOptions.defaultToSpeaker,
//       avAudioSessionMode: AVAudioSessionMode.spokenAudio,
//       avAudioSessionRouteSharingPolicy:
//           AVAudioSessionRouteSharingPolicy.defaultPolicy,
//       avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
//       androidAudioAttributes: const AndroidAudioAttributes(
//         contentType: AndroidAudioContentType.speech,
//         flags: AndroidAudioFlags.none,
//         usage: AndroidAudioUsage.voiceCommunication,
//       ),
//       androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
//       androidWillPauseWhenDucked: true,
//     ));
//     state.value.soundRecorder.setSubscriptionDuration(
//       const Duration(milliseconds: 120),
//     );
//   }

//   void navigateToHome(BuildContext context) {
//     Navigator.pop(context);
//   }

//   void setRecordingState(RecordingState recordingState) {
//     state.value = state.value.copyWith(recordingState: recordingState);
//   }

//   Future<void> pauseRecording() async {
//     await state.value.soundRecorder.pauseRecorder();
//     setRecordingState(RecordingState.paused);
//   }

//   Future<void> resumeRecording() async {
//     await state.value.soundRecorder.resumeRecorder();
//     setRecordingState(RecordingState.recordingLocked);
//   }

//   Future<void> cancelRecording() async {
//     await state.value.soundRecorder.stopRecorder();
//     recordingStream?.cancel();
//     recordingStream = null;
//     state.value = state.value.copyWith(
//       recordingSamples: [],
//       recordingState: RecordingState.notRecording,
//     );
//   }

//   Future<void> getStreamChat() async {
//     var date = await DateTimeService.instance.getDateTime();
//     var userId = box.read("user-id");

//     chatRepository.getChatStream(userId: userId).listen(
//       (event) {
//         for (var conversation in event) {
//           if (conversation.is_group ?? false) {
//             if (conversation.messages.isEmpty) {
//               locator<IsarDb>().addMessage(
//                 message: Message(
//                   group: Group(
//                     id: conversation.id,
//                     members: conversation.employee_conversations
//                         .map((el) => el.employee_id)
//                         .toList(),
//                     name: conversation.name ?? "",
//                     senderId: box.read("user-id"),
//                   ),
//                   id: const Uuid().v4(),
//                   content: ".",
//                   senderId: box.read("user-id"),
//                   timestamp: DateTime.now(),
//                   status: MessageStatus.fromValue(
//                     "SENT",
//                   ),
//                 ),
//                 commingFromNet: true,
//               );
//             } else {
//               for (var message in conversation.messages) {
//                 final isSender = message.sender_id == userId;
//                 final senderId = isSender ? userId : message.sender_id;

//                 final attachment = message.attachments.isNotEmpty
//                     ? Attachment.fromJson({
//                         "url": message.attachments.first.file_path,
//                         "fileName": message.attachments.first.filename,
//                         "fileSize": message.attachments.first.file_size,
//                         "fileExtension": message.attachments.first.mime_type,
//                         "type": message.attachments.first.file_type,
//                         "uploadStatus": "UPLOADED",
//                         "autoDownload": true,
//                         "width": message.attachments.first.width,
//                         "height": message.attachments.first.height,
//                         "samples": message.attachments.first.samples
//                       })
//                     : null;

//                 locator<IsarDb>().addMessage(
//                   message: Message(
//                     group: Group(
//                       id: conversation.id,
//                       members: conversation.employee_conversations
//                           .map((el) => el.employee_id)
//                           .toList(),
//                       name: conversation.name ?? "",
//                       senderId: box.read("user-id"),
//                     ),
//                     id: senderId == box.read("user-id")
//                         ? message.message_mobile_id!
//                         : message.id,
//                     content: message.content ?? "",
//                     senderId: senderId,
//                     timestamp: DateTime.tryParse(
//                           message.created_at ?? date.toIso8601String(),
//                         ) ??
//                         date,
//                     status: MessageStatus.fromValue("SENT"),
//                     attachment: attachment,
//                   ),
//                   commingFromNet: true,
//                 );
//               }
//             }
//           } else {
//             for (var message in conversation.messages) {
              
//               for (var status in message.message_statuses) {
//                 print("${conversation.messages.length} conversation.messages=====${status.status}");
//               }

//               final isSender = message.sender_id == userId;
//               final senderId = isSender
//                   ? userId
//                   : conversation.employee_conversations.first.employee_id;
//               final receiverId = isSender
//                   ? conversation.employee_conversations.first.employee_id
//                   : userId;
//               final attachment = message.attachments.isNotEmpty
//                   ? Attachment.fromJson({
//                       "url": message.attachments.first.file_path,
//                       "fileName": message.attachments.first.filename,
//                       "fileSize": message.attachments.first.file_size,
//                       "fileExtension": message.attachments.first.mime_type,
//                       "type": message.attachments.first.file_type,
//                       "uploadStatus": "UPLOADED",
//                       "autoDownload": true,
//                       "width": message.attachments.first.width,
//                       "height": message.attachments.first.height,
//                       "samples": message.attachments.first.samples
//                     })
//                   : null;

//               locator<IsarDb>().addMessage(
//                 message: Message(
//                   id: senderId == box.read("user-id")
//                       ? message.message_mobile_id!
//                       : message.id,
//                   content: message.content ?? "",
//                   senderId: senderId,
//                   receiverId: receiverId,
//                   timestamp: DateTime.tryParse(
//                         message.created_at ?? date.toIso8601String(),
//                       ) ??
//                       date,
//                   status: MessageStatus.fromValue("SENT"),
//                   attachment: attachment,
//                 ),
//                 conversationId: conversation.messages.last.conversation_id,
//                 commingFromNet: true,
//               );

//               ////////////1
//             }
//           }
//         }
//       },
//     );
//   }

//   Future<void> startRecording() async {
//     if (!await hasPermission(Permission.microphone)) return;
//     await state.value.soundRecorder.startRecorder(
//       codec: Codec.aacADTS,
//       sampleRate: 44100,
//       bitRate: 48000,
//       toFile: "voice.aac",
//     );

//     recordingStream = state.value.soundRecorder.onProgress!.listen(
//       recordingListener,
//     );
//     setRecordingState(RecordingState.recording);
//   }

//   void recordingListener(RecordingDisposition data) {
//     state.value = state.value.copyWith(
//       recordingSamples: state.value.recordingSamples..add(data),
//     );
//   }

//   Future<void> onMicDragLeft(double dx, double deviceWidth) async {
//     if (dx > deviceWidth * 0.6) return;

//     await state.value.soundRecorder.stopRecorder();
//     setRecordingState(RecordingState.notRecording);
//   }

//   Future<void> onMicDragUp(double dy, double deviceHeight) async {
//     if (dy > deviceHeight - 100 ||
//         state.value.recordingState == RecordingState.recordingLocked) return;

//     setRecordingState(RecordingState.recordingLocked);
//   }

//   Future<void> onRecordingDone(String? conversationId) async {
//     final path = await state.value.soundRecorder.stopRecorder();
//     recordingStream?.cancel();
//     recordingStream = null;

//     final samples =
//         state.value.recordingSamples.map((e) => e.decibels ?? 0).toList();

//     state.value = state.value.copyWith(
//       recordingSamples: [],
//       recordingState: RecordingState.notRecording,
//     );

//     final recordedFile = File(path!);
//     final messageId = const Uuid().v4();
//     final timestamp = await DateTimeService.instance.getDateTime();
//     final ext = path.split(".").last;
//     final fileName = "AUD_${timestamp.millisecondsSinceEpoch ~/ 1000}.$ext";

//     await recordedFile.copy(
//       DeviceStorage.getMediaFilePath(fileName),
//     );

//     final senderId = self.id;
//     final receiverId = other?.id;
//     final groupContent = group;

//     sendMessageWithAttachments(
//       Message(
//         id: messageId,
//         content: "",
//         group: groupContent,
//         status: MessageStatus.pending,
//         senderId: senderId,
//         receiverId: receiverId,
//         timestamp: timestamp,
//         attachment: Attachment(
//           type: AttachmentType.voice,
//           url: "",
//           fileName: fileName,
//           fileSize: recordedFile.lengthSync(),
//           fileExtension: ext,
//           uploadStatus: UploadStatus.uploading,
//           autoDownload: true,
//           file: recordedFile,
//           samples: samples,
//         ),
//       ),
//       conversationId,
//     );
//   }

//   void onTextChanged(String value) {
//     if (value.isEmpty) {
//       state.value = state.value.copyWith(hideElements: false);
//     } else if (value != ' ') {
//       state.value = state.value.copyWith(hideElements: true);
//     } else {
//       state.value.messageController.text = "";
//     }
//   }

//   void toggleScrollBtnVisibility() {
//     state.value =
//         state.value.copyWith(showScrollBtn: !state.value.showScrollBtn);
//   }

//   void setUnreadCount(int count) {
//     if (state.value.unreadCount == count) return;
//     state.value = state.value.copyWith(unreadCount: count);
//   }

//   void setShowEmojiPicker(bool shouldShowEmojiPicker) {
//     state.value = state.value.copyWith(showEmojiPicker: shouldShowEmojiPicker);
//   }

//   void onSendBtnPressed({
//     required User sender,
//     User? receiver,
//     String? conversationId,
//     Group? group,
//   }) async {
//     sendMessageNoAttachments(
//       message: Message(
//         id: const Uuid().v4(),
//         group: group,
//         content: state.value.messageController.text.trim(),
//         status: MessageStatus.pending,
//         senderId: sender.id,
//         receiverId: group != null ? null : receiver!.id,
//         timestamp: await DateTimeService.instance.getDateTime(),
//       ),
//       conversationId: conversationId,
//       isGroup: group != null,
//     );

//     state.value.messageController.text = "";
//     state.value = state.value.copyWith(
//       hideElements: false,
//     );
//   }

//   Future<void> sendMessageNoAttachments(
//       {required Message message,
//       String? conversationId,
//       required bool isGroup}) async {
//     if (isGroup) {
//       await locator<IsarDb>().addMessage(
//         message: message,
//         conversationId: conversationId,
//         commingFromNet: false,
//       );
//       var r = await chatRepository.sendMessage(
//           message: message, conversationId: conversationId!);
//       r.fold(
//         (f) {},
//         (r) {
//           locator<IsarDb>()
//               .updateMessage(message.id, status: MessageStatus.sent);
//         },
//       );
//     } else {
//       if (conversationId == null) {
//         var result = await chatRepository.createConversation(
//           firstParticipant: message.senderId,
//           secondParticipant: message.receiverId!,
//         );
//         result.fold((f) {}, (r) async {
//           await locator<IsarDb>().addMessage(
//               message: message, conversationId: r, commingFromNet: false);
//           var result = await chatRepository.sendMessage(
//               message: message, conversationId: r);
//           result.fold(
//             (f) {},
//             (r) {
//               locator<IsarDb>()
//                   .updateMessage(message.id, status: MessageStatus.sent);
//             },
//           );
//         });
//       } else {
//         await locator<IsarDb>().addMessage(
//             message: message,
//             conversationId: conversationId,
//             commingFromNet: false);
//         var r = await chatRepository.sendMessage(
//             message: message, conversationId: conversationId);
//         r.fold(
//           (f) {},
//           (r) {
//             locator<IsarDb>()
//                 .updateMessage(message.id, status: MessageStatus.sent);
//           },
//         );
//       }
//     }
//   }

//   void sendMessageWithAttachments(
//       Message message, String? conversationId) async {
//     if ({
//       AttachmentType.document,
//       AttachmentType.audio,
//       AttachmentType.voice,
//       AttachmentType.video
//     }.contains(message.attachment!.type)) {
//       if (message.group != null) {
//         message.attachment!.uploadStatus = UploadStatus.preparing;
//         await locator<IsarDb>().addMessage(
//           message: message,
//           conversationId: conversationId,
//           commingFromNet: false,
//         );

//         message.attachment!.uploadStatus = UploadStatus.uploading;
//         await uploadAttachment(message, conversationId!);
//         await locator<IsarDb>()
//             .updateMessage(message.id, attachment: message.attachment);
//         return;
//       } else {
//         if (conversationId == null) {
//           var result = await chatRepository.createConversation(
//             firstParticipant: message.senderId,
//             secondParticipant: message.receiverId!,
//           );
//           result.fold((f) {}, (r) async {
//             message.attachment!.uploadStatus = UploadStatus.preparing;
//             await locator<IsarDb>().addMessage(
//                 message: message, conversationId: r, commingFromNet: false);

//             message.attachment!.uploadStatus = UploadStatus.uploading;
//             await uploadAttachment(message, r);
//             await locator<IsarDb>()
//                 .updateMessage(message.id, attachment: message.attachment);
//             return;
//           });
//         } else {
//           message.attachment!.uploadStatus = UploadStatus.preparing;
//           await locator<IsarDb>().addMessage(
//               message: message,
//               conversationId: conversationId,
//               commingFromNet: false);

//           message.attachment!.uploadStatus = UploadStatus.uploading;
//           await uploadAttachment(message, conversationId);
//           await locator<IsarDb>()
//               .updateMessage(message.id, attachment: message.attachment);
//           return;
//         }
//       }
//     }

//     if (conversationId == null) {
//       var result = await chatRepository.createConversation(
//         firstParticipant: message.senderId,
//         secondParticipant: message.receiverId!,
//       );
//       result.fold((f) {}, (r) async {
//         message.attachment!.uploadStatus = UploadStatus.preparing;
//         await locator<IsarDb>().addMessage(
//             message: message, conversationId: r, commingFromNet: false);

//         await compressAttachment(message);
//         await uploadAttachment(message, r);
//       });
//     } else {
//       message.attachment!.uploadStatus = UploadStatus.preparing;
//       await locator<IsarDb>().addMessage(
//           message: message,
//           conversationId: conversationId,
//           commingFromNet: false);

//       await compressAttachment(message);
//       await uploadAttachment(message, conversationId);
//     }
//   }

//   Future<void> uploadAttachment(Message message, String conversationId) async {
//     await UploadService.upload(
//       taskId: message.id,
//       file: message.attachment!.file!,
//       path: '/api/v1/upload-file?upload_type=local',
//       onUploadDone: (url) async =>
//           await uploadCompleteHandler(url, message, conversationId),
//       // onUploadError: () async => await stopUpload(message),
//       onUploadError: () {},
//     );

//     message.attachment!.uploadStatus = UploadStatus.uploading;
//     await locator<IsarDb>()
//         .updateMessage(message.id, attachment: message.attachment);
//   }

//   Future<void> uploadCompleteHandler(
//       String url, Message message, String conversationId) async {
//     var result = await chatRepository.sendMessage(
//       message: message
//         ..status = MessageStatus.sent
//         ..attachment!.url = url
//         ..attachment!.uploadStatus = UploadStatus.uploaded,
//       conversationId: conversationId,
//     );

//     result.fold(
//       (f) {
//         print("res===========1==$f");
//       },
//       (r) async {
//         print("res===========2");
//         await locator<IsarDb>().updateMessage(
//           message.id,
//           status: message.status,
//           attachment: message.attachment!
//             ..url = url
//             ..uploadStatus = UploadStatus.uploaded,
//         );
//       },
//     );
//   }

//   // Future<void> stopUpload(Message message) async {
//   //   if (message.attachment!.uploadStatus == UploadStatus.notUploading) {
//   //     return;
//   //   }

//   //   await UploadService.cancelUpload(message.id);
//   //   await locator<IsarDb>().updateMessage(
//   //     message.id,
//   //     attachment: message.attachment!..uploadStatus = UploadStatus.notUploading,
//   //   );
//   // }

//   Future<void> downloadAttachment(
//     Message message,
//     void Function() onComplete,
//     void Function() onError,
//   ) async {
//     await DownloadService.instance.download(
//       taskId: message.id,
//       url: message.attachment!.url,
//       path: DeviceStorage.getMediaFilePath(message.attachment!.fileName),
//       onDownloadComplete: onComplete,
//       onDownloadError: onError,
//     );
//   }

//   Future<void> cancelDownload(Message message) async {
//     await DownloadService.instance.cancelDownload(message.id);
//   }

//   Future<void> compressAttachment(Message message) async {
//     final compressedFile = await CompressionService.compressImage(
//       message.attachment!.file!,
//     );

//     await compressedFile.copy(
//       DeviceStorage.getMediaFilePath(
//         message.attachment!.fileName,
//       ),
//     );

//     message.attachment!.file = compressedFile;
//     message.attachment!.fileSize = await compressedFile.length();
//     message.attachment!.fileExtension = compressedFile.path.split('.').last;
//   }

//   Future<void> markMessageAsSeen(Message message) async {
//     var request = await chatRepository.updateMessageStatus(
//       id: message.id,
//       status: MessageStatus.seen.value,
//     );
//     request.fold((l) {}, (r) {});
//   }

//   Future<void> createGroupe({
//     required String name,
//     String? description,
//     required List<String> participants,
//     required VoidCallback onSuccess,
//     required VoidCallback onError,
//   }) async {
//     if (createGroupLoading.value) return;
//     createGroupLoading.value = true;
//     var request = await chatRepository.createGroupe(
//       name: name,
//       creatorId: box.read("user-id"),
//       participants: participants,
//       description: description,
//     );
//     createGroupLoading.value = false;
//     request.fold((l) {
//       onError();
//     }, (r) {
//       onSuccess();
//     });
//   }

//   Future<void> getAllEmployeeByDepartAndServices() async {
//     var request = await chatRepository.getAllEmployee();
//     request.fold((l) {}, (r) {
//       employeesByDepartAndServices.value = r;
//     });

//     // List<MultiSelectNestedItem> l = [
//     //   MultiSelectNestedItem(
//     //     id: "1",
//     //     name: "name1",
//     //     children: [
//     //       MultiSelectNestedItem(
//     //         id: "1a",
//     //         name: "name1a",
//     //         children: [
//     //           MultiSelectNestedItem(
//     //             type: "employee",
//     //             id: "1aa",
//     //             name: "name1aa",
//     //             children: [],
//     //           ),
//     //         ],
//     //       ),
//     //       MultiSelectNestedItem(
//     //         id: "1b",
//     //         name: "name1b",
//     //         children: [],
//     //       )
//     //     ],
//     //   )
//     // ];
//     // employeesByDepartAndServices.value = l;
//   }

//   Future<void> navigateToCameraView(BuildContext context, mounted) async {
//     final cameras = await availableCameras();
//     if (!mounted) return;

//     Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => CameraView(cameras: cameras)),
//     );
//   }

//   Future<List<Attachment>?> pickAttachmentsFromGallery(
//     BuildContext context,
//     mounted, {
//     bool returnAttachments = false,
//   }) async {
//     if (Platform.isAndroid &&
//         (!await hasPermission(Permission.storage)) &&
//         (!await hasPermission(Permission.photos))) {
//       return null;
//     }

//     if (!context.mounted) return null;

//     if (Platform.isAndroid) {
//       Navigator.of(context).push(
//         MaterialPageRoute(
//           builder: (context) => Gallery(
//             title: 'Send to $otherUserContactName',
//           ),
//         ),
//       );
//       return null;
//     }

//     final key = showLoading(context);

//     List<File>? files = await pickMultimedia();
//     if (files == null) {
//       Navigator.pop(key.currentContext!);
//       return null;
//     }

//     final attachments = createAttachmentsFromFiles(files);
//     if (returnAttachments) {
//       Navigator.pop(key.currentContext!);
//       return attachments;
//     }

//     if (!mounted) return null;
//     Navigator.pop(key.currentContext!);
//     navigateToAttachmentSender(context, attachments);
//     return null;
//   }

//   Future<void> pickAudioFiles(BuildContext context, mounted) async {
//     final key = showLoading(context);

//     List<File>? files = await pickFiles(type: FileType.audio);
//     if (files == null) {
//       Navigator.pop(key.currentContext!);
//       return;
//     }

//     final attachments = createAttachmentsFromFiles(files);

//     if (!mounted) return;
//     Navigator.pop(key.currentContext!);
//     navigateToAttachmentSender(context, attachments);
//   }

//   Future<List<Attachment>?> pickDocuments(
//     BuildContext context,
//     mounted, {
//     bool returnAttachments = false,
//   }) async {
//     final key = showLoading(context);

//     List<File>? files = await pickFiles(type: FileType.any);
//     if (files == null) {
//       Navigator.pop(key.currentContext!);
//       return null;
//     }

//     final attachments = createAttachmentsFromFiles(
//       files,
//       areDocuments: true,
//     );

//     if (returnAttachments) {
//       Navigator.pop(key.currentContext!);
//       return attachments;
//     }

//     if (!mounted) return null;
//     Navigator.pop(key.currentContext!);
//     navigateToAttachmentSender(context, attachments);
//     return null;
//   }

//   GlobalKey showLoading(context) {
//     final dialogKey = GlobalKey();
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (ctx) {
//         return AlertDialog(
//           key: dialogKey,
//           content: Row(
//             children: [
//               const CircularProgressIndicator(),
//               const SizedBox(width: 24),
//               Text(
//                 'Preparing media',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Theme.of(context).custom.colorTheme.textColor2,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     return dialogKey;
//   }

//   Future<List<Attachment>> createAttachmentsFromFiles(
//     List<File> files, {
//     bool areDocuments = false,
//   }) async {
//     return await Future.wait(
//       files.map((file) async {
//         final type = areDocuments
//             ? AttachmentType.document
//             : AttachmentType.fromValue(
//                 lookupMimeType(file.path)?.split("/")[0].toUpperCase() ??
//                     'DOCUMENT',
//               );

//         double? width, height;
//         if (type == AttachmentType.image) {
//           (width, height) = await getImageDimensions(File(file.path));
//         } else if (type == AttachmentType.video) {
//           (width, height) = await getVideoDimensions(File(file.path));
//         }

//         final fileName = file.path.split("/").last;

//         return Attachment(
//           type: type,
//           url: "",
//           autoDownload:
//               type == AttachmentType.image || type == AttachmentType.voice,
//           fileName: fileName,
//           fileSize: await file.length(),
//           fileExtension: fileName.split(".").last,
//           width: width,
//           height: height,
//           file: file,
//         );
//       }),
//     );
//   }

//   void navigateToAttachmentSender(
//     BuildContext context,
//     Future<List<Attachment>> attachments,
//   ) {
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (_) => AttachmentMessageSender(
//           attachmentsFuture: attachments,
//         ),
//       ),
//     );
//   }
// }

// class CurrentChatModel {
//   final User? user;
//   final User? other;
//   final String? otherUserContactName;
//   final Group? group;

//   CurrentChatModel({
//     this.user,
//     this.other,
//     this.otherUserContactName,
//     this.group,
//   });
// }
