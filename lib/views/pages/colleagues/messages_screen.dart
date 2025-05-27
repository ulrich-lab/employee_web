// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:visitor_pass/Controllers/global-controller.dart';
// import 'package:visitor_pass/Models/conversation_model.dart';
// import 'package:visitor_pass/Services/user-service.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/views/pages/chat/chat_screen.dart';
// import 'package:visitor_pass/views/pages/colleagues/colleagues_screen.dart';
// import 'package:visitor_pass/views/pages/colleagues/graphql_request.dart';
// import 'package:visitor_pass/views/pages/search/search_screen.dart';
// import 'package:visitor_pass/views/widget/cachedImage.dart';

// class MessagesScreen extends StatefulWidget {
//   MessagesScreen({super.key});

//   @override
//   State<MessagesScreen> createState() => _MessagesScreenState();
// }

// class _MessagesScreenState extends State<MessagesScreen> {
//   GlobalController globalController = Get.put(GlobalController());

//   bool validate = false;

//   bool clockIn = true;

//   bool clockingOut = true;

//   // Future<void> _onRefresh() {
//   final List<Conversation> items = [];

//   String? currentId;

//   @override
//   void initState() {
//     super.initState();
//     getCurrentUser();
//   }

//   Future<void> getCurrentUser() async {
//     UserService userService = UserService();
//     currentId = await userService.getEmployeeId();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//     //   _onRefresh();
//     // });
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Flexible(
//                 flex: 2,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       child: Text(
//                         'Messages List'.tr,
//                         style: TextStyle(
//                           // color: AppColor.primaryColor,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                     SearchWidget()
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 8,
//                 child: currentId == null
//                     ? SizedBox(
//                         child: Center(
//                           child: Text("seraching conversation...."),
//                         ),
//                       )
//                     : Query(
//                         options: QueryOptions(
//                           document: gql(getConversationList),
//                           variables: {
//                             'user_id': currentId,
//                           },
//                         ),
//                         builder: (
//                           QueryResult? result, {
//                           VoidCallback? refetch,
//                           FetchMore? fetchMore,
//                         }) {
//                           if (result!.hasException) {
//                           }
//                           if (result.data != null) {
//                             items.clear();
//                             var queryUsers =
//                                 result.data!['conversations'] as List;
//                             for (var el in queryUsers) {
//                               items.add(Conversation.fromJson(el));
//                             }
//                           }

//                           return Subscription(
//                             options: SubscriptionOptions(
//                               document: subscriptionConversationList,
//                               variables: {
//                                 'user_id': currentId,
//                               },
//                             ),
//                             builder: (result) {
//                               if (result.hasException) {
//                                 return Text(result.exception.toString());
//                               }
//                               if (result.data != null) {
//                                 items.clear();
//                                 var queryUsers =
//                                     result.data!['conversations'] as List;
//                                 for (var el in queryUsers) {
//                                   // items.add(removeTypename(el).toString());
//                                   items.add(Conversation.fromJson(el));
//                                 }
//                               }
//                               return items.isEmpty
//                                   ? Column(
//                                       children: [
//                                         SvgPicture.asset(
//                                           './assets/new/empty_chat.svg',
//                                           width: double.infinity,
//                                           height: 0.5.sh,
//                                         ),
//                                         Text(
//                                           "Select Someone with who you want to chat",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                               color: AppColor.primaryColor,
//                                               fontSize: 17),
//                                         )
//                                       ],
//                                     )
//                                   : ListView.builder(
//                                       itemCount: items.length,
//                                       itemBuilder: (c, i) {
//                                         final item = items[i];
//                                         return ListTile(
//                                           contentPadding: EdgeInsets.symmetric(
//                                             horizontal: 12.w,
//                                             vertical: 8.h,
//                                           ),
//                                           leading: item.is_group
//                                               ? Container(
//                                                   padding: EdgeInsets.all(8),
//                                                   decoration: BoxDecoration(
//                                                     color: Colors.grey[200],
//                                                     shape: BoxShape.circle,
//                                                   ),
//                                                   child: SvgPicture.asset(
//                                                     Images.Ncollegue,
//                                                     width: 50,
//                                                     height: 50,
//                                                   ),
//                                                 )
//                                               : CachedImageOnLine(
//                                                   imageUrl:
//                                                       "https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png",
//                                                 ),
//                                           title: Text(
//                                             item.is_group
//                                                 ? item.title
//                                                 : "${item.userConversations.firstWhere((el) => el.employee.id != int.parse(currentId!)).employee.firstName} ${item.userConversations.firstWhere((el) => el.employee.id != int.parse(currentId!)).employee.lastName}",
//                                             style: TextStyle(
//                                               fontSize: 17,
//                                               fontWeight: FontWeight.w500,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                           subtitle: Text(
//                                             item.messages.isNotEmpty
//                                                 ? item
//                                                     .messages.first.textContent
//                                                 : "",
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 overflow:
//                                                     TextOverflow.ellipsis),
//                                             maxLines: 2,
//                                           ),
//                                           trailing: item
//                                                       .messagesAggregate.count >
//                                                   0
//                                               ? Container(
//                                                   padding: EdgeInsets.all(4),
//                                                   decoration: BoxDecoration(
//                                                       shape: BoxShape.circle,
//                                                       color: kSecondaryColor),
//                                                   child: Text(
//                                                     item.messagesAggregate.count
//                                                         .toString(),
//                                                     style: TextStyle(
//                                                         color: Colors.white,
//                                                         fontSize: 10),
//                                                   ),
//                                                 )
//                                               : SizedBox(),
//                                           onTap: () {
//                                             Get.to(
//                                               () => ChatScreen(
//                                                 conversationID: item.id,
//                                                 image:
//                                                     "https://cdn.pixabay.com/photo/2018/11/13/21/43/avatar-3814049_1280.png",
//                                                 userName: item.is_group
//                                                     ? item.title
//                                                     : "${item.userConversations.firstWhere((el) => el.employee.id != int.parse(currentId!)).employee.firstName} ${item.userConversations.firstWhere((el) => el.employee.id != int.parse(currentId!)).employee.lastName}",
//                                               ),
//                                             );
//                                           },
//                                         );
//                                       },
//                                     );
//                             },
//                           );
//                         },
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Get.to(() => ColleaguesScreen());
//         },
//         child: Icon(Icons.add_rounded),
//       ),
//     );
//   }

//   // showAlertDialog(BuildContext context) {
//   Map<String, dynamic> removeTypename(Map<String, dynamic> data) {
//     if (data.containsKey('__typename')) {
//       data.remove('__typename');
//     }
//     data.forEach((key, value) {
//       if (value is Map<String, dynamic>) {
//         removeTypename(value);
//       } else if (value is List) {
//         value.forEach((element) {
//           if (element is Map<String, dynamic>) {
//             removeTypename(element);
//           }
//         });
//       }
//     });
//     return data;
//   }
// }
