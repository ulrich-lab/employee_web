// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 9;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      name: fields[1] as String,
      avatarUrl: fields[2] as String?,
      phone: fields[3] as Phone,
      activityStatus: fields[4] as UserActivityStatus,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.phone)
      ..writeByte(4)
      ..write(obj.activityStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PhoneAdapter extends TypeAdapter<Phone> {
  @override
  final int typeId = 10;

  @override
  Phone read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Phone(
      code: fields[0] as String?,
      number: fields[1] as String?,
      formattedNumber: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Phone obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.code)
      ..writeByte(1)
      ..write(obj.number)
      ..writeByte(2)
      ..write(obj.formattedNumber);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PhoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserActivityStatusAdapter extends TypeAdapter<UserActivityStatus> {
  @override
  final int typeId = 8;

  @override
  UserActivityStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserActivityStatus.online;
      case 1:
        return UserActivityStatus.offline;
      default:
        return UserActivityStatus.online;
    }
  }

  @override
  void write(BinaryWriter writer, UserActivityStatus obj) {
    switch (obj) {
      case UserActivityStatus.online:
        writer.writeByte(0);
        break;
      case UserActivityStatus.offline:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserActivityStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
