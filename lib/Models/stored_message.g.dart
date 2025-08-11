// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StoredMessageAdapter extends TypeAdapter<StoredMessage> {
  @override
  final int typeId = 20;

  @override
  StoredMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StoredMessage(
      chatId: fields[0] as String,
      messageId: fields[1] as String,
      content: fields[2] as String,
      senderId: fields[3] as String,
      receiverId: fields[4] as String?,
      group: fields[5] as Group?,
      timestamp: fields[6] as DateTime,
      attachment: fields[7] as Attachment?,
      status: fields[8] as MessageStatus,
    );
  }

  @override
  void write(BinaryWriter writer, StoredMessage obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.chatId)
      ..writeByte(1)
      ..write(obj.messageId)
      ..writeByte(2)
      ..write(obj.content)
      ..writeByte(3)
      ..write(obj.senderId)
      ..writeByte(4)
      ..write(obj.receiverId)
      ..writeByte(5)
      ..write(obj.group)
      ..writeByte(6)
      ..write(obj.timestamp)
      ..writeByte(7)
      ..write(obj.attachment)
      ..writeByte(8)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StoredMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
