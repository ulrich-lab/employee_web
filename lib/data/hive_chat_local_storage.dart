import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import '../domain/chat_local_storage.dart';
import '../Models/message.dart';
import '../Models/recent_chat.dart';
import '../Models/contact.dart';
import '../Models/user.dart';
import '../Models/attachement.dart';
import 'package:visitor_pass/main.dart';
import 'package:visitor_pass/domain/chat_repository.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import '../Models/stored_message.dart';

@LazySingleton(as: IChatLocalStorage)
class HiveChatLocalStorage implements IChatLocalStorage {
  static const String storedMessagesBox = 'storedMessages';
  static const String contactsBox = 'contacts';
  static const String usersBox = 'users';

  @override
  Future<void> addMessage({
    required Message message,
    String? conversationId,
    bool commingFromNet = false,
  }) async {
    final box = await Hive.openBox<StoredMessage>(storedMessagesBox);
    if (commingFromNet) {
      if (box.values.any((m) => m.messageId == message.id)) {
        await updateMessage(message.id, status: message.status);
        return;
      }
    }
    final storedMsg = StoredMessage(
      conversationId:
          message.group != null ? message.group!.id! : conversationId!,
      messageId: message.id,
      group: message.group,
      chatId: message.group != null
          ? message.group!.id!
          : getChatId(message.senderId, message.receiverId!),
      content: message.content,
      senderId: message.senderId,
      receiverId: message.group != null ? null : message.receiverId!,
      status: message.status,
      timestamp: message.timestamp,
      attachment: message.attachment != null
          ? Attachment(
              fileName: message.attachment!.fileName,
              fileExtension: message.attachment!.fileExtension,
              fileSize: message.attachment!.fileSize,
              width: message.attachment!.width,
              height: message.attachment!.height,
              autoDownload: message.attachment!.autoDownload,
              uploadStatus: message.attachment!.uploadStatus,
              url: message.attachment!.url,
              type: message.attachment!.type,
              samples: message.attachment!.samples,
            )
          : null,
    );
    // final stored = StoredMessage.fromMessage(message);
    // await box.put(stored.messageId, stored);

    await box.put(storedMsg.chatId, storedMsg);
  }

  @override
  Future<void> updateMessage(
    String messageId, { 
    String? content,
    MessageStatus? status,
    Attachment? attachment,
  }) async {
    final box = await Hive.openBox<StoredMessage>(storedMessagesBox);
    final msg = box.get(messageId);
    if (msg == null) return;

    final updated = StoredMessage(
      chatId: msg.chatId,
      messageId: msg.messageId,
      content: content ?? msg.content,
      senderId: msg.senderId,
      receiverId: msg.receiverId,
      group: msg.group,
      timestamp: msg.timestamp,
      attachment: attachment ?? msg.attachment,
      status: status ?? msg.status,
    );
    await box.put(messageId, updated);
  }

  @override
  Stream<List<Message>> getChatStream(String chatId) async* {
    final box = await Hive.openBox<StoredMessage>(storedMessagesBox);

    Stream<List<Message>> buildStream() async* {
      final messages = box.values.where((msg) => msg.chatId == chatId).toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
      yield messages.map((m) => m.toMessage()).toList();
    }

    yield* buildStream();
    yield* box.watch().asyncExpand((event) => buildStream());
  }

  @override
  Future<String?> getConversationId(String chatId) async {
    final box = await Hive.openBox<StoredMessage>(storedMessagesBox);
    final messages = box.values.where((msg) => msg.chatId == chatId).toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
    if (messages.isEmpty) return null;
    return messages.first.group?.id ?? messages.first.receiverId;
  }

  @override
  Future<bool> doesMessageExist(String chatId, String messageId) async {
    final box = await Hive.openBox<StoredMessage>(storedMessagesBox);
    return box.values
        .any((msg) => msg.chatId == chatId && msg.messageId == messageId);
  }

