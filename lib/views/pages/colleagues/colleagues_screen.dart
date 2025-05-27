// import 'dart:async';

// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:visitor_pass/Controllers/global-controller.dart';
// import 'package:visitor_pass/Models/employee_model.dart';
// import 'package:visitor_pass/Services/user-service.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/views/pages/chat/chat_screen.dart';
// import 'package:visitor_pass/views/pages/chat/select_participants.dart';
// import 'package:visitor_pass/views/pages/colleagues/graphql_request.dart';
// import 'package:visitor_pass/views/widget/cachedImage.dart';
// import 'package:visitor_pass/views/widget/shimer_widget.dart';

// class ColleaguesScreen extends StatefulWidget {
//   const ColleaguesScreen({super.key});

//   @override
//   State<ColleaguesScreen> createState() => _ColleaguesScreenState();
// }

// class _ColleaguesScreenState extends State<ColleaguesScreen> {
//   ColleugueController colleugueController = Get.put(ColleugueController());

//   bool validate = false;
//   bool clockIn = true;
//   bool clockingOut = true;

//   List<EmployeeModel> l = [];

//   Future<void> _onRefresh() {
//     // visitorController.onInit();
//     Completer<void> completer = Completer<void>();
//     Timer(const Duration(seconds: 3), () {
//       completer.complete();
//     });

//     return completer.future;
//   }

//   // @override
//   // void initState() {
//   //   globalController.getColleaugueList();
//   //   super.initState();
//   // }

