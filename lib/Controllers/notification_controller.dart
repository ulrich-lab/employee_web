import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:visitor_pass/domain/notification_repository.dart';
import 'package:visitor_pass/notificatons/notifications_helper.dart';

// @lazySingleton
// class NotificationController extends GetxController {
//   final NotificationRepository notificationRepository;
//   NotificationController(this.notificationRepository);

  // @override
  // void onInit() {
  //   notificationRepository.listenToAllNotifications().listen(
  //     (data) {
  //       NotificationControllerService.createNewNotification(
  //           data.title, data.body);
  //     },
  //     onError: (error) {},
  //     onDone: () {},
  //   );
  //   super.onInit();
  // }

//   initNotif(){
//     notificationRepository.listenToAllNotifications().listen(
//       (data) {
//         NotificationControllerService.createNewNotification(
//             data.title, data.body);
//       },
//       onError: (error) {},
//       onDone: () {},
//     );
//   }
// }
