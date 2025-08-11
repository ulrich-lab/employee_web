import 'package:hive/hive.dart';
import 'package:visitor_pass/Models/attachement.dart';
import 'package:visitor_pass/Models/recent_chat.dart';

part 'message.g.dart';

@HiveType(typeId: 1)
enum MessageStatus {
  @HiveField(0)
  pending('PENDING'),
  @HiveField(1)
  sent('SENT'),
  @HiveField(2)
  delivered('DELIVERED'),
  @HiveField(3)
  seen('SEEN');

  const MessageStatus(this.value);
  final String value;

  factory MessageStatus.fromValue(String value) {
    final res = MessageStatus.values.where(
      (element) => element.value == value,
    );

    if (res.isEmpty) {
      throw 'ValueError: $value is not a valid status code';
    }

    return res.first;
  }
}

@HiveType(typeId: 2)
class Message {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String content;
  @HiveField(2)
  final String senderId;
  @HiveField(3)
  String? receiverId;
  @HiveField(4)
  Group? group;
  @HiveField(5)
  final DateTime timestamp;
  @HiveField(6)
  final Attachment? attachment;
  @HiveField(7)
  MessageStatus status;

  Message({
    required this.id,
    required this.content,
    required this.senderId,
    this.receiverId,
    required this.timestamp,
    required this.status,
    this.attachment,
    this.group,
  });

  factory Message.fromMap(Map<String, dynamic> msgData) {
    return Message(
      id: msgData['id'],
      content: msgData['content'],
      group: msgData['group'],
      status: MessageStatus.fromValue(msgData['status']),
      senderId: msgData['senderId'],
      receiverId: msgData['receiverId'],
      timestamp: msgData['timestamp'],
      attachment: msgData["attachment"] != null
          ? Attachment.fromMap(msgData["attachment"])
          : null,
    );
  }

  Message copyWith({
    String? id,
    String? content,
    String? senderId,
    String? receiverId,
    Group? group,
    DateTime? timestamp,
    MessageStatus? status,
    Attachment? attachment,
  }) {
    return Message(
      id: id ?? this.id,
      content: content ?? this.content,
      group: group ?? this.group,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      timestamp: timestamp ?? this.timestamp,
      status: status ?? this.status,
      attachment: attachment ?? this.attachment,
    );
  }

  @override
  String toString() {
    return content;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'content': content,
      'group': group,
      'status': status.value,
      'senderId': senderId,
      'receiverId': receiverId,
      'timestamp': timestamp,
      "attachment": attachment?.toMap(),
    };
  }
}

enum MessageAction {
  statusUpdate('STATUS_UPDATE');

  const MessageAction(this.value);
  final String value;

  factory MessageAction.fromValue(String value) {
    final res = MessageAction.values.where(
      (element) => element.value == value,
    );

    if (res.isEmpty) {
      throw 'ValueError: $value is not a valid action';
    }

    return res.first;
  }
}

class SystemMessage {
  final String targetId;
  final MessageAction action;
  final String update;

  SystemMessage({
    required this.targetId,
    required this.action,
    required this.update,
  });

  factory SystemMessage.fromMap(Map<String, dynamic> msgData) {
    return SystemMessage(
      targetId: msgData['targetId'],
      action: MessageAction.fromValue(msgData['action']),
      update: msgData['update'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'targetId': targetId,
      'action': action.value,
      'update': update,
    };
  }
}
