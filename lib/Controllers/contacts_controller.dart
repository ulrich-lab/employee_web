// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:injectable/injectable.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:visitor_pass/Models/contact.dart';
// import 'package:visitor_pass/Models/user.dart';
// import 'package:visitor_pass/config/locator/locator.dart';
// import 'package:visitor_pass/domain/chat_repository.dart';
// import 'package:visitor_pass/views/pages/chat/chat.dart';

// import '../config/locator/isar_bd.dart';


// @lazySingleton
// class ContactPickerController extends GetxController {
//   ChatRepository chatRepository;
//   ContactPickerController(this.chatRepository);
//   final RxList<Contact> contacts = <Contact>[].obs;
//   final RxList<Contact> filteredContacts = <Contact>[].obs;
//   final TextEditingController searchController = TextEditingController();
//   final isRefreshing = false.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchContacts();
//     searchController.addListener(() {
//       updateSearchResults(searchController.text);
//     });
//   }

//   Future<void> fetchContacts() async {
   
//     final contactList = await locator<IsarDb>().getContacts();

//     contacts.assignAll(contactList);
//     filteredContacts.assignAll(contactList);
//   }

//   void refreshContactsList() async {
//     isRefreshing.value = true;
//     await fetchContacts();
//     isRefreshing.value = false;
//   }

//   void pickContact(BuildContext context, User sender, Contact contact) async {
  
//     final receiver = await locator<IsarDb>().getUserById(contact.userId!);
//     if (receiver != null) {
//       Get.off(
//         () => ChatPage(
//           self: sender,
//           other: receiver,
//           otherUserContactName: contact.displayName,
//         ),
//         arguments: {'chat': 'Chat'},
//       );
//     }
//   }

//   void createNewContact() {
//     // ContactRepository().createNewContact();
//   }

//   void shareInviteLink(RenderBox? box) {
//     Share.share(
//       "VVIMS",
//       subject: 'VVIMS Messenger: Android + iPhone',
//       sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
//     );
//   }

//   void sendSms(String phoneNumber) {
//     // launchUrl(Uri.parse('sms:$phoneNumber?body=$shareMsg'));
//   }

//   void showHelp() {
//     launchUrl(
//       Uri.parse(
//         '',
//       ),
//     );
//   }

//   void onCloseBtnPressed() {
//     searchController.clear();
//     filteredContacts.assignAll(contacts);
//   }

//   void updateSearchResults(String query) {
//     query = query.toLowerCase().trim();
//     if (query.isEmpty) {
//       filteredContacts.assignAll(contacts);
//     } else {
//       filteredContacts.assignAll(
//         contacts.where((contact) {
//           return contact.displayName.toLowerCase().startsWith(query);
//         }).toList(),
//       );
//     }
//   }

//   @override
//   void onClose() {
//     searchController.dispose();
//     super.onClose();
//   }
// }
