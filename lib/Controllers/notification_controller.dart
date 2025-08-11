import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/domain/notification_repository.dart';
import 'package:visitor_pass/notifications/notification_adapter.dart';

@lazySingleton
class NotificationController extends GetxController {
  final NotificationRepository notificationRepository;
  NotificationController(this.notificationRepository);

  @override
  void onInit() {
    notificationAdapter.initialize();
    notificationRepository.listenToAllNotifications().listen(
      (data) {
        notificationAdapter.showNotification(data.title, data.body);
      },
      onError: (error) {},
      onDone: () {},
    );
    super.onInit();
  }

  initNotif(){
    notificationRepository.listenToAllNotifications().listen(
      (data) {
        notificationAdapter.showNotification(data.title, data.body);
      },
      onError: (error) {},
      onDone: () {},
    );
  }
}
