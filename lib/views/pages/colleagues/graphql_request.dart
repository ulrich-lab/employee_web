// import 'package:graphql_flutter/graphql_flutter.dart';

// String inserUserConversations = '''
//     mutation CreateConversation(\$firstParticipant: String!, \$secondParticipant: String!, \$title: String!) {
//       createConversation(input: {firstParticipant: \$firstParticipant, secondParticipant: \$secondParticipant, title: \$title}) {
//         conversationID
//       }
//     }
//   ''';

// String insertConversation = '''
//     mutation InsertConversation(\$creatorID: String!) {
//       insert_Conversations(objects: {creatorID: \$creatorID}, on_conflict: {constraint: conversation_pkey, update_columns: conversationID}) {
//         affected_rows
//         returning {
//           conversationID
//         }
//       }
//     }
//   ''';

// String updateMessageStatus = '''
//   mutation UpdateMessageStatus(\$message_id: uuid!) {
//       update_message_status(where: {message_id: {_eq: \$message_id}}, _set: {status: READ}) {
//         affected_rows
//         returning {
//           id
//           message_id
//           status
//         }
//       }
//   }
//   ''';

// String getConversationList = '''
//   query GetConversationLastMessageUnreadMessageCount(\$user_id: String!) {
//     conversations(order_by: {updated_at: desc}, where: {user_conversations: {user_id: {_eq: \$user_id}}}) {
//       id
//       title
//       is_group
//       user_conversations(where: {employee:{id: { _neq:\$user_id }}}) {
//         id
//         employee {
//           first_name
//           id
//           display_name
//           last_name
//         }
//       }
//       messages(order_by: {created_at: desc}, limit: 1) {
//         created_at
//         text_content {
//           text
//         }
//       }
//       messages_aggregate(where: {message_statuses: {status: {_eq: UNREAD}}, employee: {id: {_neq: \$user_id}}}) {
//         aggregate {
//           count
//         }
//       }
//     }
//   }
//   ''';

// final subscriptionConversationList = gql(
//   r'''
//   subscription GetConversationLastMessageUnreadMessageCount($user_id: String!) {
//     conversations(order_by: {updated_at: desc}, where: {user_conversations: {user_id: {_eq: $user_id}}}) {
//       id
//       title
//       is_group
//       user_conversations(where: {employee:{id: { _neq:$user_id }}}) {
//         id
//         employee {
//           first_name
//           id
//           display_name
//           last_name
//         }
//       }
//       messages(order_by: {created_at: desc}, limit: 1) {
//         created_at
//         text_content {
//           text
//         }
//       }
//       messages_aggregate(where: {message_statuses: {status: {_eq: UNREAD}}, employee: {id: {_neq: $user_id}}}) {
//         aggregate {
//           count
//         }
//       }
//     }
//   }
//   ''',
// );

// String insertMessage = '''
//   mutation InsertMessage(\$conversation_id: uuid!, \$sender_id: String!, \$text: String!) {
//     insert_messages_one(object: {conversation_id: \$conversation_id, sender_id: \$sender_id, text_content: {data: {text: \$text}}, message_statuses: {data: {status: UNREAD}}, is_deleted: false}) {
//       id    
//     }
//     update_conversations_by_pk(pk_columns: {id: \$conversation_id}, _set: {updated_at: now}){
//       id
//     }
//   }
// ''';

// String getMessageByConversation = """
//   query GetMessageByConversation(\$conversation_id: uuid!) {
//     messages(order_by: {created_at: asc}, where: {conversation_id: {_eq: \$conversation_id}}) {
//       id
//       sender_id
//       created_at
//       employee {
//         id
//         first_name
//         last_name
//       }
//       message_statuses {
//         status
//       }
//       text_content {
//         text
//       }
//       files {
//         created_at
//         file_url
//         height
//         id
//         length
//         size
//         width
//         file_type {
//           mime_type
//           type
//         }
//       }
//     }
//   }
// """;

// final subscriptionGetMessageByConversation = gql(
//   r'''
//   subscription GetMessageByConversation($conversation_id: uuid!) {
//     messages(order_by: {created_at: asc}, where: {conversation_id: {_eq: $conversation_id}}) {
//       id
//       sender_id
//       created_at
//       employee {
//         id
//         first_name
//         last_name
//       }
//       message_statuses {
//         status
//       }
//       text_content {
//         text
//       }
//       files {
//         created_at
//         file_url
//         height
//         id
//         length
//         size
//         width
//         file_type {
//           mime_type
//           type
//         }
//       }
//     }
//   }
//   ''',
// );

// String insertMessageWithFile = '''
//   mutation InsertMessageWithFile(\$conversation_id: uuid!, \$sender_id: String!, \$text: String!, \$file_url: String!, \$size: numeric!, \$mime_type: String!, \$type: doc_type_enum!, \$height: numeric!, \$width: numeric!, \$length: numeric!) {
//     insert_messages_one(object: {conversation_id: \$conversation_id, sender_id: \$sender_id, text_content: {data: {text: \$text}}, message_statuses: {data: {status: UNREAD}}, is_deleted: false, files: {data: {file_url: \$file_url, size: \$size, file_type: {data: {mime_type: \$mime_type, type: \$type}}, height: \$height, width: \$width, length: \$length}}}) {
//       id
//     }
//     update_conversations_by_pk(pk_columns: {id: \$conversation_id}, _set: {updated_at: now}){
//       id
//     }
//   }
// ''';


// // String createGroup = '''
// //   mutation CreateGroup(
// //     \$title: String!,
// //     \$creator_id: String!,
// //     \$members: [user_conversations_insert_input!]!
// //   ) {
// //     insert_conversations_one(
// //       object: {
// //         is_group: true,
// //         title: \$title,
// //         creator_id: \$creator_id,
// //         user_conversations: {data: \$members}
// //       }
// //     ) {
// //       id
// //       created_at
// //       creator_id
// //       title
// //       updated_at
// //       user_conversations_aggregate {
// //         aggregate {
// //           count
// //         }
// //       }
// //     }
// //   }
// // ''';
// String createGroup= """mutation CreateGroup(\$title: String!, \$creator_id: String!, \$members: [user_conversations_insert_input!]!) {
//   insert_conversations_one(object: {user_conversations: {data: \$members}, title: \$title, creator_id: \$creator_id, is_group: true}) {
//     id
//     created_at
//     creator_id
//     title
//     updated_at
//     user_conversations_aggregate {
//       aggregate {
//         count
//       }
//    }
//   }
// }""";