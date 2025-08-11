// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_chat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupAdapter extends TypeAdapter<Group> {
  @override
  final int typeId = 6;

  @override
  Group read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Group(
      id: fields[0] as String?,
      senderId: fields[1] as String?,
      name: fields[2] as String?,
      members: (fields[3] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Group obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.senderId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.members);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecentChatAdapter extends TypeAdapter<RecentChat> {
  @override
  final int typeId = 7;

  @override
  RecentChat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentChat(
      message: fields[0] as Message,
      user: fields[1] as User?,
      group: fields[3] as Group?,
      unreadCount: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, RecentChat obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.unreadCount)
      ..writeByte(3)
      ..write(obj.group);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