//   @override
//   void dispose() {
//     super.dispose();
//     l.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       _onRefresh();
//     });
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Flexible(
//               flex: 19,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 12),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: () => Get.back(),
//                           icon: Icon(
//                             Icons.arrow_back_ios_new_rounded,
//                           ),
//                         ),
//                         Expanded(
//                           child: Container(
//                             height: 45,
//                             width: double.infinity,
//                             margin: EdgeInsets.symmetric(horizontal: 16.w),
//                             decoration: BoxDecoration(
//                               border: Border.all(color: AppColor.primaryColor),
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               children: [
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 12),
//                                   child: SvgPicture.asset(
//                                       './assets/new/search.svg'),
//                                 ),
//                                 Expanded(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(right: 10),
//                                     child: TextField(
//                                       decoration: InputDecoration(
//                                         hintText: 'Enter your search',
//                                         hintStyle:
//                                             TextStyle(color: Colors.grey[300]),
//                                         border: InputBorder.none,
//                                       ),
//                                       onChanged: (query) {
//                                         List<EmployeeModel> filteredList =
//                                             colleugueController.colleagueList
//                                                 .where((item) {
//                                           return item.name!
//                                               .toLowerCase()
//                                               .contains(query.toLowerCase());
//                                         }).toList();
//                                         setState(() {
//                                           l = filteredList;
//                                         });
//                                       },
//                                       style: TextStyle(color: Colors.black),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 81,
//               child: l.isNotEmpty
//                   ? ListView(
//                       children: [
//                         ...l.map(
//                           (item) {
//                             return Mutation(
//                               options: MutationOptions(
//                                 document: gql(inserUserConversations),
//                                 onError: (error) {
//                                   Get.back();
//                                 },
//                                 onCompleted: (dynamic resultData) {
//                                   Get.off(
//                                     () => ChatScreen(
//                                       image: item.image ?? "",
//                                       userName: item.name ?? "",
//                                       conversationID:
//                                           resultData['createConversation']
//                                               ['conversationID'],
//                                     ),
//                                   );
//                                 },
//                               ),
//                               builder: (runMutation, queryResult) {
//                                 return ListTile(
//                                   contentPadding:
//                                       EdgeInsets.symmetric(horizontal: 12.w),
//                                   leading: CachedImageOnLine(
//                                     imageUrl: item.image ?? "",
//                                   ),
//                                   title: Text(
//                                     item.name ?? "",
//                                     style: TextStyle(
//                                         fontSize: 17,
//                                         fontWeight: FontWeight.w500),
//                                   ),
//                                   subtitle: Text("Hi there i'm using vvims",
//                                       style: TextStyle(fontSize: 12)),
//                                   trailing: Container(
//                                     padding: EdgeInsets.all(4),
//                                     decoration: BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: kSecondaryColor),
//                                     child: queryResult?.isLoading ?? false
//                                         ? CircularProgressIndicator.adaptive(
//                                             backgroundColor: Colors.white)
//                                         : Icon(
//                                             Icons.add_rounded,
//                                             size: 15,
//                                             color: Colors.white,
//                                           ),
//                                   ),
//                                   onTap: () async {
//                                     l.clear();
//                                     UserService userService = UserService();
//                                     final String currentId =
//                                         await userService.getEmployeeId();

//                                     runMutation(
//                                       {
//                                         "firstParticipant": currentId,
//                                         "secondParticipant": item.id.toString(),
//                                         "title": item.name,
//                                       },
//                                     );
//                                   },
//                                 );
//                               },
//                             );
//                           },
//                         ).toList()
//                       ],
//                     )
//                   : Obx(
//                       () {
//                         return colleugueController
//                                 .isLoadingGetColleagueList.value
//                             ? ShimmerColumnWidget(
//                                 itemWith: double.infinity,
//                                 itemHeight: 50,
//                                 shimmerHeight: 0.6.sh,
//                               )
//                             : ListView(
//                                 children: [
//                                   // Align(
//                                   //   alignment: Alignment.centerLeft,
//                                   //   child: Row(
//                                   //     children: [
//                                   //       Container(
//                                   //         decoration: BoxDecoration(
//                                   //           shape: BoxShape.circle,
//                                   //           color: Color(0xFF1F1C39),
//                                   //         ),
//                                   //         child: Icon(
//                                   //           Icons.add_rounded,
//                                   //         ),
//                                   //       ),
//                                   //       Text("Create group"),
//                                   //     ],
//                                   //   ),
//                                   // ),
//                                   ListTile(
//                                     leading: Container(
//                                       // decoration: BoxDecoration(
//                                       //   shape: BoxShape.circle,
//                                       //   color: Colors.grey,
//                                       // ),
//                                       child: SvgPicture.asset(
//                                         Images.Ncollegue,
//                                         width: 50,
//                                         height: 50,
//                                       ),
//                                     ),
//                                     title: Text(
//                                       "Create group",
//                                       style: TextStyle(
//                                           fontSize: 17,
//                                           fontWeight: FontWeight.w500,
//                                           color: Color(0xFF2B2251)),
//                                     ),
//                                     onTap: () {
//                                       Get.off(() => CreateGroupScreen());
//                                     },
//                                   ),
//                                   ...colleugueController.colleagueList.map(
//                                     (item) {
//                                       return Mutation(
//                                         options: MutationOptions(
//                                           document: gql(inserUserConversations),
//                                           onError: (error) {
//                                             Get.back();
//                                           },
//                                           onCompleted: (dynamic resultData) {
                                          
//                                             Get.off(
//                                               () => ChatScreen(
//                                                 image: item.image ?? "",
//                                                 userName: item.name ?? "",
//                                                 conversationID: resultData[
//                                                         'createConversation']
//                                                     ['conversationID'],
//                                               ),
//                                             );
//                                           },
//                                         ),
//                                         builder: (runMutation, queryResult) {
//                                           return ListTile(
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                                     horizontal: 12.w),
//                                             leading: CachedImageOnLine(
//                                               imageUrl: item.image ?? "",
//                                             ),
//                                             title: Text(
//                                               item.name ?? "",
//                                               style: TextStyle(
//                                                   fontSize: 17,
//                                                   fontWeight: FontWeight.w500),
//                                             ),
//                                             subtitle: Text(
//                                                 "Hi there i'm using vvims",
//                                                 style: TextStyle(fontSize: 12)),
//                                             trailing: Container(
//                                               padding: EdgeInsets.all(4),
//                                               decoration: BoxDecoration(
//                                                   shape: BoxShape.circle,
//                                                   color: kSecondaryColor),
//                                               child: queryResult?.isLoading ??
//                                                       false
//                                                   ? CircularProgressIndicator
//                                                       .adaptive(
//                                                           backgroundColor:
//                                                               Colors.white)
//                                                   : Icon(
//                                                       Icons.add_rounded,
//                                                       size: 15,
//                                                       color: Colors.white,
//                                                     ),
//                                             ),
//                                             onTap: () async {
//                                               UserService userService =
//                                                   UserService();
//                                               final String currentId =
//                                                   await userService
//                                                       .getEmployeeId();

//                                               runMutation(
//                                                 {
//                                                   "firstParticipant": currentId,
//                                                   "secondParticipant":
//                                                       item.id.toString(),
//                                                   "title": item.name,
//                                                 },
//                                               );
//                                             },
//                                           );
//                                         },
//                                       );
//                                     },
//                                   ),
//                                 ],
//                               );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   showAlertDialog(BuildContext context) {
//     Widget continueButton = TextButton(
//       child: Container(
//         height: 45,
//         width: 100,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           color: AppColor.primaryColor,
//         ),
//         child: const Center(
//           child: Text(
//             "Yes, Sure",
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//       onPressed: () {
//         clockingOut = false;
//         Get.back();
//         (context as Element).markNeedsBuild();
//       },
//     );
//     Widget cancelButton = TextButton(
//       child: Container(
//         height: 47,
//         width: 102,
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             border: Border.all(width: 1, color: AppColor.primaryColor)),
//         child: const Center(
//           child: Text(
//             "No, Cancel",
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 16,
//               color: AppColor.primaryColor,
//             ),
//           ),
//         ),
//       ),
//       onPressed: () {
//         Get.back();
//       },
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       content: const Text(
//         "Are you sure you want to clock out?",
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           color: AppColor.primaryColor,
//         ),
//       ),
//       actions: [
//         continueButton,
//         cancelButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }
