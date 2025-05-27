// import 'dart:io';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:visitor_pass/Controllers/contacts_controller.dart';
// import 'package:visitor_pass/Models/contact.dart';
// import 'package:visitor_pass/Models/user.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/theme/theme.dart';
// import 'package:visitor_pass/views/pages/chat/create_group.dart';
// import 'package:visitor_pass/views/widget/search.dart';

// class ContactsPage extends StatefulWidget {
//   final User user;
//   const ContactsPage({super.key, required this.user});

//   @override
//   State<ContactsPage> createState() => _ContactsPageState();
// }

// class _ContactsPageState extends State<ContactsPage> {
//   ContactPickerController contactPickerController =
//       Get.put(locator<ContactPickerController>());

//   @override
//   Widget build(BuildContext context) {
//     final colorTheme = Theme.of(context).custom.colorTheme;

//     return Obx(() {
//       return Scaffold(
//         body: Row(
//           children: [
//             Flexible(flex: 6, child: Container()),
//             Flexible(
//               flex: 4,
//               child: ScaffoldWithSearch(
//                 appBar: AppBar(
//                   elevation: 0.0,
//                   title: const Text(
//                     'Select contact',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   centerTitle: false,
//                   leading: IconButton(
//                     icon: const Icon(
//                       Icons.arrow_back,
//                       color: Colors.white,
//                     ),
//                     onPressed: () => Navigator.of(context).pop(),
//                   ),
//                   actions: [
//                     contactPickerController.isRefreshing.value
//                         ? Center(
//                             child: CircularProgressIndicator(
//                               color: colorTheme.greenColor,
//                             ),
//                           )
//                         : PopupMenuButton(
//                             onSelected: (value) {},
//                             color: colorTheme.appBarColor,
//                             child: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Icon(
//                                 Icons.more_vert,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             itemBuilder: (context) {
//                               return <PopupMenuEntry>[
//                                 PopupMenuItem(
//                                   onTap: () {},
//                                   child: Text(
//                                     'Contacts',
//                                     style: Theme.of(context)
//                                         .custom
//                                         .textTheme
//                                         .bodyText2
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                 ),
//                                 PopupMenuItem(
//                                   onTap: () {
//                                     contactPickerController
//                                         .refreshContactsList();
//                                   },
//                                   child: Text(
//                                     'Refresh',
//                                     style: Theme.of(context)
//                                         .custom
//                                         .textTheme
//                                         .bodyText2
//                                         .copyWith(color: Colors.white),
//                                   ),
//                                 ),
//                               ];
//                             },
//                           ),
//                   ],
//                 ),
//                 searchController: contactPickerController.searchController,
//                 onChanged: (value) =>
//                     contactPickerController.updateSearchResults(value),
//                 onCloseBtnPressed: contactPickerController.onCloseBtnPressed,
//                 searchIconActionIndex: 1,
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 8.0),
//                   child: ListView(
//                     physics: const BouncingScrollPhysics(),
//                     shrinkWrap: true,
//                     children: [
//                       if (!contactPickerController.contacts.isNotEmpty &&
//                           contactPickerController
//                               .searchController.text.isNotEmpty)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 12.0),
//                           child: Text(
//                             'No results found for \'${contactPickerController.searchController.text.trim()}\'',
//                             textAlign: TextAlign.center,
//                             style: Theme.of(context).custom.textTheme.caption,
//                           ),
//                         ),
//                       if (contactPickerController.searchController.text.isEmpty)
//                         Column(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Get.to(() => CreateGroup());
//                               },
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16.0,
//                                   vertical: 8.0,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor: colorTheme.greenColor,
//                                       child: const Icon(
//                                         Icons.people,
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 18.0,
//                                     ),
//                                     Text(
//                                       'New group',
//                                       style: Theme.of(context)
//                                           .custom
//                                           .textTheme
//                                           .bold,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       if (contactPickerController.contacts.isNotEmpty ||
//                           contactPickerController.filteredContacts.isNotEmpty)
//                         ..._buildWhatsAppContactsList(
//                           context,
//                           contactPickerController.filteredContacts.isNotEmpty
//                               ? contactPickerController.filteredContacts
//                               : contactPickerController.contacts,
//                         ),
//                       if (contactPickerController
//                           .searchController.text.isNotEmpty)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             vertical: 12.0,
//                             horizontal: 16.0,
//                           ),
//                           child: Text(
//                             'More',
//                             style: Theme.of(context).custom.textTheme.caption,
//                           ),
//                         ),
//                       Column(
//                         children: [
//                           if (contactPickerController
//                               .searchController.text.isNotEmpty)
//                             InkWell(
//                               onTap: contactPickerController.createNewContact,
//                               child: Padding(
//                                 padding: const EdgeInsets.symmetric(
//                                   horizontal: 16.0,
//                                   vertical: 8.0,
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     CircleAvatar(
//                                       backgroundColor: colorTheme.appBarColor,
//                                       child: Icon(
//                                         Icons.person_add,
//                                         color: colorTheme.iconColor,
//                                       ),
//                                     ),
//                                     const SizedBox(
//                                       width: 18.0,
//                                     ),
//                                     Text('New Contact',
//                                         style: Theme.of(context)
//                                             .custom
//                                             .textTheme
//                                             .bold),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           InkWell(
//                             onTap: contactPickerController.showHelp,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 16.0,
//                                 vertical: 8.0,
//                               ),
//                               child: Row(
//                                 children: [
//                                   CircleAvatar(
//                                     backgroundColor: colorTheme.appBarColor,
//                                     child: Icon(
//                                       Icons.question_mark,
//                                       color: colorTheme.iconColor,
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     width: 18.0,
//                                   ),
//                                   Text('Contacts help',
//                                       style: Theme.of(context)
//                                           .custom
//                                           .textTheme
//                                           .bold),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   List<Widget> _buildWhatsAppContactsList(
//     BuildContext context,
//     List<Contact> contactsOnWhatsApp,
//   ) {
//     return [
//       Padding(
//         padding: const EdgeInsets.symmetric(
//           vertical: 12.0,
//           horizontal: 16.0,
//         ),
//         child: Text(
//           'Contacts on vvims',
//           style: Theme.of(context).custom.textTheme.caption,
//         ),
//       ),
//       WhatsAppContactsList(
//         user: widget.user,
//         contactsOnWhatsApp: contactsOnWhatsApp,
//       )
//     ];
//   }

//   // List<Widget> _buildLocalContactsList(
//   //   BuildContext context,
//   //   List<Contact> contactsNotOnWhatsApp,
//   // ) {
//   //   return [
//   //     Padding(
//   //       padding: const EdgeInsets.symmetric(
//   //         vertical: 12.0,
//   //         horizontal: 16.0,
//   //       ),
//   //       child: Text(
//   //         'Invite to WhatsApp',
//   //         style: Theme.of(context).custom.textTheme.caption,
//   //       ),
//   //     ),
//   //     LocalContactsList(
//   //       contactsNotOnWhatsApp: contactsNotOnWhatsApp,
//   //     ),
//   //   ];
//   // }
// }

// class LocalContactsList extends StatelessWidget {
//   const LocalContactsList({
//     super.key,
//     required this.contactsNotOnWhatsApp,
//   });

//   final List<Contact> contactsNotOnWhatsApp;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (var contact in contactsNotOnWhatsApp)
//           InkWell(
//             onTap: () {},
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 8.0,
//               ),
//               child: Row(
//                 children: [
//                   const CircleAvatar(
//                     backgroundColor: Colors.black,
//                     backgroundImage: AssetImage('assets/images/avatar.png'),
//                   ),
//                   const SizedBox(
//                     width: 18.0,
//                   ),
//                   Text(
//                     contact.displayName,
//                     style: Theme.of(context).custom.textTheme.bold,
//                   ),
//                   const Expanded(
//                     child: SizedBox(
//                       width: double.infinity,
//                     ),
//                   ),
//                   // TextButton(
//                   //   onPressed: () {},
//                   //   child: Text(
//                   //     'INVITE',
//                   //     style: Theme.of(context).textTheme.bodySmall!.copyWith(
//                   //         color:
//                   //             Theme.of(context).custom.colorTheme.greenColor),
//                   //   ),
//                   // ),
//                   const SizedBox(
//                     width: 16.0,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

// class WhatsAppContactsList extends StatelessWidget {
//   final User user;

//   WhatsAppContactsList({
//     super.key,
//     required this.user,
//     required this.contactsOnWhatsApp,
//     // required this.ref,
//   });

//   final List<Contact> contactsOnWhatsApp;
//   // final WidgetRef ref;

//   ContactPickerController contactPickerController =
//       Get.put(locator<ContactPickerController>());

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for (var contact in contactsOnWhatsApp)
//           InkWell(
//             onTap: () {
//               contactPickerController.pickContact(context, user, contact);
//               contactPickerController.filteredContacts.clear();
//               contactPickerController.searchController.clear();
//             },
//             child: Container(
//               width: ScreenUtil().screenWidth > 640 ? 0.4.sw : 0.7.sw,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 8.0,
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: Colors.black,
//                     backgroundImage: CachedNetworkImageProvider(
//                       contact.avatarUrl!,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 18.0,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         width: ScreenUtil().screenWidth > 640 ? 0.3.sw : 0.7.sw,
//                         child: Text(
//                           contact.displayName,
//                           style: Theme.of(context).custom.textTheme.bold,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(
//                         width: 4.0,
//                       ),
//                       Text(
//                         'Hey there! I\'m using vvims.',
//                         style: Theme.of(context).custom.textTheme.caption,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }
