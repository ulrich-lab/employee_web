import 'dart:html' as html;
import 'notification_adapter.dart';

class WebNotificationAdapter implements INotificationAdapter {
  @override
  Future<void> initialize() async {
    if (html.Notification.supported) {
      if (html.Notification.permission != 'granted') {
        await html.Notification.requestPermission();
      }
    }
  }

  @override
  Future<void> showNotification(String title, String body) async {
    if (html.Notification.permission == 'granted') {
      html.Notification(title, body: body);
    }
  }
} 