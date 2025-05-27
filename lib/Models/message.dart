// import 'package:visitor_pass/Models/attachement.dart';
// import 'package:visitor_pass/Models/recent_chat.dart';

// enum MessageStatus {
//   pending('PENDING'),
//   sent('SENT'),
//   delivered('DELIVERED'),
//   seen('SEEN');

//   const MessageStatus(this.value);
//   final String value;

//   factory MessageStatus.fromValue(String value) {
//     final res = MessageStatus.values.where(
//       (element) => element.value == value,
//     );

//     if (res.isEmpty) {
//       throw 'ValueError: $value is not a valid status code';
//     }

//     return res.first;
//   }
// }

// class Message {
//   final String id;
//   final String content;
//   final String senderId;
//   String? receiverId;
//   Group? group;
//   final DateTime timestamp;
//   final Attachment? attachment;
//   MessageStatus status;

//   Message({
//     required this.id,
//     required this.content,
//     required this.senderId,
//     this.receiverId,
//     required this.timestamp,
//     required this.status,
//     this.attachment,
//     this.group,
//   });

//   factory Message.fromMap(Map<String, dynamic> msgData) {
//     return Message(
//       id: msgData['id'],
//       content: msgData['content'],
//       group: msgData['group'],
//       status: MessageStatus.fromValue(msgData['status']),
//       senderId: msgData['senderId'],
//       receiverId: msgData['receiverId'],
//       timestamp: msgData['timestamp'],
//       attachment: msgData["attachment"] != null
//           ? Attachment.fromMap(msgData["attachment"])
//           : null,
//     );
//   }

//   Message copyWith({
//     String? id,
//     String? content,
//     String? senderId,
//     String? receiverId,
//     Group? group,
//     DateTime? timestamp,
//     MessageStatus? status,
//     Attachment? attachment,
//   }) {
//     return Message(
//       id: id ?? this.id,
//       content: content ?? this.content,
//       group: group ?? this.group,
//       senderId: senderId ?? this.senderId,
//       receiverId: receiverId ?? this.receiverId,
//       timestamp: timestamp ?? this.timestamp,
//       status: status ?? this.status,
//       attachment: attachment ?? this.attachment,
//     );
//   }

//   @override
//   String toString() {
//     return content;
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'content': content,
//       'group': group,
//       'status': status.value,
//       'senderId': senderId,
//       'receiverId': receiverId,
//       'timestamp': timestamp,
//       "attachment": attachment?.toMap(),
//     };
//   }
// }

// enum MessageAction {
//   statusUpdate('STATUS_UPDATE');

//   const MessageAction(this.value);
//   final String value;

//   factory MessageAction.fromValue(String value) {
//     final res = MessageAction.values.where(
//       (element) => element.value == value,
//     );

//     if (res.isEmpty) {
//       throw 'ValueError: $value is not a valid action';
//     }

//     return res.first;
//   }
// }

// class SystemMessage {
//   final String targetId;
//   final MessageAction action;
//   final String update;

//   SystemMessage({
//     required this.targetId,
//     required this.action,
//     required this.update,
//   });

//   factory SystemMessage.fromMap(Map<String, dynamic> msgData) {
//     return SystemMessage(
//       targetId: msgData['targetId'],
//       action: MessageAction.fromValue(msgData['action']),
//       update: msgData['update'],
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return {
//       'targetId': targetId,
//       'action': action.value,
//       'update': update,
//     };
//   }
// }
