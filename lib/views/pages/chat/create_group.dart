// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:multiselect_nested/models/multiselect_nested_controller.dart';
// import 'package:multiselect_nested/models/multiselect_nested_item.dart';
// import 'package:multiselect_nested/multiselect_nested.dart';
// import 'package:visitor_pass/Controllers/chat_controller.dart';
// import 'package:visitor_pass/Controllers/contacts_controller.dart';
// import 'package:visitor_pass/Models/contact.dart';
// import 'package:visitor_pass/Models/create_group_text_field.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/theme/color_theme.dart';
// import 'package:visitor_pass/views/widget/custom_button.dart';
// import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

// import '../../../config/locator/locator.dart';

// class CreateGroup extends StatefulWidget {
//   const CreateGroup({super.key});

//   @override
//   State<CreateGroup> createState() => _CreateGroupState();
// }

// class _CreateGroupState extends State<CreateGroup> {
//   final TextEditingController _nameTextEditingController =
//       TextEditingController();

//   final TextEditingController _descriptionTextEditingController =
//       TextEditingController();

//   final TextEditingController _cityTextEditingController =
//       TextEditingController();

//   final ChatController chatController = Get.put(locator<ChatController>());
//   ContactPickerController contactPickerController =
//       Get.put(locator<ContactPickerController>());

//   @override
//   void dispose() {
//     super.dispose();
//     _nameTextEditingController.dispose();
//     _descriptionTextEditingController.dispose();
//     _cityTextEditingController.dispose();
//   }

