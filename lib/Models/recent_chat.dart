// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:visitor_pass/Models/message.dart';
import 'package:visitor_pass/Models/user.dart';

part 'recent_chat.g.dart';

@HiveType(typeId: 6)
class Group {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? senderId;
  @HiveField(2)
  String? name;
  @HiveField(3)
  List<String>? members;

  Group({
    this.id,
    this.senderId,
    this.name,
    this.members,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'senderId': senderId,
      'members': members,
    };
  }

  factory Group.fromMap(Map<String, dynamic> map) {
    return Group(
      id: map['id'] as String,
      name: map['name'] as String,
      senderId: map['senderId'] as String,
      members: List<String>.from((map['members'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory Group.fromJson(String source) => Group.fromMap(json.decode(source) as Map<String, dynamic>);
}

@HiveType(typeId: 7)
class RecentChat {
  @HiveField(0)
  final Message message;
  @HiveField(1)
  User? user;
  @HiveField(2)
  int unreadCount;
  @HiveField(3)
  Group? group;

  RecentChat({
    required this.message,
    this.user, 
    this.group,
    this.unreadCount = 0,
  });

  factory RecentChat.fromMap(Map<String, dynamic> chatData) {
    return RecentChat(
      message: Message.fromMap(chatData['message']),
      user: chatData['user'] != null ? User.fromMap(chatData['user']) : null,
      group: chatData['group'] != null ? Group.fromMap(chatData['group']) : null,
      unreadCount: chatData['unreadCount'],
    );
  }

  @override
  String toString() {
    return 'Recent Chat =>  [${message.content}';
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message.toMap(),
      'user': user?.toMap(),
      'group': group?.toMap(),
      'unreadCount': unreadCount,
    };
  }
}