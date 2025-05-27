// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/config/locator/isar_bd.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/theme/color_theme.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/utils/abc.dart';
// import 'package:visitor_pass/views/widget/recording_visualiser.dart';

// class VoiceRecorderField extends StatelessWidget {
//   VoiceRecorderField({
//     super.key,
//   });

//   ChatController _chatController = Get.put(locator<ChatController>());

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;

//     return Obx(() {
//       return Padding(
//         padding: const EdgeInsets.symmetric(
//           horizontal: 8.0,
//           vertical: 0,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 StreamBuilder(
//                   stream: _chatController.state.value.soundRecorder.onProgress,
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return Row(
//                         children: [
//                           const Padding(
//                             padding: EdgeInsets.symmetric(
//                               vertical: 12,
//                             ),
//                             child: Icon(
//                               Icons.mic,
//                               color: Colors.red,
//                               size: 24,
//                             ),
//                           ),
//                           Text(
//                             "0:00",
//                             style: TextStyle(
//                               fontSize: 18,
//                               color: Theme.of(context).brightness ==
//                                       Brightness.dark
//                                   ? colorTheme.iconColor
//                                   : colorTheme.textColor2,
//                             ),
//                           ),
//                         ],
//                       );
//                     }

//                     final data = snapshot.data!;
//                     final duration = data.duration;
//                     final showMic = duration.inMilliseconds % 1000 > 500;
//                     return Row(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 12,
//                           ),
//                           child: Icon(
//                             Icons.mic,
//                             color: showMic ? Colors.red : Colors.transparent,
//                             size: 24,
//                           ),
//                         ),
//                         const SizedBox(
//                           width: 12.0,
//                         ),
//                         Text(
//                           timeFromSeconds(
//                             duration.inSeconds,
//                             true,
//                           ),
//                           style: TextStyle(
//                             fontSize: 18,
//                             color:
//                                 Theme.of(context).brightness == Brightness.dark
//                                     ? colorTheme.iconColor
//                                     : colorTheme.textColor2,
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 )
//               ],
//             ),
//             Text(
//               "🚮 Slide to Delete",
//               style: TextStyle(
//                 color: Theme.of(context).brightness == Brightness.dark
//                     ? colorTheme.iconColor
//                     : colorTheme.textColor2,
//                 fontSize: 16,
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }

// class VoiceRecorder extends StatelessWidget {
//   VoiceRecorder({
//     super.key,
//     this.conversationId,
//     required this.is_groupe,
//   });

//   final String? conversationId;
//   final bool is_groupe;

//   ChatController _chatController = Get.put(locator<ChatController>());

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;
//     // final recordingState = ref.watch(
//     //   chatControllerProvider.select((s) => s.recordingState),
//     // );
//     // final recordingState = _chatController.state.value.recordingState;

//     return Obx(() {
//       return Container(
//         padding: const EdgeInsets.all(16),
//         color: Theme.of(context).brightness == Brightness.dark
//             ? AppColorsDark.appBarColor
//             : AppColorsLight.incomingMessageBubbleColor,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const RecordingVisualiser(),
//             const SizedBox(
//               height: 30,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     _chatController.cancelRecording();
//                   },
//                   child: const Icon(
//                     Icons.delete,
//                     size: 36,
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     if (_chatController.state.value.recordingState ==
//                         RecordingState.recordingLocked) {
//                       _chatController.pauseRecording();
//                     } else {
//                       _chatController.resumeRecording();
//                     }
//                   },
//                   child: _chatController.state.value.recordingState ==
//                           RecordingState.recordingLocked
//                       ? Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(width: 2, color: Colors.red),
//                             shape: BoxShape.circle,
//                           ),
//                           child: const Icon(
//                             Icons.pause_rounded,
//                             color: Colors.red,
//                             size: 30,
//                           ),
//                         )
//                       : const Icon(
//                           Icons.mic,
//                           color: Colors.red,
//                           size: 30,
//                         ),
//                 ),
//                 InkWell(
//                   onTap: () async {
//                     _chatController.onRecordingDone(is_groupe
//                         ? conversationId
//                         : await locator<IsarDb>()
//                                 .getConversationId(conversationId!) ??
//                             null);
//                   },
//                   child: CircleAvatar(
//                     radius: 21,
//                     backgroundColor: colorTheme.greenColor,
//                     child: const Icon(
//                       Icons.send,
//                       color: Colors.white,
//                     ),
//                   ),
//                 )
//               ],
//             )
//           ],
//         ),
//       );
//     });
//   }
// }
