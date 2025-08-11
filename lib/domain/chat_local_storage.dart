
import '../Models/message.dart';
import '../Models/recent_chat.dart';
import '../Models/contact.dart';
import '../Models/user.dart';
import '../Models/attachement.dart';

abstract class IChatLocalStorage {
  Future<void> addMessage({
    required Message message,
    String? conversationId,
    bool commingFromNet = false,
  });

  Stream<List<Message>> getChatStream(String chatId);
 
  Stream<List<RecentChat>> getRecentChatStream();

  Future<List<Contact>> getContacts();
  Future<void> addContacts();
  Future<void> refreshContacts();
  
  Future<User?> getUserById(String userId);

  Future<String?> getConversationId(String chatId);

  Future<void> updateMessage(
    String messageId, {
    MessageStatus? status,
    Attachment? attachment,
  });

  Future<List<Contact>> getWhatsAppContacts();

  Future<void> setAllReaded(String chatId);

  // Ajoute d'autres méthodes nécessaires selon les besoins du chat
} 