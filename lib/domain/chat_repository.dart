// import 'package:dartz/dartz.dart';
// import 'package:multiselect_nested/models/multiselect_nested_item.dart';
// import 'package:visitor_pass/Models/contact.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/config/graphql/documents/chat.graphql.dart';
// import 'package:visitor_pass/core/error/failure.dart';

// abstract class ChatRepository {
//   Future<Either<Failure, List<Contact>>> getContactList(
//       {required String company_id});

//   Future<Either<Failure, String>> createConversation(
//       {required String firstParticipant, required String secondParticipant});

//   Future<Either<Failure, String>> sendMessage(
//       {required Message message, required String conversationId});

//   Stream<List<Subscription$GetConversationStreamWithMessage$conversations>>
//       getChatStream({required String userId});
//   // Future<List<Query$GetConversationStreamWithMessage$conversations>>
//   //     getChatStream({required String userId});

//   Future<Either<Failure, String>> updateMessageStatus(
//       {required String id, required String status});

//   Future<Either<Failure, String>> createGroupe({
//     required String name,
//     required String creatorId,
//     String? description,
//     required List<String> participants,
//   });

//   Future<Either<Failure, List<MultiSelectNestedItem>>> getAllEmployee();
// }
