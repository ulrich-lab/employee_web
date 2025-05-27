// import 'dart:convert';

// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';
// import 'package:multiselect_nested/models/multiselect_nested_item.dart';
// import 'package:visitor_pass/Models/contact.dart';
// import 'package:visitor_pass/Models/message.dart';
// import 'package:visitor_pass/config/graphql/documents/chat.graphql.dart';
// import 'package:visitor_pass/config/graphql/schema.graphqls.dart';
// import 'package:visitor_pass/constants/constants.dart';
// import 'package:visitor_pass/core/datasources/graphql_datasource.dart';
// import 'package:visitor_pass/core/error/failure.dart';

// import '../domain/chat_repository.dart';

// @prod
// @LazySingleton(as: ChatRepository)
// class ChatRepositoryImpl implements ChatRepository {
//   final GraphqlDatasource graphQLDatasource;

//   ChatRepositoryImpl(
//     this.graphQLDatasource,
//   );

//   @override
//   Future<Either<Failure, List<Contact>>> getContactList(
//       {required String company_id}) async {
//     final result = await graphQLDatasource.query(
//         Options$Query$GetAllContactsList(
//             variables:
//                 Variables$Query$GetAllContactsList(company_id: company_id)));
//     return result.map(
//       (r) {
//         return r.employees.length > 0
//             ? [
//                 ...r.employees.map((el) {
//                   return Contact(
//                     contactId: el.id,
//                     displayName: "${el.firstname} ${el.lastname}",
//                     phoneNumber: el.phone_number ?? "",
//                     avatarUrl: el.file?.file_url ??
//                         "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
//                   );
//                 })
//               ]
//             : [];
//       },
//     );
//     // return Right([]);
//   }

//   @override
//   Future<Either<Failure, String>> createConversation(
//       {required String firstParticipant,
//       required String secondParticipant}) async {
//     final result = await graphQLDatasource.mutate(
//       Options$Mutation$CreateConversation(
//         variables: Variables$Mutation$CreateConversation(
//             firstParticipant: firstParticipant,
//             secondParticipants: secondParticipant),
//       ),
//     );
//     return result.map((r) {
//       return r.createConversation.id;
//     });
//     // return Right("");
//   }

//   @override
//   Future<Either<Failure, String>> sendMessage(
//       {required Message message, required String conversationId}) async {
//     if (message.attachment != null) {
    
     

//       final result = await graphQLDatasource.mutate(
//         Options$Mutation$InserMessageWithAttachment(
//           variables: Variables$Mutation$InserMessageWithAttachment(
//               sender_id: message.senderId,
//               conversation_id: conversationId,
//               content: message.content == "" ? null : message.content,
//               $extension: message.attachment?.type.value,
//               filename: message.attachment?.fileName ?? "",
//               file_path: message.attachment?.url,
//               file_size: message.attachment?.fileSize.toString(),
//               file_type: message.attachment?.type.value,
//               mime_type: message.attachment?.fileExtension,
//               width: message.attachment?.width.toString(),
//               height: message.attachment?.height.toString(),
//               message_mobile_id: message.id,
//               samples: json.encode(message.attachment?.samples)),
//         ),
//       );
//       return result.map((r) => r.insert_messages_one?.id ?? "");
//     } else {
      
//       final result = await graphQLDatasource.mutate(
//         Options$Mutation$InserMessageWithoutAttachment(
//           variables: Variables$Mutation$InserMessageWithoutAttachment(
//             sender_id: message.senderId,
//             conversation_id: conversationId,
//             content: message.content,
//             message_mobile_id: message.id,
//           ),
//         ),
//       );
//       return result.map(
//         (r) {
//           return r.insert_messages_one?.id ?? "";
//         },
//       );
//     }
//     // return Right("");
//   }

//   @override
//   Stream<List<Subscription$GetConversationStreamWithMessage$conversations>>
//       getChatStream({required String userId}) {
//     Stream<List<Subscription$GetConversationStreamWithMessage$conversations>>
//         convertLists = graphQLDatasource
//             .subscribe(
//       Options$Subscription$GetConversationStreamWithMessage(
//         variables: Variables$Subscription$GetConversationStreamWithMessage(
//           employee_id: userId,
//         ),
//       ),
//     )
//             .map(
//       (event) {
//         List<Subscription$GetConversationStreamWithMessage$conversations>
//             convertList = [];
//         for (var conversation in event.conversations) {
//           convertList.add(conversation);
//         }
//         return convertList;
//       },
//     );

//     return convertLists;
//   }

//   @override
//   Future<Either<Failure, String>> updateMessageStatus(
//       {required String id, required String status}) async {
//     final result = await graphQLDatasource.mutate(
//       Options$Mutation$UpdateMessageStatus(
//           variables:
//               Variables$Mutation$UpdateMessageStatus(id: [id], status: status)),
//     );
//     return result.map((r) => r.updateMessageStatus.state);
//     // return Right("");
//   }

//   @override
//   Future<Either<Failure, List<MultiSelectNestedItem>>> getAllEmployee() async {
//     final result =
//         await graphQLDatasource.query(Options$Query$GetAllEmployee());
//     return result.map(
//       (r) => r.departments
//           .map(
//             (elDepart) => MultiSelectNestedItem(
//               id: elDepart.id,
//               name: elDepart.text_content?.content ?? "",
//               type: "department",
//               children: elDepart.services
//                   .map(
//                     (elService) => MultiSelectNestedItem(
//                       type: "service",
//                       id: elService.id,
//                       name: elService.text_content?.content ?? "",
//                       children: elService.employees
//                           .map(
//                             (elEmployee) => MultiSelectNestedItem(
//                               type: "employee",
//                               id: elEmployee.id,
//                               name:
//                                   "${elEmployee.firstname} ${elEmployee.lastname}",
//                               children: [],
//                             ),
//                           )
//                           .toList()
//                           .where(
//                               (employee) => employee.id != box.read("user-id"))
//                           .toList(),
//                     ),
//                   )
//                   .toList(),
//             ),
//           )
//           .toList(),
//     );
//     // return Right([]);
//   }

//   @override
//   Future<Either<Failure, String>> createGroupe(
//       {required String name,
//       required String creatorId,
//       String? description,
//       required List<String> participants}) async {
//     final result = await graphQLDatasource.mutate(
//       Options$Mutation$CreateGroup(
//         variables: Variables$Mutation$CreateGroup(
//           members: participants
//               .map((el) => Input$employee_conversation_insert_input(
//                     employee_id: el,
//                   ))
//               .toList(),
//           name: name,
//         ),
//       ),
//     );
//     return result.map((r) => r.insert_conversations_one?.id ?? "");
//     // return Right("");
//   }
// }
