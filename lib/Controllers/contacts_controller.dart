import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
// import 'package:share_plus/share_plus.dart'; // Commenté car package manquant ou non utilisé
import 'package:url_launcher/url_launcher.dart';
import 'package:visitor_pass/Models/contact.dart';
import 'package:visitor_pass/Models/user.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:visitor_pass/domain/chat_repository.dart';
import 'package:visitor_pass/domain/chat_local_storage.dart';
import 'package:visitor_pass/views/pages/chat/chat.dart';

@lazySingleton
class ContactPickerController extends GetxController {
  ChatRepository chatRepository;
  ContactPickerController(this.chatRepository);
  final RxList<Contact> contacts = <Contact>[].obs;
  final RxList<Contact> filteredContacts = <Contact>[].obs;
  final TextEditingController searchController = TextEditingController();
  final isRefreshing = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
    searchController.addListener(() {
      updateSearchResults(searchController.text);
    });
  }

  Future<void> fetchContacts() async {
    await locator<IChatLocalStorage>().refreshContacts();
    await Future.delayed(const Duration(seconds: 1), () {});
    getContacts();
  }

  Future<void> getContacts() async {
    // await locator<IChatLocalStorage>().refreshContacts();
    final contactList = await locator<IChatLocalStorage>().getContacts();
    contacts.assignAll(contactList);
    filteredContacts.assignAll(contactList);
  }

  void refreshContactsList() async {
    isRefreshing.value = true;
    await fetchContacts();
    isRefreshing.value = false;
  }

  void pickContact(BuildContext context, User sender, Contact contact) async {
    final receiver =
        await locator<IChatLocalStorage>().getUserById(contact.userId!);
    if (receiver != null) {
      Get.off(
        () => ChatPage(
          self: sender,
          other: receiver,
          otherUserContactName: contact.displayName,
        ),
        arguments: {'chat': 'Chat'},
      );
    }
  }

  void createNewContact() {
    // ContactRepository().createNewContact();
  }

  void sendSms(String phoneNumber) {
    // launchUrl(Uri.parse('sms:$phoneNumber?body=$shareMsg'));
  }

  void showHelp() {
    launchUrl(
      Uri.parse(
        '',
      ),
    );
  }

  void onCloseBtnPressed() {
    searchController.clear();
    filteredContacts.assignAll(contacts);
  }

  void updateSearchResults(String query) {
    query = query.toLowerCase().trim();
    if (query.isEmpty) {
      filteredContacts.assignAll(contacts);
    } else {
      filteredContacts.assignAll(
        contacts.where((contact) {
          return contact.displayName.toLowerCase().startsWith(query);
        }).toList(),
      );
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
