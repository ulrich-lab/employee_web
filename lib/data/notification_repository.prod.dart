import 'package:injectable/injectable.dart';
import 'package:visitor_pass/Models/notification_model.dart';
import 'package:visitor_pass/config/graphql/documents/notifications.graphql.dart';
import 'package:visitor_pass/core/datasources/graphql_datasource.dart';
import 'package:visitor_pass/domain/notification_repository.dart';
import 'package:visitor_pass/main.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final GraphqlDatasource graphQLDatasource;

  NotificationRepositoryImpl(
    this.graphQLDatasource,
  );

  @override
  Stream<NotificationModel> listenToAllNotifications() {
    Stream<NotificationModel> notification = graphQLDatasource
        .subscribe(
      Options$Subscription$ListenAllNotifications(
        variables: Variables$Subscription$ListenAllNotifications(
          employee_id: prefs.getString("user-id")??"",
        ),
      ),
    )
        .map(
      (event) {
        return NotificationModel(
          id: event.employee_notifications_stream.last.id,
          title: event.employee_notifications_stream.last.title,
          body: event.employee_notifications_stream.last.message,
        );
      },
    );
    return notification;
  }
}
