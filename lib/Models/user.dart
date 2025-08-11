import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 8)
enum UserActivityStatus {
  @HiveField(0)
  online('Online'),
  @HiveField(1)
  offline('Offline');

  const UserActivityStatus(this.value);
  final String value;

  factory UserActivityStatus.fromValue(String value) {
    final res = UserActivityStatus.values.where(
      (element) => element.value == value,
    );

    if (res.isEmpty) {
      throw 'ValueError: $value is not a valid status code';
    }

    return res.first;
  }
}

@HiveType(typeId: 9)
class User {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String? avatarUrl;
  @HiveField(3)
  final Phone phone;
  @HiveField(4)
  UserActivityStatus activityStatus;

  User({
    required this.id,
    required this.name,
    this.avatarUrl,
    required this.phone,
    required this.activityStatus,
  });

  factory User.fromMap(Map<String, dynamic> userData) {
    return User(
      id: userData['id'],
      name: userData['name'],
      avatarUrl: userData['avatarUrl'],
      phone: Phone.fromMap(userData['phone']),
      activityStatus: UserActivityStatus.fromValue(userData['activityStatus']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'avatarUrl': avatarUrl,
      'phone': phone.toMap(),
      'activityStatus': activityStatus.value,
    };
  }

  @override
  String toString() {
    return name;
  }
}

@HiveType(typeId: 10)
class Phone {
  @HiveField(0)
  String? code;
  @HiveField(1)
  String? number;
  @HiveField(2)
  String? formattedNumber;

  Phone({
    this.code,
    this.number,
    this.formattedNumber,
  });

  String getFormattedNumber() => formattedNumber ?? '$code $number';
  String get rawNumber => '$code$number';

  factory Phone.fromMap(Map<String, dynamic> phoneData) {
    return Phone(
      code: phoneData['code'],
      number: phoneData['number'],
      formattedNumber: phoneData['formattedNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'number': number,
      'formattedNumber': formattedNumber,
      'rawNumber': rawNumber,
    };
  }
}
