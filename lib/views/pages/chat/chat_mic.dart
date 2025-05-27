// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/config/locator/isar_bd.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/theme/theme.dart';

// class ChatInputMic extends StatelessWidget {
//   ChatInputMic({
//     super.key,
//     this.conversationId,
//     required this.is_group,
//   });
//   final String? conversationId;
//   final bool is_group;

//   ChatController _chatController = Get.put(locator<ChatController>());

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;
//     // final recordingState = ref.watch(
//     //   chatControllerProvider.select((s) => s.recordingState),
//     // );
//     final recordingState = _chatController.state.value.recordingState;

//     return GestureDetector(
//       onLongPress: _chatController.startRecording,
//       onLongPressUp: () async {
//         if (recordingState == RecordingState.notRecording) {
//           return;
//         }
//         _chatController.onRecordingDone(is_group?conversationId:
//             await locator<IsarDb>().getConversationId(conversationId!) ?? null);
//       },
//       onLongPressMoveUpdate: (details) async {
//         _chatController.onMicDragLeft(
//           details.globalPosition.dx,
//           MediaQuery.of(context).size.width,
//         );

//         _chatController.onMicDragUp(
//           details.globalPosition.dy,
//           MediaQuery.of(context).size.height,
//         );
//       },
//       child: recordingState == RecordingState.notRecording
//           ? CircleAvatar(
//               radius: 24,
//               backgroundColor: colorTheme.greenColor,
//               child: const Icon(
//                 Icons.mic,
//                 color: Colors.white,
//               ),
//             )
//           : Container(
//               decoration: BoxDecoration(
//                 color: colorTheme.appBarColor,
//                 borderRadius: BorderRadius.circular(24),
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   CircleAvatar(
//                     radius: 24,
//                     backgroundColor: colorTheme.appBarColor,
//                     child: const Icon(
//                       Icons.lock_outline_rounded,
//                       color: Colors.white,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   CircleAvatar(
//                     radius: 24,
//                     backgroundColor: colorTheme.greenColor,
//                     child: const Icon(
//                       Icons.mic,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }
