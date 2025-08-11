import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show compute, kIsWeb;
import 'package:image/image.dart' as img;
import 'package:mime/mime.dart';

class CompressionService {
  static final CompressionService instance = CompressionService();

  // Compresse une image (Uint8List) et retourne le résultat compressé (Uint8List)
  Future<Uint8List> compressImageBytes(Uint8List bytes, {String? extension}) async {
    // Décodage de l'image
    final image = img.decodeImage(bytes);
    if (image == null) return bytes;

    final aspectRatio = image.width / image.height;
    double width, height;
    if (image.height > image.width) {
      height = min(1280, image.height * 1.0);
      width = aspectRatio * height;
    } else {
      width = min(1280, image.width * 1.0);
      height = width / aspectRatio;
    }
    final resized = img.copyResize(
      image,
      width: width.round(),
      height: height.round(),
      interpolation: img.Interpolation.linear,
    );
    // Encodage en JPEG compressé
    return Uint8List.fromList(img.encodeJpg(resized, quality: 50));
  }

  // Compresse une liste d'images (Uint8List)
  Future<List<Uint8List>> compressImages(List<Uint8List> images, {String? extension}) async {
    return Future.wait(images.map((bytes) => compressImageBytes(bytes, extension: extension)));
  }
}
