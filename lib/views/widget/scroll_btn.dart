// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/theme/theme.dart';


// class ScrollButton extends StatefulWidget {
//   const ScrollButton({super.key, required this.scrollController});
//   final ScrollController scrollController;

//   @override
//   State<ScrollButton> createState() => _ScrollButtonState();
// }

// class _ScrollButtonState extends State<ScrollButton> {
//   ChatController _chatController = Get.put(locator<ChatController>());
//   @override
//   void initState() {
//     widget.scrollController.addListener(scrollListener);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     widget.scrollController.removeListener(scrollListener);
//     super.dispose();
//   }

//   void scrollListener() {
//     final position = widget.scrollController.position;
//     final diff = position.pixels - position.minScrollExtent;
//     final showScrollBtn = _chatController.state.value.showScrollBtn;

//     if (showScrollBtn && diff > 80) {
//       return;
//     }

//     if (showScrollBtn && diff <= 80) {
//       _chatController.toggleScrollBtnVisibility();
//       return;
//     }

//     if (showScrollBtn || diff <= 80) return;
//     _chatController.toggleScrollBtnVisibility();
//   }

//   void handleScrollBtnClick() {
//     widget.scrollController.animateTo(
//       widget.scrollController.position.minScrollExtent,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeOutCubic,
//     );

//     _chatController.toggleScrollBtnVisibility();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final showScrollBtn = _chatController.state.value.showScrollBtn;
//     final unreadCount = _chatController.state.value.unreadCount;

//     return showScrollBtn
//         ? GestureDetector(
//             onTap: handleScrollBtnClick,
//             child: Stack(
//               alignment: Alignment.topLeft,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(6),
//                   margin: const EdgeInsets.symmetric(
//                     horizontal: 12,
//                     vertical: 8,
//                   ),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: Theme.of(context).custom.colorTheme.appBarColor,
//                     boxShadow: const [
//                       BoxShadow(
//                         offset: Offset(0, 2),
//                         blurRadius: 4,
//                         color: Colors.black38,
//                       )
//                     ],
//                   ),
//                   child: const Icon(Icons.keyboard_double_arrow_down),
//                 ),
//                 if (unreadCount > 0) ...[
//                   Container(
//                     padding: const EdgeInsets.all(6),
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).custom.colorTheme.greenColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: Text(
//                       unreadCount.toString(),
//                       style: const TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           )
//         : Container();
//   }
// }
