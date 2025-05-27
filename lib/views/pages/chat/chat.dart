// import 'dart:async';
// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:visibility_detector/visibility_detector.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/Models/recent_chat.dart';
// import 'package:visitor_pass/Models/user.dart';
// import 'package:visitor_pass/config/locator/isar_bd.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/theme/color_theme.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/utils/abc.dart';
// import 'package:visitor_pass/views/pages/chat/chat_mic.dart';
// import 'package:visitor_pass/views/widget/attachment_picker.dart';
// import 'package:visitor_pass/views/widget/bottom_inset.dart';
// import 'package:visitor_pass/views/widget/chat_date.dart';
// import 'package:visitor_pass/views/widget/chat_field.dart';
// import 'package:visitor_pass/views/widget/emoji_picker.dart';
// import 'package:visitor_pass/views/widget/message_cards.dart';
// import 'package:visitor_pass/views/widget/scroll_btn.dart';
// import 'package:visitor_pass/views/widget/unread_banner.dart';
// import 'package:visitor_pass/views/widget/voice_recorder.dart';

// class ChatPage extends StatefulWidget {
//   final User self;
//   final User? other;
//   final String otherUserContactName;
//   Group? group;

//   ChatPage({
//     super.key,
//     this.group,
//     required this.self,
//     this.other,
//     required this.otherUserContactName,
//   });

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {
//   final ChatController chatController = Get.put(locator<ChatController>());
//   @override
//   void initState() {
//     chatController.initUsers(
//       self: widget.self,
//       other: widget.other,
//       otherUserContactName: widget.otherUserContactName,
//       group: widget.group,
//     );
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final self = widget.self;
//     final other = widget.other;
//     final group = widget.group;

//     return Obx(
//       () {
//         final recordingState = chatController.state.value.recordingState;
//         return Scaffold(
//           resizeToAvoidBottomInset: false,
//           appBar: ScreenSize(context).mainWidth > 640
//               ? null
//               : AppBar(
//                   titleSpacing: 0.0,
//                   title: Row(
//                     children: [
//                       widget.group != null
//                           ? CircleAvatar(
//                               backgroundColor: Theme.of(context)
//                                   .custom
//                                   .colorTheme
//                                   .greenColor,
//                               child: const Icon(
//                                 Icons.people,
//                                 color: Colors.white,
//                               ),
//                             )
//                           : CircleAvatar(
//                               maxRadius: 18,
//                               backgroundImage:
//                                   CachedNetworkImageProvider(other!.avatarUrl),
//                             ),
//                       const SizedBox(
//                         width: 8.0,
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             width: 0.35.sw,
//                             child: Text(
//                               widget.group != null
//                                   ? widget.group!.name!
//                                   : widget.otherUserContactName,
//                               style: Theme.of(context)
//                                   .custom
//                                   .textTheme
//                                   .titleMedium,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                           // StreamBuilder<UserActivityStatus>(
//                           //   stream: userActivityStatusStream(userId: other.id),
//                           //   builder: (context, snapshot) {
//                           //     if (!snapshot.hasData) {
//                           //       return Container();
//                           //     }

//                           //     return snapshot.data!.value == 'Online'
//                           //         ? Text(
//                           //             'Online',
//                           //             style:
//                           //                 Theme.of(context).custom.textTheme.caption,
//                           //           )
//                           //         : Container();
//                           //   },
//                           // ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   leadingWidth: 36.0,
//                   leading: IconButton(
//                     onPressed: () => chatController.navigateToHome(context),
//                     icon: const Icon(
//                       Icons.arrow_back,
//                       size: 24,
//                     ),
//                   ),
//                   actions: [
//                     group != null
//                         ? SizedBox()
//                         : IconButton(
//                             onPressed: recordingState ==
//                                     RecordingState.notRecording
//                                 ? () {
//                                     _makePhoneCall(other!.phone.number ?? "");
//                                   }
//                                 : null,
//                             icon: const Icon(
//                               Icons.videocam_rounded,
//                               size: 28,
//                               color: Colors.white,
//                             ),
//                           ),
//                     group != null
//                         ? SizedBox()
//                         : IconButton(
//                             onPressed: recordingState ==
//                                     RecordingState.notRecording
//                                 ? () {
//                                     _makePhoneCall(other!.phone.number ?? "");
//                                   }
//                                 : null,
//                             icon: const Icon(
//                               Icons.call,
//                               color: Colors.white,
//                               size: 24,
//                             ),
//                           ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: const Icon(
//                         Icons.more_vert,
//                         color: Colors.white,
//                         size: 26,
//                       ),
//                     ),
//                   ],
//                 ),
//           body: Container(
//             child: Row(
//               children: [
//                 Flexible(
//                   flex: 5,
//                   child: Container(),
//                 ),
//                 Flexible(
//                   flex: 5,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 40),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: SvgPicture.asset(
//                               Images.backArrow,
//                               height: 24,
//                               width: 24,
//                             ),
//                             onPressed: () {
//                               Get.back();
//                             },
//                           ),
//                           SizedBox(width: 20),
//                           widget.group != null
//                               ? CircleAvatar(
//                                   backgroundColor: Theme.of(context)
//                                       .custom
//                                       .colorTheme
//                                       .greenColor,
//                                   child: const Icon(
//                                     Icons.people,
//                                     color: Colors.white,
//                                   ),
//                                 )
//                               : CircleAvatar(
//                                   maxRadius: 18,
//                                   backgroundImage: CachedNetworkImageProvider(
//                                       other!.avatarUrl),
//                                 ),
//                           const SizedBox(
//                             width: 8.0,
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               SizedBox(
//                                 width: 0.2.sw,
//                                 child: Text(
//                                   widget.group != null
//                                       ? widget.group!.name!
//                                       : widget.otherUserContactName,
//                                   style: Theme.of(context)
//                                       .custom
//                                       .textTheme
//                                       .titleMedium,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 40),
//                       Expanded(
//                         child: Platform.isIOS && ScreenUtil().screenWidth > 640
//                             ? GestureDetector(
//                                 onTap: () {
//                                   SystemChannels.textInput.invokeMethod(
//                                     "TextInput.hide",
//                                   );
//                                   chatController.setShowEmojiPicker(false);
//                                 },
//                                 child: ChatStream(group: widget.group),
//                               )
//                             : ChatStream(group: widget.group),
//                       ),
//                       const SizedBox(height: 4.0),
//                       ChatInputContainer(
//                         self: self,
//                         other: other,
//                         group: widget.group,
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Stream<UserActivityStatus> userActivityStatusStream(
//       {required userId}) async* {}

//   Future<void> _makePhoneCall(String phoneNumber) async {
//     final Uri url = Uri(scheme: 'tel', path: phoneNumber);
//     if (await canLaunchUrl(url)) {
//       await launchUrl(url);
//     } else {
//       throw 'Impossible de lancer l\'appel $phoneNumber';
//     }
//   }
// }

// class ChatInputContainer extends StatefulWidget {
//   ChatInputContainer({
//     super.key,
//     required this.self,
//     this.other,
//     this.group,
//   });

//   final User self;
//   User? other;
//   Group? group;

//   @override
//   State<ChatInputContainer> createState() => _ChatInputContainerState();
// }

// class _ChatInputContainerState extends State<ChatInputContainer>
//     with WidgetsBindingObserver {
//   // double keyboardHeight = double.parse(box.read('keyboardHeight'));

//   bool isKeyboardVisible = false;
//   late final StreamSubscription<bool> _keyboardSubscription;
//   final ChatController chatController = Get.put(locator<ChatController>());

//   @override
//   void initState() {
//     chatController.initRecorder();
//     _keyboardSubscription =
//         KeyboardVisibilityController().onChange.listen((isVisible) async {
//       isKeyboardVisible = isVisible;
//       if (isVisible) {
//         chatController.setShowEmojiPicker(false);
//       }
//       setState(() {});
//     });

//     super.initState();
//   }

//   @override
//   void dispose() async {
//     super.dispose();
//     _keyboardSubscription.cancel();
//   }

//   void switchKeyboards() async {
//     final showEmojiPicker = chatController.state.value.showEmojiPicker;

//     if (!showEmojiPicker && !isKeyboardVisible) {
//       chatController.setShowEmojiPicker(true);
//     } else if (showEmojiPicker) {
//       chatController.state.value.fieldFocusNode.requestFocus();
//       SystemChannels.textInput.invokeMethod('TextInput.show');
//       Future.delayed(const Duration(milliseconds: 300), () {
//         if (!mounted || showEmojiPicker) return;
//         chatController.setShowEmojiPicker(false);
//       });
//     } else if (isKeyboardVisible) {
//       SystemChannels.textInput.invokeMethod('TextInput.hide');
//       chatController.setShowEmojiPicker(true);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final colorTheme = Theme.of(context).custom.colorTheme;

//       return Theme(
//         data: Theme.of(context).copyWith(
//           iconTheme: IconThemeData(
//               color: Theme.of(context).brightness == Brightness.light
//                   ? colorTheme.greyColor
//                   : colorTheme.iconColor),
//         ),
//         child: AvoidBottomInset(
//           padding: EdgeInsets.only(bottom: Platform.isAndroid ? 4.0 : 24.0),
//           conditions: [chatController.state.value.showEmojiPicker],
//           offstage: Offstage(
//             offstage: !chatController.state.value.showEmojiPicker,
//             child: CustomEmojiPicker(
//               afterEmojiPlaced: (emoji) =>
//                   chatController.onTextChanged(emoji.emoji),
//               textController: chatController.state.value.messageController,
//             ),
//           ),
//           child: chatController.state.value.recordingState !=
//                       RecordingState.recordingLocked &&
//                   chatController.state.value.recordingState !=
//                       RecordingState.paused
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 5.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(24.0),
//                             color:
//                                 Theme.of(context).brightness == Brightness.dark
//                                     ? colorTheme.appBarColor
//                                     : colorTheme.backgroundColor,
//                           ),
//                           child: chatController.state.value.recordingState ==
//                                   RecordingState.notRecording
//                               ? _buildChatField(
//                                   chatController.state.value.showEmojiPicker,
//                                   context,
//                                   chatController.state.value.hideElements,
//                                   colorTheme,
//                                 )
//                               : VoiceRecorderField(),
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 4.0,
//                       ),
//                       chatController.state.value.hideElements
//                           ? InkWell(
//                               onTap: () async {
//                                 if (widget.group != null) {
//                                   chatController.onSendBtnPressed(
//                                     sender: widget.self,
//                                     // widget.other!,
//                                     group: widget.group!,
//                                     conversationId: widget.group!.id,
//                                   );
//                                 } else {
//                                   chatController.onSendBtnPressed(
//                                     sender: widget.self,
//                                     receiver: widget.other!,
//                                     conversationId: (await locator<IsarDb>()
//                                             .getConversationId(
//                                           getChatId(
//                                             widget.self.id,
//                                             widget.other!.id,
//                                           ),
//                                         )) ??
//                                         null,
//                                   );
//                                 }
//                               },
//                               child: CircleAvatar(
//                                 radius: 24,
//                                 backgroundColor: colorTheme.greenColor,
//                                 child: const Icon(
//                                   Icons.send,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             )
//                           : ScreenUtil().screenWidth > 640
//                               ? SizedBox()
//                               : ChatInputMic(
//                                   is_group: chatController.group != null,
//                                   conversationId: chatController.group != null
//                                       ? chatController.group!.id
//                                       : getChatId(
//                                           widget.self.id,
//                                           widget.other!.id,
//                                         ),
//                                 ),
//                     ],
//                   ),
//                 )
//               : VoiceRecorder(
//                   is_groupe: chatController.group != null,
//                   conversationId: chatController.group != null
//                       ? chatController.group!.id
//                       : getChatId(
//                           widget.self.id,
//                           widget.other!.id,
//                         ),
//                 ),
//         ),
//       );
//     });
//   }

//   ChatField _buildChatField(bool showEmojiPicker, BuildContext context,
//       bool hideElements, ColorTheme colorTheme) {
//     return ChatField(
//       leading: GestureDetector(
//         onTap: switchKeyboards,
//         child: Icon(
//           !showEmojiPicker ? Icons.emoji_emotions : Icons.keyboard,
//           size: 26.0,
//         ),
//       ),
//       focusNode: chatController.state.value.fieldFocusNode,
//       onTextChanged: (value) => chatController.onTextChanged(value),
//       textController: chatController.state.value.messageController,
//       actions: [
//         InkWell(
//           onTap: () {
//             if (ScreenUtil().screenWidth > 640) {
//               chatController.pickDocuments(context, mounted);
//             } else {
//               onAttachmentsIconPressed(
//                 context,
//               );
//             }
//           },
//           child: Transform.rotate(
//             angle: -0.8,
//             child: const Icon(
//               Icons.attach_file_rounded,
//               size: 26.0,
//             ),
//           ),
//         ),
//         if (!hideElements && !(ScreenUtil().screenWidth > 640)) ...[
//           InkWell(
//             onTap: () {
//               chatController.navigateToCameraView(context, mounted);
//             },
//             child: const Icon(
//               Icons.camera_alt_rounded,
//               size: 24.0,
//             ),
//           ),
//         ],
//       ],
//     );
//   }

//   void onAttachmentsIconPressed(BuildContext context) {
//     final focusNode = chatController.state.value.fieldFocusNode;
//     focusNode.unfocus();
//     Future.delayed(
//       Duration(
//         milliseconds: MediaQuery.of(context).viewInsets.bottom > 0 ? 300 : 0,
//       ),
//       () async {
//         if (!mounted) return;
//         showDialog(
//           barrierColor: null,
//           context: context,
//           builder: (context) {
//             return Dialog(
//               alignment: Alignment.bottomCenter,
//               insetPadding: EdgeInsets.symmetric(
//                 horizontal: 10.0,
//                 vertical:
//                     chatController.state.value.showEmojiPicker ? 36.0 : 56.0,
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16.0),
//               ),
//               elevation: 0,
//               child: const Padding(
//                 padding: EdgeInsets.only(top: 24.0),
//                 child: AttachmentPicker(),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }

// class ChatStream extends StatefulWidget {
//   ChatStream({
//     super.key,
//     this.group,
//   });

//   Group? group;

//   @override
//   State<ChatStream> createState() => _ChatStreamState();
// }

// class _ChatStreamState extends State<ChatStream> {
//   late final User self;
//   late final User? other;
//   late final String chatId;
//   late final ScrollController scrollController;
//   late Stream<List<Message>> messageStream;
//   ChatController chatController = Get.put(locator<ChatController>());

//   bool isInitialRender = true;
//   int unreadCount = 0;
//   int prevMsgCount = 0;
//   final bannerKey = GlobalKey();

//   @override
//   void initState() {
//     self = chatController.self;
//     other = chatController.other;
//     chatId = widget.group != null
//         ? widget.group!.id!
//         : getChatId(self.id, other!.id);

//     messageStream = locator<IsarDb>().getChatStream(chatId);
//     scrollController = ScrollController();

//     super.initState();
//   }

//   @override
//   void dispose() async {
//     scrollController.dispose();
//     super.dispose();
//   }

//   void handleNewMessage(Message message) {
//     if (message.senderId == self.id) {
//       unreadCount = 0;
//       if (message.status == MessageStatus.pending) {
//         scrollToBottom();
//       }
//     } else {
//       unreadCount = unreadCount > 0 ? unreadCount + 1 : 0;
//     }
//   }

//   void handleInitialData(int unreadMsgCount) {
//     isInitialRender = false;
//     unreadCount = unreadMsgCount;

//     if (unreadCount > 0) {
//       scrollToUnreadBanner();
//     }
//   }

//   int updateUnreadCount(List<Message> messages) {
//     int unreadCount = 0;

//     for (final message in messages) {
//       if (message.senderId == self.id) break;
//       if (message.status == MessageStatus.seen) break;
//       unreadCount++;
//     }

//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       chatController.setUnreadCount(unreadCount);
//     });

//     return unreadCount;
//   }

//   void scrollToUnreadBanner() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       Scrollable.ensureVisible(
//         bannerKey.currentContext!,
//         alignmentPolicy: ScrollPositionAlignmentPolicy.keepVisibleAtEnd,
//       );
//     });
//   }

//   void scrollToBottom() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       scrollController.animateTo(
//         scrollController.position.minScrollExtent,
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeOutCubic,
//       );
//     });
//   }

//   void markAsSeen(Message message) {
//     if (message.senderId == self.id) return;
//     if (message.status == MessageStatus.seen) return;
//     chatController.markMessageAsSeen(message);
//   }

//   int getMessageIndexByKey(Key key, List<Message> messages) {
//     final messageKey = key as ValueKey;
//     return messages.indexWhere((msg) => msg.id == messageKey.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
//     final colorTheme = Theme.of(context).custom.colorTheme;

//     return StreamBuilder<List<Message>>(
//       stream: messageStream,
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Container();
//         }

//         final messages = snapshot.data!;
//         final unreadMsgCount = updateUnreadCount(messages);

//         if (isInitialRender) {
//           handleInitialData(unreadMsgCount);
//         } else if (messages.length - prevMsgCount > 0) {
//           handleNewMessage(messages.first);
//         }

//         prevMsgCount = messages.length;
//         return Stack(
//           alignment: Alignment.topCenter,
//           children: [
//             Container(color: Colors.transparent),
//             CustomScrollView(
//               shrinkWrap: true,
//               reverse: true,
//               controller: scrollController,
//               physics: const BouncingScrollPhysics(),
//               slivers: [
//                 if (unreadCount > 0) ...[
//                   SliverList.builder(
//                     itemCount: unreadCount,
//                     itemBuilder: (context, index) {
//                       return buildMessageCard(index, messages);
//                     },
//                     findChildIndexCallback: (key) {
//                       return getMessageIndexByKey(key, messages);
//                     },
//                   ),
//                   SliverToBoxAdapter(
//                     key: bannerKey,
//                     child: UnreadMessagesBanner(
//                       unreadCount: unreadCount,
//                     ),
//                   ),
//                 ],
//                 SliverList.builder(
//                   itemCount: messages.length - unreadCount,
//                   itemBuilder: (context, index) {
//                     index = index + unreadCount;
//                     return buildMessageCard(index, messages);
//                   },
//                   findChildIndexCallback: (key) {
//                     return getMessageIndexByKey(key, messages);
//                   },
//                 ),
//                 SliverToBoxAdapter(
//                   child: Center(
//                     child: Container(
//                       width: ScreenUtil().screenWidth > 640
//                           ? MediaQuery.of(context).size.width * 0.8
//                           : MediaQuery.of(context).size.width * 0.8,
//                       margin: const EdgeInsets.only(bottom: 4),
//                       padding: const EdgeInsets.all(6),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         color: isDarkTheme
//                             ? const Color.fromARGB(200, 24, 34, 40)
//                             : const Color.fromARGB(148, 248, 236, 130),
//                       ),
//                       child: Text(
//                         '🔒Les messages et appels sont protégés par un chiffrement de bout en bout. Personne en dehors de cette conversation, y compris VVIMS, ne peut les lire ou les écouter. Appuyez pour en savoir plus.',
//                         style: TextStyle(
//                           fontSize: 13,
//                           color: isDarkTheme
//                               ? colorTheme.yellowColor
//                               : colorTheme.textColor1,
//                         ),
//                         softWrap: true,
//                         textWidthBasis: TextWidthBasis.longestLine,
//                         textAlign: TextAlign.center,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SliverToBoxAdapter(
//                   child: Center(
//                     child: ChatDate(
//                       date: messages.isEmpty
//                           ? 'Today'
//                           : dateFromTimestamp(messages.last.timestamp),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Align(
//               alignment: Alignment.bottomRight,
//               child: ScrollButton(scrollController: scrollController),
//             )
//           ],
//         );
//       },
//     );
//   }

//   Widget buildMessageCard(int index, List<Message> messages) {
//     final message = messages[index];
//     final isFirstMsg = index == messages.length - 1;
//     final isSpecial =
//         isFirstMsg || messages[index].senderId != messages[index + 1].senderId;
//     final currMsgDate = dateFromTimestamp(messages[index].timestamp);
//     final showDate = isFirstMsg ||
//         currMsgDate != dateFromTimestamp(messages[index + 1].timestamp);

//     return Column(
//       key: ValueKey(message.id),
//       children: [
//         if (!isFirstMsg && showDate) ...[
//           ChatDate(date: currMsgDate),
//         ],
//         VisibilityDetector(
//           key: ValueKey('${message.id}_vd'),
//           onVisibilityChanged: (info) {
//             if (info.visibleFraction < 0.1) return;
//             markAsSeen(message);
//           },
//           child: MessageCard(
//             message: message,
//             currentUserId: self.id,
//             special: isSpecial,
//           ),
//         ),
//       ],
//     );
//   }
// }
