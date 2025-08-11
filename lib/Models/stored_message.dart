import 'package:hive/hive.dart';
import 'package:visitor_pass/Models/attachement.dart';
import 'package:visitor_pass/Models/recent_chat.dart';
import 'package:visitor_pass/Models/message.dart';

part 'stored_message.g.dart';

@HiveType(typeId: 20)
class StoredMessage {
  @HiveField(0)
  String chatId;
  @HiveField(1)
  String messageId;
  @HiveField(2)
  String content;
  @HiveField(3)
  String senderId;
  @HiveField(4)
  String? receiverId;
  @HiveField(5)
  String? conversationId;
  @HiveField(6)
  Group? group;
  @HiveField(7)
  DateTime timestamp;
  @HiveField(8)
  Attachment? attachment;
  @HiveField(9)
  MessageStatus status;

  StoredMessage({
    required this.chatId,
    required this.messageId,
    required this.content,
    required this.senderId,
    this.receiverId,
    this.conversationId,
    this.group,
    required this.timestamp,
    this.attachment,
    required this.status,
  });

  factory StoredMessage.fromMessage(Message msg) {
    return StoredMessage(
      chatId: msg.group != null ? msg.group!.id! : StoredMessage.getChatId(msg.senderId, msg.receiverId!),
      messageId: msg.id,
      content: msg.content,
      senderId: msg.senderId,
      receiverId: msg.receiverId,
      conversationId: msg.group != null
          ? msg.group!.id!
          : getChatId(msg.senderId, msg.receiverId!),
      group: msg.group,
      timestamp: msg.timestamp,
      attachment: msg.attachment,
      status: msg.status,
    );
  }

  Message toMessage() {
    return Message(
      id: messageId,
      content: content,
      senderId: senderId,
      receiverId: receiverId,
      group: group,
      timestamp: timestamp,
      attachment: attachment,
      status: status,
    );
  }

  static String getChatId(String senderId, String receiverId) {
    return senderId.compareTo(receiverId) < 0
        ? '$senderId-$receiverId'
        : '$receiverId-$senderId';
  }
} 