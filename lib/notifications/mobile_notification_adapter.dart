import 'package:awesome_notifications/awesome_notifications.dart';
import 'notification_adapter.dart';

class MobileNotificationAdapter implements INotificationAdapter {
  @override
  Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      null,
      [NotificationChannel(
        channelKey: 'alerts',
        channelName: 'Alerts',
        channelDescription: 'Notification tests as alerts',
        importance: NotificationImportance.High,
      )],
      debug: true,
    );
  }

  @override
  Future<void> showNotification(String title, String body) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: -1,
        channelKey: 'alerts',
        title: title,
        body: body,
      ),
    );
  }
} 