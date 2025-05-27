// import 'dart:async';
// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/Controllers/profile_controller.dart';
// import 'package:visitor_pass/Models/attachement.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/Models/recent_chat.dart';
// import 'package:visitor_pass/Models/user.dart';
// import 'package:visitor_pass/config/locator/isar_bd.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/notificatons/notifications_helper.dart';
// import 'package:visitor_pass/theme/color_theme.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/utils/abc.dart';
// import 'package:visitor_pass/views/pages/chat/chat.dart';
// import 'package:visitor_pass/views/pages/chat/contacts.dart';

// class HomePageChat extends StatefulWidget {
//   // final User user;
//   const HomePageChat({super.key});

//   @override
//   State<HomePageChat> createState() => _HomePageChatState();
// }

// class _HomePageChatState extends State<HomePageChat>
//     with WidgetsBindingObserver, SingleTickerProviderStateMixin {
//   final ProfileController profileController = locator<ProfileController>();
//   late final StreamSubscription<List<Message>> messageListener;
//   late User currentUser;

//   @override
//   void didChangeAppLifecycleState(AppLifecycleState state) async {
//     /* switch (state) {
//       case AppLifecycleState.resumed:
//         ref.read(firebaseFirestoreRepositoryProvider).setActivityStatus(
//             userId: widget.user.id,
//             statusValue: UserActivityStatus.online.value);
//         break;
//       default:
//         ref.read(firebaseFirestoreRepositoryProvider).setActivityStatus(
//             userId: widget.user.id,
//             statusValue: UserActivityStatus.offline.value);
//         break;
//     }*/
//     super.didChangeAppLifecycleState(state);
//   }

//   @override
//   void initState() {
//     currentUser = User(
//       id: profileController.profileUser.id ?? "",
//       name: profileController.profileUser.name ?? "",
//       avatarUrl: profileController.profileUser.image ?? "",
//       phone: Phone(
//         number: profileController.profileUser.phone ?? "",
//       ),
//       activityStatus: UserActivityStatus.online,
//     );
//     /* final firestore = ref.read(firebaseFirestoreRepositoryProvider);
//     firestore.setActivityStatus(
//       userId: widget.user.id,
//       statusValue: UserActivityStatus.online.value,
//     );

//     messageListener = firestore.getChatStream(widget.user.id).listen(
//       (messages) async {
//         for (final message in messages) {
//           message.status = MessageStatus.delivered;
//           firestore.sendSystemMessage(
//             message: SystemMessage(
//               targetId: message.id,
//               action: MessageAction.statusUpdate,
//               update: MessageStatus.delivered.value,
//             ),
//             receiverId: message.senderId,
//           );

//           if (message.attachment != null && message.attachment!.autoDownload) {
//             DownloadService.download(
//               taskId: message.id,
//               url: message.attachment!.url,
//               path: DeviceStorage.getMediaFilePath(
//                 message.attachment!.fileName,
//               ),
//               onDownloadComplete: (_) {},
//               onDownloadError: () {},
//             );
//           }
//         }

//         IsarDb.addMessages(messages);
//       },
//     );

//     ref.read(pushNotificationsRepoProvider).init(
//       onMessageOpenedApp: (message) async {
//         await handleNotificationClick(message);
//       },
//     );

//     WidgetsBinding.instance.addObserver(this);
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       final message = await FirebaseMessaging.instance.getInitialMessage();
//       if (message == null) return;

//       await handleNotificationClick(message);
//     });*/

//     super.initState();
//   }

//   @override
//   void dispose() {
//     messageListener.cancel();
//     WidgetsBinding.instance.removeObserver(this);
//     super.dispose();
//   }

//   // Future<void> handleNotificationClick(RemoteMessage message) async {
//   /* final author = await ref
//         .read(firebaseFirestoreRepositoryProvider)
//         .getUserById(message.data['authorId']);

//     final contact = await ref
//         .read(contactsRepositoryProvider)
//         .getContactByPhone(author!.phone.number!);

//     if (!mounted) return;
//     Navigator.of(context).pushAndRemoveUntil(
//       MaterialPageRoute(
//         builder: (context) => ChatPage(
//           self: widget.user,
//           other: author,
//           otherUserContactName:
//               contact?.displayName ?? author.phone.getFormattedNumber(),
//         ),
//       ),
//       (route) => route.settings.name == "/",
//     );*/
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: RecentChatsBody(user: currentUser),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: AppColor.greyBck,
//         onPressed: () async {
//           // if (!await hasPermission(Permission.contacts)) return;
//           if (!mounted) return;

//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) => ContactsPage(
//                 user: currentUser,
//               ),
//             ),
//           );
//         },
//         child: SvgPicture.asset(
//           './assets/icons/message.svg',
//           width: 10.w,
//           height: 10.w,
//         ),
//       ),
//     );
//   }
// }

// class RecentChatsBody extends StatelessWidget {
//   const RecentChatsBody({
//     super.key,
//     required this.user,
//   });

//   final User user;

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;

//     return StreamBuilder<List<RecentChat>>(
//       stream: locator<IsarDb>().getRecentChatStream(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Container();
//         }

//         final chats = snapshot.data!;
//         if (chats.isEmpty) {
//           return const HomePageContactsList();
//         }

//         return SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 SizedBox(height: 16.h),
//                 ScreenUtil().screenWidth > 640
//                     ? SizedBox()
//                     : Container(
//                         height: ScreenSize(context).mainWidth > 640 ? 30 : 45,
//                         width: double.infinity,
//                         margin: EdgeInsets.symmetric(
//                           horizontal:
//                               ScreenSize(context).mainWidth > 640 ? 12.w : 16.w,
//                         ),
//                         decoration: BoxDecoration(
//                           border: Border.all(color: AppColor.primaryColor),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 12),
//                               child:
//                                   SvgPicture.asset('./assets/new/search.svg'),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(right: 10),
//                                 child: TextField(
//                                   decoration: InputDecoration(
//                                     hintText: 'Recherche...',
//                                     hintStyle:
//                                         TextStyle(color: Colors.grey[300]),
//                                     border: InputBorder.none,
//                                   ),
//                                   onChanged: (query) {},
//                                   style: TextStyle(color: Colors.black),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                 SizedBox(height: 50.h),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 8.0),
//                   child: Column(
//                     children: chats.map((chat) {
//                       Message msg = chat.message;
//                       String msgContent = chat.message.content;
//                       String msgStatus = '';

//                       if (msg.senderId == user.id) {
//                         msgStatus = msg.status.value;
//                       }

//                       return RecentChatWidget(
//                         user: user,
//                         chat: chat,
//                         group: chat.group,
//                         colorTheme: colorTheme,
//                         title: chat.group != null
//                             ? chat.group!.name!
//                             : chat.user!.name,
//                         msgStatus: msgStatus,
//                         msgContent: msgContent,
//                         isGroup: chat.group != null,
//                       );
//                     }).toList(),
//                   ),
//                 ),
//                 if (chats.isNotEmpty) ...[
//                   const Divider(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.lock,
//                           size: 18,
//                           color:
//                               Theme.of(context).brightness == Brightness.light
//                                   ? colorTheme.greyColor
//                                   : colorTheme.iconColor,
//                         ),
//                         const SizedBox(width: 4),
//                         RichText(
//                           textAlign: TextAlign.center,
//                           text: TextSpan(
//                             style: Theme.of(context).textTheme.bodySmall,
//                             children: [
//                               TextSpan(
//                                 text: 'Your personal messages are ',
//                                 style: TextStyle(color: colorTheme.greyColor),
//                               ),
//                               TextSpan(
//                                 text: 'end-to-end encrypted',
//                                 style: TextStyle(color: colorTheme.greenColor),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class HomePageContactsList extends StatelessWidget {
//   const HomePageContactsList({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;

//     return FutureBuilder(
//       future: locator<IsarDb>().getWhatsAppContacts(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return Container();
//         }

//         final users = snapshot.data!;
//         final userCount = users.length;
//         if (userCount < 2) return Container();

//         int avatarDisplayCount;
//         if (userCount > 4) {
//           avatarDisplayCount = 5;
//         } else {
//           avatarDisplayCount = userCount;
//         }

//         final descriptionList = <String>['', ''];
//         if (userCount > 3) {
//           descriptionList[0] = users.getRange(0, 3).join(', ');
//           descriptionList[1] =
//               ' and ${userCount - 3} more of your contacts\n are on VVIMS';
//         } else if (userCount > 2) {
//           descriptionList[0] = users.getRange(0, 2).join(', ');
//           descriptionList[1] = ' and ${users[2]} are on VVIMS';
//         } else if (userCount > 1) {
//           descriptionList[0] = users.join(' and ');
//           descriptionList[1] = ' are on VVIMS';
//         } else {
//           descriptionList[0] = '${users.first}';
//           descriptionList[1] = ' is one VVIMS.';
//         }

//         return Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(
//               height: 55,
//               width: (avatarDisplayCount * 36) + 30,
//               child: Stack(
//                 children: [
//                   for (var i = 0; i < avatarDisplayCount; i++) ...[
//                     Positioned(
//                       right: (i * 36),
//                       child: Container(
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           border: Border.all(
//                             width: 2,
//                             color: AppColorsDark.backgroundColor,
//                           ),
//                         ),
//                         child: CircleAvatar(
//                           radius: 24,
//                           backgroundImage: users[i].avatarUrl != null
//                               ? CachedNetworkImageProvider(
//                                   users[i].avatarUrl!,
//                                 )
//                               : const AssetImage('assets/images/avatar.png')
//                                   as ImageProvider,
//                         ),
//                       ),
//                     )
//                   ],
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             RichText(
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 text: descriptionList[0],
//                 style: TextStyle(
//                   fontWeight: FontWeight.w700,
//                   color: Theme.of(context).brightness == Brightness.dark
//                       ? colorTheme.unselectedLabelColor
//                       : colorTheme.textColor1,
//                 ),
//                 children: [
//                   TextSpan(
//                     text: descriptionList[1],
//                     style: const TextStyle(fontWeight: FontWeight.w500),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// class RecentChatWidget extends StatelessWidget {
//   RecentChatWidget({
//     super.key,
//     this.group,
//     required this.user,
//     required this.chat,
//     required this.colorTheme,
//     required this.title,
//     required this.msgStatus,
//     required this.msgContent,
//     required this.isGroup,
//   });

//   final User user;
//   Group? group;
//   final RecentChat chat;
//   final ColorTheme colorTheme;
//   final String title;
//   final String msgStatus;
//   final String msgContent;
//   final bool isGroup;

//   final ChatController chatController = Get.put(locator<ChatController>());

//   @override
//   Widget build(BuildContext context) {
//     final trailingChildren = [
//       RecentChatTime(chat: chat, colorTheme: colorTheme),
//       if (chat.unreadCount > 0) ...[
//         Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: colorTheme.greenColor,
//           ),
//           margin: const EdgeInsets.only(left: 4.0),
//           padding: const EdgeInsets.all(6.0),
//           child: Text(
//             chat.unreadCount.toString(),
//             style: const TextStyle(
//               color: Colors.black,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         )
//       ],
//     ];

//     return ListTile(
//       onTap: () async {
//         chat.unreadCount = 0;
//         // if (ScreenSize(context).mainWidth > 640) {
//         //   chatController.currentChatModel.value = CurrentChatModel(
//         //     user: user,
//         //     other: chat.group != null ? null : chat.user!,
//         //     otherUserContactName:
//         //         chat.group != null ? chat.group!.name! : title,
//         //     group: chat.group,
//         //   );
//         // } else {
//         await Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => ChatPage(
//               self: user,
//               other: chat.group != null ? null : chat.user!,
//               otherUserContactName:
//                   chat.group != null ? chat.group!.name! : title,
//               group: chat.group,
//             ),
//             settings: const RouteSettings(name: 'chat'),
//           ),
//         );
//         // }

//         if (group != null) {
//           locator<IsarDb>().setAllReaded(group!.id!);
//         } else {
//           locator<IsarDb>().setAllReaded(getChatId(user.id, chat.user!.id));
//         }
//       },
//       leading: isGroup
//           ? CircleAvatar(
//               radius: ScreenSize(context).mainWidth > 640 ? 18 : 24.0,
//               backgroundColor: colorTheme.greenColor,
//               child: Icon(
//                 Icons.people,
//                 color: Colors.white,
//                 // size:ScreenSize(context).mainWidth > 640 ?15:null ,
//               ),
//             )
//           : CircleAvatar(
//               radius: ScreenSize(context).mainWidth > 640 ? 18 : 24.0,
//               backgroundImage: CachedNetworkImageProvider(
//                 chat.user!.avatarUrl,
//               ),
//             ),
//       title: SizedBox(
//         width: ScreenSize(context).mainWidth > 640 ? 0.3.sw : 0.57.sw,
//         child: Text(
//           isGroup ? group!.name! : title,
//           style: Theme.of(context)
//               .custom
//               .textTheme
//               .titleMedium
//               .copyWith(color: colorTheme.textColor1, fontSize: 12)
//               .copyWith(fontWeight: FontWeight.w500),
//           overflow: TextOverflow.ellipsis,
//         ),
//       ),
//       subtitle: Row(
//         children: [
//           if (msgStatus.isNotEmpty) ...[
//             Image.asset(
//               'assets/images/$msgStatus.png',
//               color: msgStatus != 'SEEN' ? colorTheme.textColor1 : null,
//               width: 15.0,
//             ),
//             const SizedBox(
//               width: 2.0,
//             )
//           ],
//           if (chat.message.attachment != null) ...[
//             LayoutBuilder(
//               builder: (context, _) {
//                 switch (chat.message.attachment!.type) {
//                   case AttachmentType.audio:
//                     return Icon(
//                       Icons.audiotrack_rounded,
//                       size: ScreenSize(context).mainWidth > 640 ? 12 : 20,
//                     );

//                   case AttachmentType.voice:
//                     return Icon(
//                       Icons.mic,
//                       size: ScreenSize(context).mainWidth > 640 ? 12 : 20,
//                     );

//                   case AttachmentType.image:
//                     return Icon(
//                       Icons.image_rounded,
//                       size: ScreenSize(context).mainWidth > 640 ? 12 : 20,
//                     );

//                   case AttachmentType.video:
//                     return Icon(
//                       Icons.videocam_rounded,
//                       size: ScreenSize(context).mainWidth > 640 ? 12 : 20,
//                     );

//                   default:
//                     return Icon(
//                       Icons.file_copy,
//                       size: ScreenSize(context).mainWidth > 640 ? 12 : 20,
//                     );
//                 }
//               },
//             ),
//             const SizedBox(
//               width: 2.0,
//             )
//           ],
//           SizedBox(
//             width: ScreenSize(context).mainWidth > 640 ? 0.18.sw : 0.43.sw,
//             child: Text(
//               msgContent.length > 30
//                   ? '${msgContent.substring(0, 30)}...'
//                   : msgContent == "\u00A0" || msgContent.isEmpty
//                       ? chat.message.attachment!.type.value
//                       : msgContent,
//               style: Theme.of(context).custom.textTheme.subtitle2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           )
//         ],
//       ),
//       trailing: chat.unreadCount > 0
//           ? Column(
//               mainAxisSize: MainAxisSize.min,
//               children: trailingChildren,
//             )
//           : Row(
//               mainAxisSize: MainAxisSize.min,
//               children: trailingChildren,
//             ),
//     );
//   }
// }

// class RecentChatTime extends StatefulWidget {
//   const RecentChatTime({
//     super.key,
//     required this.chat,
//     required this.colorTheme,
//   });

//   final RecentChat chat;
//   final ColorTheme colorTheme;

//   @override
//   State<RecentChatTime> createState() => _RecentChatTimeState();
// }

// class _RecentChatTimeState extends State<RecentChatTime> {
//   late final Timer timer;

//   @override
//   void initState() {
//     timer = Timer.periodic(const Duration(minutes: 1), (_) {
//       if (!mounted) return;
//       setState(() {});
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       formattedTimestamp(
//         widget.chat.message.timestamp,
//       ),
//       style: Theme.of(context).custom.textTheme.caption.copyWith(
//             color: widget.chat.unreadCount > 0
//                 ? widget.colorTheme.greenColor
//                 : Theme.of(context).custom.colorTheme.greyColor,
//           ),
//     );
//   }
// }
