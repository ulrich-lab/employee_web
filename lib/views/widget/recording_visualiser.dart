// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/utils/abc.dart';
// import 'package:visitor_pass/views/widget/painters.dart';
// import 'package:visitor_pass/config/locator/locator.dart';

// class RecordingVisualiser extends StatefulWidget {
//   const RecordingVisualiser({
//     super.key,
//   });

//   @override
//   State<RecordingVisualiser> createState() => _RecordingVisualiserState();
// }

// class _RecordingVisualiserState extends State<RecordingVisualiser> {
//   ChatController _chatController = Get.put(locator<ChatController>());
//   final List<double> samples = [];
//   static const maxHeight = 24.0;

//   @override
//   Widget build(BuildContext context) {
//     final liveWaveColor = Theme.of(context).brightness == Brightness.dark
//         ? Colors.white70
//         : Colors.black54;

//     return Obx(() {
//       final data = _chatController.state.value.recordingSamples;
//       final duration = data.last.duration;
//       samples.add(data.last.decibels ?? 0);
//       return Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 6),
//             child: Text(
//               timeFromSeconds(
//                 duration.inSeconds,
//                 true,
//               ),
//               style: const TextStyle(
//                 fontSize: 18,
//               ),
//             ),
//           ),
//           const SizedBox(width: 24),
//           Expanded(
//             child: LayoutBuilder(
//               builder: (context, constraints) {
//                 final maxSampleCount = constraints.maxWidth ~/ 5;

//                 return CustomPaint(
//                   painter: WaveformPainter(
//                     maxHeight: maxHeight,
//                     waveColor: liveWaveColor,
//                     reverse: true,
//                     samples: samples
//                         .getRange(
//                           samples.length > maxSampleCount
//                               ? samples.length - maxSampleCount
//                               : 0,
//                           samples.length,
//                         )
//                         .toList(),
//                   ),
//                   size: Size(constraints.maxWidth, maxHeight),
//                 );
//               },
//             ),
//           ),
//         ],
//       );
//     });
//   }
// }
