// import 'package:injectable/injectable.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:visitor_pass/Models/attachement.dart';
// import 'package:visitor_pass/Models/contact.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/Models/messages.dart';
// import 'package:visitor_pass/Models/recent_chat.dart';
// import 'package:visitor_pass/Models/user.dart';
// import 'package:visitor_pass/constants/constants.dart';

// import 'package:visitor_pass/domain/chat_repository.dart';
// import 'package:visitor_pass/services/user-service.dart';
// import 'package:visitor_pass/utils/abc.dart';

// @singleton
// @preResolve
// class IsarDb {
//   static late final Isar isar;

//   final ChatRepository chatRepository;

//   IsarDb(this.chatRepository);

//   @factoryMethod
//   static Future<IsarDb> init(ChatRepository chatRepository) async {
//     // final dir = await getApplicationDocumentsDirectory();

//     isar = await Isar.open(
//       [StoredMessageSchema, ContactSchema, UserSchema],
//       // directory: dir.path,
//       directory: "",
//     );
//     return IsarDb(chatRepository);
//   }

//   Future<void> addMessage({
//     required Message message,
//     String? conversationId,
//     required bool commingFromNet,
//   }) async {
//     if (commingFromNet) {
//       final messageExists = await isar.storedMessages
//           .filter()
//           .messageIdEqualTo(message.id)
//           .findFirst();

//       if (messageExists != null) {
//         updateMessage(message.id, status: message.status);
//         return;
//       }
//     }

//     final storedMsg = StoredMessage(
//       conversationId:
//           message.group != null ? message.group!.id! : conversationId!,
//       messageId: message.id,
//       group: message.group,
//       chatId: message.group != null
//           ? message.group!.id!
//           : getChatId(message.senderId, message.receiverId!),
//       content: message.content,
//       senderId: message.senderId,
//       receiverId: message.group != null ? null : message.receiverId!,
//       status: message.status,
//       timestamp: message.timestamp,
//       attachment: message.attachment != null
//           ? EmbeddedAttachment(
//               fileName: message.attachment!.fileName,
//               fileExtension: message.attachment!.fileExtension,
//               fileSize: message.attachment!.fileSize,
//               width: message.attachment!.width,
//               height: message.attachment!.height,
//               autoDownload: message.attachment!.autoDownload,
//               uploadStatus: message.attachment!.uploadStatus,
//               url: message.attachment!.url,
//               type: message.attachment!.type,
//               samples: message.attachment!.samples,
//             )
//           : null,
//     );
//     await isar.writeTxn(() async {
//       await isar.storedMessages.put(storedMsg);
//     });
//   }

//   Future<void> updateMessage(
//     String messageId, {
//     String? content,
//     MessageStatus? status,
//     Attachment? attachment,
//   }) async {
//     await isar.writeTxn(() async {
//       StoredMessage? msg = await isar.storedMessages
//           .filter()
//           .messageIdEqualTo(messageId)
//           .build()
//           .findFirst();

//       if (msg == null) return;

//       msg.content = content ?? msg.content;
//       msg.status = status ?? msg.status;

//       if (attachment != null) {
//         msg.attachment = EmbeddedAttachment(
//           fileName: attachment.fileName,
//           fileExtension: attachment.fileExtension,
//           fileSize: attachment.fileSize,
//           width: attachment.width,
//           height: attachment.height,
//           uploadStatus: attachment.uploadStatus,
//           autoDownload: attachment.autoDownload,
//           url: attachment.url,
//           type: attachment.type,
//           samples: attachment.samples,
//         );
//       }

//       await isar.storedMessages.put(msg);
//     });
//   }

//   Stream<List<Message>> getChatStream(String chatId) {
//     return isar.storedMessages
//         .filter()
//         .chatIdEqualTo(chatId)
//         .sortByTimestampDesc()
//         .build()
//         .watch(fireImmediately: true)
//         .map((event) => event
//             .map(
//               (msg) => Message(
//                 id: msg.messageId,
//                 content: msg.content,
//                 senderId: msg.senderId,
//                 group: msg.group,
//                 receiverId: msg.group != null ? null : msg.receiverId,
//                 timestamp: DateTime.parse(msg.timestamp.toString()),
//                 status: msg.status,
//                 attachment: msg.attachment != null
//                     ? Attachment(
//                         fileName: msg.attachment!.fileName!,
//                         fileExtension: msg.attachment!.fileExtension!,
//                         fileSize: msg.attachment!.fileSize!,
//                         width: msg.attachment!.width,
//                         height: msg.attachment!.height,
//                         uploadStatus: msg.attachment!.uploadStatus!,
//                         autoDownload: msg.attachment!.autoDownload ?? false,
//                         url: msg.attachment!.url!,
//                         type: msg.attachment!.type!,
//                         samples: msg.attachment!.samples,
//                       )
//                     : null,
//               ),
//             )
//             .toList());
//   }

//   Future<String?> getConversationId(String chatId) async {
//     final messages = await isar.storedMessages
//         .filter()
//         .chatIdEqualTo(chatId)
//         .sortByTimestampDesc()
//         .build()
//         .watch(fireImmediately: true)
//         .first;

//     if (messages.isEmpty) return null;

//     final msg = messages.first;

//     return msg.conversationId;
//   }

//   Future<bool> doesMessageExist(chatId, messageId) async {
//     final messages = await isar.storedMessages
//         .filter()
//         .chatIdEqualTo(chatId)
//         .sortByTimestampDesc()
//         .build()
//         .watch(fireImmediately: true)
//         .first;

