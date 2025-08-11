import 'dart:async';
import 'dart:typed_data';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
// Ajout pour le web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:video_player/video_player.dart';
import 'package:visitor_pass/Models/attachement.dart';
import 'package:visitor_pass/theme/theme.dart';

class AttachmentRenderer extends StatelessWidget {
  const AttachmentRenderer({
    super.key,
    required this.attachmentType,
    required this.bytes,
    this.fileName,
    this.fit = BoxFit.none,
    this.controllable = false,
    this.compact = false,
    this.fadeIn = false,
  });

  final AttachmentType attachmentType;
  final Uint8List bytes;
  final String? fileName;
  final BoxFit fit;
  final bool controllable;
  final bool compact;
  final bool fadeIn;

  @override
  Widget build(BuildContext context) {
    switch (attachmentType) {
      case AttachmentType.image:
        return ImageViewer(bytes: bytes, fit: fit);
      case AttachmentType.video:
        return VideoViewer(bytes: bytes, fileName: fileName, controllable: controllable);
      case AttachmentType.audio:
        return AudioViewer(bytes: bytes, fileName: fileName, controllable: controllable);
      default:
        return DocumentViewer(bytes: bytes, fileName: fileName, compact: compact);
    }
  }
}

class ImageViewer extends StatelessWidget {
  const ImageViewer({
    super.key,
    required this.bytes,
    required this.fit,
  });
  final Uint8List bytes;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.memory(
      bytes,
      fit: fit,
    );
  }
}

class VideoViewer extends StatefulWidget {
  const VideoViewer({
    super.key,
    required this.bytes,
    this.fileName,
    required this.controllable,
  });
  final Uint8List bytes;
  final String? fileName;
  final bool controllable;

  @override
  State<VideoViewer> createState() => _VideoViewerState();
}

class _VideoViewerState extends State<VideoViewer> {
  late final VideoPlayerController videoController;
  Timer timer = Timer(Duration.zero, () {});
  bool showControls = true;

  @override
  void initState() {
    if (kIsWeb) {
      // Sur le web, il faut utiliser un URL temporaire
      final blob = html.Blob([widget.bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      videoController = VideoPlayerController.networkUrl(Uri.parse(url));
    } else {
      // Sur mobile, VideoPlayerController.memory n'existe pas.
      // Il faudrait écrire les bytes dans un fichier temporaire puis utiliser VideoPlayerController.file
      // Pour l'instant, on affiche un widget d'erreur
      // throw UnimplementedError('Lecture vidéo depuis Uint8List non supportée sur mobile sans fichier.');
    }
    videoController.initialize().then((value) {
      if (widget.controllable) {
        videoController.play();
        showControls = false;
      }
      setState(() {});
    });
    videoController.addListener(playerListener);
    super.initState();
  }

  @override
  void dispose() {
    videoController.removeListener(playerListener);
    videoController.dispose();
    timer.cancel();
    super.dispose();
  }

  void playerListener() {
    if (videoController.value.position == videoController.value.duration) {
      videoController.seekTo(Duration.zero);
      setState(() {});
    }
  }

  void changePlayState() {
    if (videoController.value.isPlaying) {
      videoController.pause();
    } else {
      videoController.play();
    }
    toggleControls();
  }

  void toggleControls() {
    showControls = !showControls;
    if (timer.isActive) timer.cancel();
    timer = Timer(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        showControls = false;
      });
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (!videoController.value.isInitialized) {
      return SizedBox(
        width: videoController.value.size.width,
        height: videoController.value.size.height,
      );
    }
    Widget button = videoController.value.isPlaying
        ? CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 209, 208, 208),
            radius: 25,
            child: GestureDetector(
              onTap: () => changePlayState(),
              child: const Icon(
                Icons.pause_rounded,
                size: 30,
              ),
            ),
          )
        : CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 209, 208, 208),
            radius: 25,
            child: GestureDetector(
              onTap: () => changePlayState(),
              child: const Icon(
                Icons.play_arrow_rounded,
                size: 30,
              ),
            ),
          );
    return widget.controllable
        ? GestureDetector(
            onTap: toggleControls,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AspectRatio(
                  aspectRatio: videoController.value.aspectRatio,
                  child: VideoPlayer(videoController),
                ),
                if (showControls) ...[button],
              ],
            ),
          )
        : AspectRatio(
            aspectRatio: videoController.value.aspectRatio,
            child: VideoPlayer(videoController),
          );
  }
}

class AudioViewer extends StatefulWidget {
  const AudioViewer({
    super.key,
    required this.bytes,
    this.fileName,
    required this.controllable,
  });
  final Uint8List bytes;
  final String? fileName;
  final bool controllable;

  @override
  State<AudioViewer> createState() => _AudioViewerState();
}

class _AudioViewerState extends State<AudioViewer> {
  final player = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  void changePlayState() async {
    if (isPlaying) {
      await player.pause();
    } else {
      await player.play(BytesSource(widget.bytes));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.controllable
        ? GestureDetector(
            onTap: () => changePlayState(),
            child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.center,
              children: [
                Icon(
                  Icons.music_note_rounded,
                  size: MediaQuery.of(context).size.width * 0.80,
                ),
                if (!isPlaying) ...[
                  CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 209, 208, 208),
                    radius: 40,
                    child: IconButton(
                      padding: const EdgeInsets.all(0),
                      onPressed: () => changePlayState(),
                      icon: const Icon(
                        Icons.play_arrow_rounded,
                        size: 50,
                      ),
                    ),
                  )
                ],
              ],
            ),
          )
        : const Center(
            child: Icon(Icons.music_note_rounded),
          );
  }
}

class DocumentViewer extends StatelessWidget {
  const DocumentViewer({
    super.key,
    required this.bytes,
    this.fileName,
    this.compact = false,
  });
  final Uint8List bytes;
  final String? fileName;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final name = fileName ?? 'document';
    String displayName = name;
    if (displayName.length > 20) {
      displayName = "${displayName.substring(0, 15)}...${displayName.substring(15)}";
    }
    final fileExtension = displayName.split(".").last;
    final compactView = Container(
      width: 40,
      height: 50,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 233, 245, 245),
        borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Center(
        child: Text(
          fileExtension.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
      ),
    );
    return compact
        ? compactView
        : GestureDetector(
            onTap: () async {
              // Sur le web, on peut proposer un téléchargement
              if (kIsWeb) {
                final blob = html.Blob([bytes]);
                final url = html.Url.createObjectUrlFromBlob(blob);
                html.AnchorElement(href: url)
                  ..setAttribute('download', name)
                  ..click();
                html.Url.revokeObjectUrl(url);
              } else {
                // Sur mobile, on peut ouvrir le fichier avec OpenFile
                // Il faudrait d'abord sauvegarder bytes dans un fichier temporaire
                // (à implémenter selon besoin)
              }
            },
            child: Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                compactView,
                const SizedBox(
                  height: 8,
                ),
                Text(
                  displayName,
                  style: Theme.of(context)
                      .custom
                      .textTheme
                      .titleLarge
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                // Affichage de la taille non implémenté (Uint8List)
              ],
            )),
          );
  }
}
