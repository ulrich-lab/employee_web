import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:hive/hive.dart';

part 'attachement.g.dart';

@HiveType(typeId: 3)
enum AttachmentType {
  @HiveField(0)
  document("DOCUMENT"),
  @HiveField(1)
  image("IMAGE"),
  @HiveField(2)
  audio("AUDIO"),
  @HiveField(3)
  voice("VOICE"),
  @HiveField(4)
  video("VIDEO");

  const AttachmentType(this.value);
  final String value;

  factory AttachmentType.fromValue(String value) {
    final res = AttachmentType.values.where(
      (element) => element.value == value,
    );

    if (res.isEmpty) {
      throw 'ValueError: $value is not a valid attachment type';
    }

    return res.first;
  }
}

@HiveType(typeId: 4)
enum UploadStatus {
  @HiveField(0)
  notUploading("NOT_UPLOADING"),
  @HiveField(1)
  preparing("PREPARING"),
  @HiveField(2)
  uploading("UPLOADING"),
  @HiveField(3)
  uploaded("UPLOADED");

  const UploadStatus(this.value);
  final String value;
  factory UploadStatus.fromValue(String value) {
    final res = UploadStatus.values.where(
      (element) => element.value == value,
    );

    if (res.isEmpty) {
      throw 'ValueError: $value is not a valid upload status';
    }

    return res.first;
  }
}

@HiveType(typeId: 5)
class Attachment {
  @HiveField(0)
  final String fileName;
  @HiveField(1)
  final AttachmentType type;
  @HiveField(2)
  final double? width;
  @HiveField(3)
  final double? height;
  @HiveField(4)
  UploadStatus uploadStatus;
  @HiveField(5)
  bool autoDownload;
  @HiveField(6)
  String fileExtension;
  @HiveField(7)
  int fileSize;
  @HiveField(8)
  String url;
  @HiveField(9)
  List<double>? samples;
  // Sur mobile : File
  // Sur web : Uint8List
  dynamic file; // Peut être File (mobile) ou Uint8List (web)

  Attachment({
    required this.type,
    required this.url,
    required this.fileName,
    required this.fileSize,
    required this.fileExtension,
    this.uploadStatus = UploadStatus.notUploading,
    this.autoDownload = false,
    this.width,
    this.height,
    this.file,
    this.samples,
  });

  factory Attachment.fromMap(Map<String, dynamic> data) {
    return Attachment(
      url: data["url"],
      fileName: data["fileName"],
      fileSize: data["fileSize"],
      fileExtension: data["fileExtension"],
      width: data["width"] != null ? data["width"] : null,
      height: data["height"] != null ? data["height"] : null,
      type: AttachmentType.fromValue(data["type"]),
      uploadStatus: UploadStatus.fromValue(data["uploadStatus"]),
      autoDownload: data["autoDownload"] ?? false,
      samples: data["samples"] != null
          ? List.castFrom<dynamic, double>(data["samples"])
          : null,
    );
  }

  factory Attachment.fromJson(Map<String, dynamic> data) {
    return Attachment(
      url: data["url"],
      fileName: data["fileName"],
      fileSize: int.tryParse(data["fileSize"]) ?? 450000,
      fileExtension: data["fileExtension"],
      width: double.tryParse(data["width"]),
      height: double.tryParse(data["height"]),
      type: AttachmentType.fromValue(data["type"]),
      uploadStatus: UploadStatus.fromValue(data["uploadStatus"]),
      autoDownload: data["autoDownload"] ?? false,
      samples: json.decode(data["samples"]) != null
          ? List.castFrom<dynamic, double>(json.decode(data["samples"]))
          : null,
    );
  }

  @override
  String toString() {
    return fileName;
  }

  Map<String, dynamic> toMap() {
    return {
      "url": url,
      "fileName": fileName,
      "fileSize": fileSize,
      "fileExtension": fileExtension,
      "type": type.value,
      "uploadStatus": uploadStatus.value,
      "autoDownload": autoDownload,
      "width": width,
      "height": height,
      "samples": samples,
    };
  }
}
