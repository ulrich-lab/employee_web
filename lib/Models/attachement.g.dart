// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachement.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttachmentAdapter extends TypeAdapter<Attachment> {
  @override
  final int typeId = 5;

  @override
  Attachment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attachment(
      type: fields[1] as AttachmentType,
      url: fields[8] as String,
      fileName: fields[0] as String,
      fileSize: fields[7] as int,
      fileExtension: fields[6] as String,
      uploadStatus: fields[4] as UploadStatus,
      autoDownload: fields[5] as bool,
      width: fields[2] as double?,
      height: fields[3] as double?,
      samples: (fields[9] as List?)?.cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, Attachment obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.fileName)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.width)
      ..writeByte(3)
      ..write(obj.height)
      ..writeByte(4)
      ..write(obj.uploadStatus)
      ..writeByte(5)
      ..write(obj.autoDownload)
      ..writeByte(6)
      ..write(obj.fileExtension)
      ..writeByte(7)
      ..write(obj.fileSize)
      ..writeByte(8)
      ..write(obj.url)
      ..writeByte(9)
      ..write(obj.samples);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AttachmentTypeAdapter extends TypeAdapter<AttachmentType> {
  @override
  final int typeId = 3;

  @override
  AttachmentType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return AttachmentType.document;
      case 1:
        return AttachmentType.image;
      case 2:
        return AttachmentType.audio;
      case 3:
        return AttachmentType.voice;
      case 4:
        return AttachmentType.video;
      default:
        return AttachmentType.document;
    }
  }

  @override
  void write(BinaryWriter writer, AttachmentType obj) {
    switch (obj) {
      case AttachmentType.document:
        writer.writeByte(0);
        break;
      case AttachmentType.image:
        writer.writeByte(1);
        break;
      case AttachmentType.audio:
        writer.writeByte(2);
        break;
      case AttachmentType.voice:
        writer.writeByte(3);
        break;
      case AttachmentType.video:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UploadStatusAdapter extends TypeAdapter<UploadStatus> {
  @override
  final int typeId = 4;

  @override
  UploadStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UploadStatus.notUploading;
      case 1:
        return UploadStatus.preparing;
      case 2:
        return UploadStatus.uploading;
      case 3:
        return UploadStatus.uploaded;
      default:
        return UploadStatus.notUploading;
    }
  }

  @override
  void write(BinaryWriter writer, UploadStatus obj) {
    switch (obj) {
      case UploadStatus.notUploading:
        writer.writeByte(0);
        break;
      case UploadStatus.preparing:
        writer.writeByte(1);
        break;
      case UploadStatus.uploading:
        writer.writeByte(2);
        break;
      case UploadStatus.uploaded:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
