import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 11)
class Contact {
  @HiveField(0)
  String contactId;
  @HiveField(1)
  String displayName;
  @HiveField(2)
  String phoneNumber;
  @HiveField(3)
  String? avatarUrl;
  @HiveField(4)
  String? userId;

  Contact({
    required this.contactId,
    required this.displayName,
    required this.phoneNumber,
    this.avatarUrl,
    this.userId,
  });

  @override
  String toString() {
    return displayName;
  }
}
