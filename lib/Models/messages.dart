// import 'package:isar/isar.dart';
// import 'package:visitor_pass/Models/attachement.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/Models/recent_chat.dart';


// part 'messages.g.dart';

// @collection
// class StoredMessage {
//   Id id = Isar.autoIncrement;
//   String messageId;
//   String conversationId;
//   String chatId;
//   String content;
//   String senderId;
//   String? receiverId;
//   DateTime timestamp;
//   Group? group;
//   EmbeddedAttachment? attachment;

//   @Enumerated(EnumType.value, 'value')
//   MessageStatus status;

//   StoredMessage({
//     required this.conversationId,
//     required this.messageId,
//     required this.chatId,
//     required this.content,
//     required this.senderId,
//      this.receiverId,
//     required this.timestamp,
//     required this.status,
//     this.attachment,
//     this.group
//   });
// }

// @embedded
// class EmbeddedAttachment {
//   String? fileName;
//   String? fileExtension;
//   int? fileSize;
//   double? width;
//   double? height;
//   String? url;
//   List<double>? samples;
//   bool? autoDownload;

//   @Enumerated(EnumType.value, 'value')
//   UploadStatus? uploadStatus;

//   @Enumerated(EnumType.value, 'value')
//   AttachmentType? type;

//   EmbeddedAttachment({
//     this.fileName,
//     this.fileExtension,
//     this.fileSize,
//     this.width,
//     this.height,
//     this.url,
//     this.uploadStatus,
//     this.autoDownload,
//     this.type,
//     this.samples,
//   });
// }