  @override
  Future<void> setAllReaded(String chatId) async {
    final box = await Hive.openBox<StoredMessage>(storedMessagesBox);
    final userId = prefs.getString("user-id");

    for (final msg in box.values.where((msg) => msg.chatId == chatId)) {
      final clientIsSender = msg.senderId == userId;
      if (!clientIsSender && msg.status != MessageStatus.seen) {
        await updateMessage(msg.messageId, status: MessageStatus.seen);
      }
    }
  }

  // @override
  // Stream<List<RecentChat>> getRecentChatStream() async* {
  //   final box = await Hive.openBox<StoredMessage>(storedMessagesBox);
  //   yield await _buildRecentChats(box.values.toList());
  //   yield* box.watch().asyncMap((event) async {
  //     return await _buildRecentChats(box.values.toList());
  //   });
  // }

  // Future<List<RecentChat>> _buildRecentChats(
  //     List<StoredMessage> messages) async {
  //   final String? userId = prefs.getString("user-id");
  //   final Map<String, int> visitedChats = {};
  //   final Map<String, List<StoredMessage>> grouped = {};

  //   for (final msg in messages) {
  //     final chatId = msg.chatId;

  //     grouped.putIfAbsent(chatId, () => []).add(msg);
  //   }

  //   final List<RecentChat> recentChats = [];

  //   for (final entry in grouped.entries) {
  //     final chatId = entry.key;
  //     final msgs = entry.value;

  //     msgs.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  //     final lastMsg = msgs.first;

  //     final clientIsSender = lastMsg.senderId == userId;

  //     if (visitedChats.containsKey(chatId)) {
  //       if (clientIsSender || lastMsg.status == MessageStatus.seen) continue;
  //       visitedChats[chatId] = visitedChats[chatId]! + 1;
  //       continue;
  //     }

  //     User? sender;
  //     if (lastMsg.group != null) {
  //       sender = await getUserById(lastMsg.group!.senderId!);
  //     } else {
  //       sender = await getUserById(
  //           clientIsSender ? lastMsg.receiverId! : lastMsg.senderId);
  //     }

  //     recentChats.add(
  //       RecentChat(
  //         message: lastMsg.toMessage(),
  //         user: lastMsg.group == null ? sender : null,
  //         group: lastMsg.group != null
  //             ? Group(
  //                 id: lastMsg.group!.id,
  //                 name: lastMsg.group!.name,
  //                 senderId: lastMsg.group!.senderId,
  //                 members: lastMsg.group!.members,
  //               )
  //             : null,
  //       ),
  //     );

  //     visitedChats[chatId] =
  //         (clientIsSender || lastMsg.status == MessageStatus.seen) ? 0 : 1;
  //   }

  //   for (final chat in recentChats) {
  //     if (chat.group == null) {
  //       chat.unreadCount = visitedChats[
  //               getChatId(chat.message.senderId, chat.message.receiverId!)] ??
  //           0;
  //     }
  //   }
  //   print("recentChats=======: ${recentChats.length}");
  //   return recentChats;
  // }

  @override
  Stream<List<RecentChat>> getRecentChatStream() {
    final userId = prefs.getString("user-id");
    final box = Hive.box<StoredMessage>('storedMessages');

    return box.watch().map((_) => box.values.toList()).asyncMap((event) async {
      final Map<String, int> visitedChats = {};
      final recentChats = <RecentChat>[];

      // Tri décroissant par timestamp
      final sortedMessages = event.toList()
        ..sort((a, b) => b.timestamp.compareTo(a.timestamp));

      for (final msg in sortedMessages) {
        final clientIsSender = msg.senderId == userId;

        if (visitedChats.containsKey(msg.chatId)) {
          if (clientIsSender) continue;
          if (msg.status == MessageStatus.seen) continue;

          visitedChats[msg.chatId] = visitedChats[msg.chatId]! + 1;
          continue;
        }

        final sender = await getUserById(
          clientIsSender
              ? msg.group != null
                  ? msg.group!.senderId!
                  : msg.receiverId!
              : msg.senderId,
        );

        final senderName = sender?.name;

        recentChats.add(
          RecentChat(
           message: Message(
              id: msg.messageId,
              content: msg.content,
              group: msg.group,
              senderId: msg.group != null ? msg.group!.senderId! : msg.senderId,
              receiverId: msg.group != null ? null : msg.receiverId,
              timestamp: DateTime.parse(msg.timestamp.toString()),
              status: msg.status,
              attachment: msg.attachment != null
                  ? Attachment(
                      fileName: msg.attachment!.fileName,
                      fileExtension: msg.attachment!.fileExtension,
                      fileSize: msg.attachment!.fileSize,
                      width: msg.attachment!.width,
                      height: msg.attachment!.height,
                      uploadStatus: msg.attachment!.uploadStatus,
                      autoDownload: msg.attachment!.autoDownload,
                      url: msg.attachment!.url,
                      type: msg.attachment!.type,
                    )
                  : null,
            ),
            user: msg.group == null
                ? User.fromMap(
                    sender!.toMap()
                      ..addAll({
                        'name': senderName,
                      }),
                  )
                : null,
            group: msg.group != null
                ? Group(
                    id: msg.group!.id,
                    name: msg.group!.name,
                    senderId: msg.group!.senderId,
                    members: msg.group!.members,
                  )
                : null,
          ),
        );

        visitedChats[msg.chatId] =
            clientIsSender || msg.status == MessageStatus.seen ? 0 : 1;
      }

      for (final chat in recentChats) {
        if (chat.group == null) {
          chat.unreadCount = visitedChats[
              getChatId(chat.message.senderId, chat.message.receiverId!)]!;
        }
      }

      return recentChats;
    });
  }

  @override
  Future<void> addContacts() async {
    final chatRepository = locator<ChatRepository>();
    var contactsRes = await chatRepository.getContactList(
      company_id: prefs.getString('company_id') ?? "",
    );

    contactsRes.fold((l) {}, (contacts) async {
      List<Contact> updatedContacts = [];
      List<User> updatedUser = [];

      for (var contact in contacts) {
        var updatedContact = Contact(
          userId: contact.contactId,
          avatarUrl: contact.avatarUrl,
          contactId: contact.contactId,
          displayName: contact.displayName,
          phoneNumber: contact.phoneNumber,
        );

        if (contact.contactId != prefs.getString("user-id")) {
          updatedContacts.add(updatedContact);
          updatedUser.add(
            User(
              id: contact.contactId,
              name: contact.displayName,
              avatarUrl: contact.avatarUrl ?? "",
              phone: Phone(
                number: contact.phoneNumber,
                formattedNumber: contact.phoneNumber,
                code: "+237",
              ),
              activityStatus: UserActivityStatus.online,
            ),
          );
        }
      }

      final boxContacts = await Hive.openBox<Contact>(contactsBox);
      final boxUsers = await Hive.openBox<User>(usersBox);
      await boxContacts.clear();
      await boxUsers.clear();
      await boxContacts.addAll(updatedContacts);
      await boxUsers.addAll(updatedUser);
    });
  }

  @override
  Future<void> refreshContacts() async {
    await addContacts();
  }

  Future<void> clearMessages() async {
    final boxMsg = await Hive.openBox<StoredMessage>(storedMessagesBox);
    final boxContacts = await Hive.openBox<Contact>(contactsBox);
    final boxUsers = await Hive.openBox<User>(usersBox);
    await boxMsg.clear();
    await boxContacts.clear();
    await boxUsers.clear();
  }

  @override
  Future<List<Contact>> getContacts() async {
    final box = await Hive.openBox<Contact>(contactsBox);
    return box.values.toList();
  }

  @override
  Future<User?> getUserById(String userId) async {
    final box = await Hive.openBox<User>(usersBox);
    return box.values.firstWhere((u) => u.id == userId);
  }

  Future<List<Contact>> getWhatsAppContacts() async {
    final box = await Hive.openBox<Contact>(contactsBox);
    return box.values.where((c) => c.userId != null).toList();
  }

  String getChatId(String senderId, String receiverId) {
    return senderId.compareTo(receiverId) < 0
        ? '$senderId-$receiverId'
        : '$receiverId-$senderId';
  }
}
