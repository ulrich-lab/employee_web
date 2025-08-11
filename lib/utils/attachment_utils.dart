import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'abc.dart';

// Helper pour le résultat multiplateforme
// fileName: nom du fichier, bytes: contenu du fichier
class PickedFileResult {
  final String fileName;
  final Uint8List bytes;
  PickedFileResult({required this.fileName, required this.bytes});
}

Future<List<PickedFileResult>?> pickMultimedia() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
  if (result != null) {
    return result.files
        .where((e) => e.bytes != null)
        .map((e) => PickedFileResult(fileName: e.name, bytes: e.bytes!))
        .toList();
  }
  return null;
}

Future<PickedFileResult?> pickImageFromGallery() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
  if (result != null && result.files.isNotEmpty && result.files.first.bytes != null) {
    final file = result.files.first;
    return PickedFileResult(fileName: file.name, bytes: file.bytes!);
  }
  return null;
}

Future<PickedFileResult?> capturePhoto() async {
  // Sur le web, pas de capture directe, fallback sur pickImageFromGallery
  return await pickImageFromGallery();
}

Future<List<PickedFileResult>?> pickFiles({
  required FileType type,
}) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(type: type, allowMultiple: true);
  if (result != null) {
    return result.files
        .where((e) => e.bytes != null)
        .map((e) => PickedFileResult(fileName: e.name, bytes: e.bytes!))
        .toList();
  }
  return null;
}