//   // List<MultiSelectNestedItem> selected = [];
//   // MultiSelectNestedController multiSelectController =
//   //     MultiSelectNestedController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: Obx(
//         () {
//           return SafeArea(
//             child: Row(
//               children: [
//                 Flexible(
//                   flex: 6,
//                   child: Container(),
//                 ),
//                 Flexible(
//                   flex: 4,
//                   child: SingleChildScrollView(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(height: 30.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const Text(
//                               "Create Group",
//                               style: TextStyle(
//                                   fontSize: 26.0,
//                                   fontWeight: FontWeight.bold,
//                                   color: AppColorsLight.appBarColor),
//                             ),
//                             InkWell(
//                               onTap: () => Get.back(),
//                               child: Container(
//                                 width: 35.w,
//                                 height: 35.h,
//                                 padding: EdgeInsets.all(5.0),
//                                 decoration: BoxDecoration(
//                                   color: Colors.grey,
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Center(
//                                     child: Icon(
//                                   Icons.close_rounded,
//                                   size: 25,
//                                 )),
//                               ),
//                             )
//                           ],
//                         ),
//                         SizedBox(height: 25.w),
//                         AppTextField(
//                           textEditingController: _nameTextEditingController,
//                           title: "Groupe Name",
//                           hint: "Nom du groupe",
//                         ),
//                         SizedBox(height: 15.w),
//                         AppTextField(
//                           textEditingController:
//                               _descriptionTextEditingController,
//                           title: "Groupe Description",
//                           hint: "...",
//                           maxline: 4,
//                         ),
//                         SizedBox(height: 15.w),
//                         EmployeeModalSheet(),
//                         SizedBox(height: 12.h),
//                         chatController.selectedContacts.isEmpty
//                             ? SizedBox()
//                             : Wrap(
//                                 spacing: 4,
//                                 runSpacing: 4,
//                                 children: chatController.selectedContacts
//                                     .map((val) => InputChip(
//                                           key: ObjectKey(val),
//                                           label: Text(val.displayName),
//                                           avatar: CircleAvatar(
//                                             backgroundImage: NetworkImage(
//                                                 val.avatarUrl ?? ""),
//                                           ),
//                                           onDeleted: () {
//                                             chatController.selectedContacts
//                                                 .remove(val);
//                                           },
//                                           materialTapTargetSize:
//                                               MaterialTapTargetSize.shrinkWrap,
//                                         ))
//                                     .toList(),
//                               ),
//                         SizedBox(height: 50.w),
//                         chatController.selectedContacts.isEmpty
//                             ? SizedBox()
//                             : Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: CustomButton(
//                                   onPressed: () {
//                                     if (_nameTextEditingController
//                                         .text.isEmpty) {
//                                       Get.rawSnackbar(
//                                         message:
//                                             "Veillez saisir Le Nom du groupe",
//                                         backgroundColor:
//                                             Colors.red.withOpacity(0.5),
//                                         snackPosition: SnackPosition.TOP,
//                                       );
//                                     } else {
//                                       chatController.createGroupe(
//                                         name: _nameTextEditingController.text,
//                                         participants: [
//                                           box.read("user-id"),
//                                           ...chatController.selectedContacts
//                                               .map((el) =>
//                                                   el.contactId.toString())
//                                               .toList()
//                                         ],
//                                         onSuccess: () {
//                                           Get.back();
//                                           Get.back();
//                                           chatController.selectedContacts
//                                               .clear();
//                                         },
//                                         onError: () {},
//                                       );
//                                     }
//                                   },
//                                   text: "Create",
//                                   loading:
//                                       chatController.createGroupLoading.value,
//                                 ),
//                               )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class AppProfile {
//   final String name;
//   final String id;
//   final String imageUrl;

//   const AppProfile(
//       {required this.name, required this.id, required this.imageUrl});

//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is AppProfile &&
//           runtimeType == other.runtimeType &&
//           name == other.name;

//   @override
//   int get hashCode => name.hashCode;

//   @override
//   String toString() {
//     return name;
//   }
// }

// class EmployeeModalSheet extends StatefulWidget {
//   const EmployeeModalSheet({super.key});

//   @override
//   State<EmployeeModalSheet> createState() => _EmployeeModalSheetState();
// }

// class _EmployeeModalSheetState extends State<EmployeeModalSheet> {
//   final ChatController chatController = Get.put(locator<ChatController>());

//   MultiSelectNestedController multiSelectController =
//       MultiSelectNestedController();

//   @override
//   Widget build(BuildContext context) {
//     SliverWoltModalSheetPage page2(
//         BuildContext modalSheetContext, TextTheme textTheme) {
//       return SliverWoltModalSheetPage(
//         heroImageHeight: 150,
//         forceMaxHeight: true,
//         heroImage: Center(
//           child: CustomSlidingSegmentedControl<int>(
//             initialValue: chatController.tabIndex.value,
//             children: {
//               1: Text('Employees'),
//               2: Text('Departement / Services'),
//             },
//             decoration: BoxDecoration(
//               color: CupertinoColors.lightBackgroundGray,
//               borderRadius: BorderRadius.circular(14),
//             ),
//             thumbDecoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(12),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(.3),
//                   blurRadius: 4.0,
//                   spreadRadius: 1.0,
//                   offset: Offset(
//                     0.0,
//                     2.0,
//                   ),
//                 ),
//               ],
//             ),
//             duration: Duration(milliseconds: 300),
//             curve: Curves.easeInToLinear,
//             onValueChanged: (v) {
//               chatController.tabIndex.value = v;
//             },
//           ),
//         ),
//         leadingNavBarWidget: ScreenUtil().screenWidth > 640
//             ? Obx(() {
//                 return TextButton(
//                   onPressed: () {
//                     if (chatController.selectedContacts.isEmpty) {
//                       return;
//                     }
//                     chatController.filteredContacts.value =
//                         chatController.contacts;
//                     // }
//                     Navigator.of(modalSheetContext).pop();
//                   },
//                   child: Text(
//                     "Save",
//                     style: TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                         color: chatController.selectedContacts.isEmpty
//                             ? Colors.transparent
//                             : AppColorsLight.appBarColor),
//                   ),
//                 );
//               })
//             : Obx(() {
//                 return IconButton(
//                   padding: EdgeInsets.all(16.sp),
//                   icon: Text(
//                     "Save",
//                     style: TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                         color: chatController.selectedContacts.isEmpty
//                             ? Colors.grey
//                             : AppColorsLight.appBarColor),
//                   ),
//                   onPressed: () {
//                     // chatController.selectedContacts.clear();
//                     // if (chatController
//                     //     .selectedEmployeesByDepartAndServices.isNotEmpty) {
//                     //   List<Contact> l = [];
//                     //   for (var elDepart
//                     //       in chatController.selectedEmployeesByDepartAndServices) {
//                     //     if (elDepart.children.isNotEmpty) {
//                     //       for (var elService in elDepart.children) {
//                     //         if (elService.children.isNotEmpty) {
//                     //           for (var elEmployee in elService.children) {
//                     //             l.add(
//                     //               Contact(
//                     //                 contactId: elEmployee.id,
//                     //                 displayName: elEmployee.name,
//                     //                 phoneNumber: "phoneNumber",
//                     //               ),
//                     //             );
//                     //           }
//                     //         }
//                     //       }
//                     //     }
//                     //   }

//                     //   chatController.selectedContacts.value = l;
//                     //   chatController.selectedEmployeesByDepartAndServices.value = [];
//                     // } else {
//                     if (chatController.selectedContacts.isEmpty) {
//                       return;
//                     }
//                     chatController.filteredContacts.value =
//                         chatController.contacts;
//                     // }
//                     Navigator.of(modalSheetContext).pop();
//                   },
//                 );
//               }),
//         trailingNavBarWidget: IconButton(
//           padding: EdgeInsets.all(16.sp),
//           icon: const Icon(
//             Icons.close,
//             color: Colors.black,
//           ),
//           onPressed: () {
//             chatController.selectedContacts.clear();
//             chatController.filteredContacts.value = chatController.contacts;

//             Navigator.of(modalSheetContext).pop();
//           },
//         ),
//         mainContentSliversBuilder: (context) => [
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: CupertinoSearchTextField(
//                 onChanged: chatController.filterContacts,
//                 placeholder: 'Search Contacts',
//               ),
//             ),
//           ),
//           Obx(() {
//             return SliverList(
//                 delegate: chatController.tabIndex.value == 1
//                     ? SliverChildBuilderDelegate(
//                         (context, index) {
//                           return Obx(() {
//                             chatController.filteredContacts.value;
//                             final contact =
//                                 chatController.filteredContacts[index];
//                             return ListTile(
//                               leading: CircleAvatar(
//                                 radius: 22.0,
//                                 backgroundImage: CachedNetworkImageProvider(
//                                   contact.avatarUrl ?? "",
//                                 ),
//                               ),
//                               trailing: Checkbox(
//                                 value: chatController.selectedContacts.any(
//                                     (el) =>
//                                         el.contactId ==
//                                         chatController
//                                             .filteredContacts[index].contactId),
//                                 onChanged: (data) {
//                                   chatController.handleCheckboxChange(contact);
//                                 },
//                               ),
//                               title: InkWell(
//                                 onTap: () {
//                                   chatController.handleCheckboxChange(contact);
//                                 },
//                                 child: Text(contact.displayName),
//                               ),
//                             );
//                           });
//                         },
//                         childCount: chatController.filteredContacts.length,
//                       )
//                     : SliverChildBuilderDelegate(
//                         (context, index) {
//                           return Obx(() {
//                             // print(chatController.contacts.length)
//                             chatController
//                                 .selectedEmployeesByDepartAndServices.value;
//                             return index == 0
//                                 ? chatController
//                                         .employeesByDepartAndServices.isEmpty
//                                     ? SizedBox()
//                                     : MultiSelectNested(
//                                         controller: multiSelectController,
//                                         options: chatController
//                                             .employeesByDepartAndServices,
//                                         // selectedValues: selected,
//                                         isAnimatedContainer: false,
//                                         liveUpdateValues: true,
//                                         checkParentWhenChildIsSelected: true,
//                                         setSelectedValues:
//                                             (List<MultiSelectNestedItem>
//                                                 newValues) {
//                                           chatController
//                                                   .selectedContacts.value =
//                                               newValues
//                                                   .where((el) {
//                                                     return el.type ==
//                                                         "employee";
//                                                   })
//                                                   .map(
//                                                     (elEmployee) => Contact(
//                                                       contactId: elEmployee.id,
//                                                       displayName:
//                                                           elEmployee.name,
//                                                       phoneNumber:
//                                                           "phoneNumber",
//                                                     ),
//                                                   )
//                                                   .toList();
//                                         },
//                                       )
//                                 : SizedBox();
//                           });
//                         },
//                         childCount: 2,
//                       ));
//           }),
//         ],
//       );
//     }

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Text(
//               "Participants",
//               style: TextStyle(
//                 fontSize: 6.sp,
//                 fontWeight: FontWeight.bold,
//                 color: AppColorsLight.appBarColor,
//               ),
//             ),
//           ],
//         ),
//         InkWell(
//           onTap: () {
//             WoltModalSheet.show<void>(
//               context: context,
//               pageListBuilder: (modalSheetContext) {
//                 final textTheme = Theme.of(context).textTheme;
//                 return [
//                   // page1(modalSheetContext, textTheme),
//                   page2(modalSheetContext, textTheme),
//                 ];
//               },
//             );
//           },
//           child: Container(
//             width: 25.w,
//             height: 25.h,
//             padding: EdgeInsets.all(5.0),
//             decoration: BoxDecoration(
//               color: AppColorsLight.appBarColor.withOpacity(0.5),
//               shape: BoxShape.circle,
//             ),
//             child: Center(
//                 child: Icon(
//               Icons.add,
//               size: 15,
//             )),
//           ),
//         ),
//       ],
//     );
//   }
// }
