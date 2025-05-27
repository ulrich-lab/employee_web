import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

class DownloadService {

  static final DownloadService instance = DownloadService._internal();

  final Map<String, dynamic> _downloadTasks = {}; 

  DownloadService._internal();


  Future<void> download({
    required String taskId,
    required String url,
    required String path,
    required void Function() onDownloadComplete,
    required void Function() onDownloadError,
  }) async {
    try {
     
      if (url.startsWith("gs://")) {
        
      } else {
      
        Dio dio = Dio();
        final cancelToken = CancelToken(); 
        _downloadTasks[taskId] = cancelToken;

        await dio.download(
          url,
          path,
          cancelToken: cancelToken,
          onReceiveProgress: (received, total) {
            if (total != -1) {
            }
          },
        );

        _downloadTasks.remove(taskId);
        onDownloadComplete();
      }
    } catch (e) {
      _downloadTasks.remove(taskId);
      // if (CancelToken.isCancel(e)) {
      //   onDownloadError("Download cancelled for $taskId");
      // } else {
      //   onDownloadError(e.toString());
      // }
    }
  }

  
  Future<void> cancelDownload(String taskId) async {
    final task = _downloadTasks[taskId];
    if (task == null) return;

    try {
      // if (task is DownloadTask) {
      //   await task.cancel(); 
      // } else if (task is CancelToken) {
      //   task.cancel("Download cancelled by user."); 
      // }
      // _downloadTasks.remove(taskId);
    } catch (e) {
      print("Error while canceling task $taskId: $e");
    }
  }

  /// Get a stream of download progress for a Firebase task
  // Stream<TaskSnapshot>? getDownloadStream(String taskId) {
  //   final task = _downloadTasks[taskId];
  //   return task is DownloadTask ? task.snapshotEvents : null;
  // }
}