//     return messages.any((message) {
//       return message.messageId != messageId;
//     });
//   }

//   Future<void> setAllReaded(String chatId) async {
//     final messages = await isar.storedMessages
//         .filter()
//         .chatIdEqualTo(chatId)
//         .sortByTimestampDesc()
//         .build()
//         .watch(fireImmediately: true)
//         .first;

//     if (messages.isEmpty) return null;

//     messages.forEach((message) {
//       final clientIsSender = message.senderId == box.read("user-id");
//       if (clientIsSender || message.status == MessageStatus.seen) {
//       } else {
//         updateMessage(message.messageId, status: MessageStatus.seen);
//       }
//     });
//   }

//   Stream<List<RecentChat>> getRecentChatStream() {
//     var userId = box.read("user-id");

//     return isar.storedMessages
//         .where()
//         .sortByTimestampDesc()
//         .watch(fireImmediately: true)
//         .asyncMap((event) async {
//       final Map<String, int> visitedChats = {};
//       final recentChats = <RecentChat>[];

//       for (final msg in event) {
//         final clientIsSender = msg.senderId == userId;
//         if (visitedChats.containsKey(msg.chatId)) {
//           if (clientIsSender) continue;
//           if (msg.status == MessageStatus.seen) continue;

//           visitedChats[msg.chatId] = visitedChats[msg.chatId]! + 1;
//           continue;
//         }

//         var sender = await getUserById(
//           clientIsSender
//               ? msg.group != null
//                   ? msg.group!.senderId!
//                   : msg.receiverId!
//               : msg.senderId,
//         );
//         final senderName = sender?.name;
//         recentChats.add(
//           RecentChat(
//             message: Message(
//               id: msg.messageId,
//               content: msg.content,
//               group: msg.group,
//               senderId: msg.group != null ? msg.group!.senderId! : msg.senderId,
//               receiverId: msg.group != null ? null : msg.receiverId,
//               timestamp: DateTime.parse(msg.timestamp.toString()),
//               status: msg.status,
//               attachment: msg.attachment != null
//                   ? Attachment(
//                       fileName: msg.attachment!.fileName!,
//                       fileExtension: msg.attachment!.fileExtension!,
//                       fileSize: msg.attachment!.fileSize!,
//                       width: msg.attachment!.width,
//                       height: msg.attachment!.height,
//                       uploadStatus: msg.attachment!.uploadStatus!,
//                       autoDownload: msg.attachment!.autoDownload ?? false,
//                       url: msg.attachment!.url!,
//                       type: msg.attachment!.type!,
//                     )
//                   : null,
//             ),
//             user: msg.group == null
//                 ? User.fromMap(
//                     sender!.toMap()
//                       ..addAll({
//                         'name': senderName,
//                       }),
//                   )
//                 : null,
//             group: msg.group != null
//                 ? Group(
//                     id: msg.group!.id,
//                     name: msg.group!.name,
//                     senderId: msg.group!.senderId,
//                     members: msg.group!.members,
//                   )
//                 : null,
//           ),
//         );

//         visitedChats[msg.chatId] =
//             clientIsSender || msg.status == MessageStatus.seen ? 0 : 1;
//       }

//       for (final chat in recentChats) {
//         if (chat.group == null) {
//           chat.unreadCount = visitedChats[
//               getChatId(chat.message.senderId, chat.message.receiverId!)]!;
//         }
//       }
     
//       return recentChats;
//     });
//   }

//   Future<void> addContacts() async {
//     var contactsRes =
//         await chatRepository.getContactList(company_id: box.read('company_id'));
//     contactsRes.fold((l) {}, (contacts) async {
//       List<Contact> updatedContacts = [];
//       List<User> updatedUser = [];

//       for (var contact in contacts) {
//         var updatedContact = Contact(
//           userId: contact.contactId,
//           avatarUrl: contact.avatarUrl,
//           contactId: contact.contactId,
//           displayName: contact.displayName,
//           phoneNumber: contact.phoneNumber,
//         );
//         if (contact.contactId != box.read("user-id")) {
//           updatedContacts.add(updatedContact);

//           updatedUser.add(
//             User(
//               id: contact.contactId,
//               name: contact.displayName,
//               avatarUrl: contact.avatarUrl ?? "",
//               phone: Phone(
//                 number: contact.phoneNumber,
//                 formattedNumber: contact.phoneNumber,
//                 code: "+237",
//               ),
//               activityStatus: UserActivityStatus.online,
//             ),
//           );
//         }
//       }

//       await isar.writeTxn(() async {
//         await isar.contacts.clear();
//         await isar.users.clear();
//         await isar.contacts.putAll(updatedContacts);
//         await isar.users.putAll(updatedUser.nonNulls.toList());
//       });
//     });
//   }

//   Future<void> refreshContacts() async {
//     await addContacts();
//   }

//   Future<void> clearMessages() async {
//     await isar.writeTxn(() async {
//       await isar.contacts.clear();
//       await isar.users.clear();
//       await isar.storedMessages.clear();
//     });
//   }

//   Future<List<Contact>> getContacts() async {
//     return await isar.contacts.where().findAll();
//   }

//   Future<User?> getUserById(String id) async {
//     return await isar.users.filter().idEqualTo(id).findFirst();
//   }

//   Future<List<Contact>> getWhatsAppContacts() async {
//     return await isar.contacts.filter().userIdIsNotNull().findAll();
//   }
// }
