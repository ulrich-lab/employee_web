import 'package:visitor_pass/Models/notification_model.dart';

abstract class NotificationRepository {
  Stream<NotificationModel> listenToAllNotifications();
}
