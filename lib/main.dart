import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:visitor_pass/SplashScreen/splash_screen.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visitor_pass/firebase_options.dart';
import 'package:visitor_pass/routes/routes.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/theme/theme.dart';
import 'Controllers/global-controller.dart';
import '../../language/language.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'Models/message.dart';
import 'Models/attachement.dart';
import 'Models/recent_chat.dart';
import 'Models/user.dart';
import 'Models/contact.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'notifications/notification_adapter.dart';
import 'notifications/mobile_notification_adapter.dart';
import 'notifications/web_notification_adapter.dart';
import 'Models/stored_message.dart';

late SharedPreferences prefs;


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // try {
  //   await GetStorage.init();
  // } catch (e) {
  //   debugPrint("Erreur GetStorage : $e");
  // }
  prefs = await SharedPreferences.getInstance();

  // Initialisation Hive
  await Hive.initFlutter();
  Hive.registerAdapter(MessageStatusAdapter());
  Hive.registerAdapter(MessageAdapter());
  Hive.registerAdapter(AttachmentTypeAdapter());
  Hive.registerAdapter(UploadStatusAdapter());
  Hive.registerAdapter(AttachmentAdapter());
  Hive.registerAdapter(GroupAdapter());
  Hive.registerAdapter(RecentChatAdapter());
  Hive.registerAdapter(UserActivityStatusAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(PhoneAdapter());
  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(StoredMessageAdapter());

  // Ouverture des boîtes (exemples)
  await Hive.openBox<Message>('messages');
  await Hive.openBox<RecentChat>('recentChats');
  await Hive.openBox<Contact>('contacts');
  await Hive.openBox<User>('users');
  await Hive.openBox<StoredMessage>('storedMessages');

  configureDependencies();

  // Initialisation de l'adapter de notification
  if (kIsWeb) {
    notificationAdapter = WebNotificationAdapter();
  } else {
    notificationAdapter = MobileNotificationAdapter();
  }
  await notificationAdapter.initialize();

  try {
    await initializeDateFormatting();
  } catch (e) {
    debugPrint("Erreur Intl Date Formatting : $e");
  }

  runApp(MyApp(langValue: const Locale('fr', 'FR')));
}

const double kMargin = 16.0;
const double kPageContentWidth = 600;
const double kIconSize = 22.0;

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  final dynamic langValue;
  MyApp({Key? key, this.langValue}) : super(key: key);

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    Get.put(GlobalController()).onInit();

    return ScreenUtilInit(
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'VVIMS',
        translations: Languages(),
        locale: widget.langValue,
        theme: themeController.currentTheme,
        initialRoute: "/",
        getPages: Routes.pages,
        unknownRoute: GetPage(
          name: '/',
          page: () => SplashScreen(),
        ),
      ),
    );
  }
}

// class NotificationDataModel {
//   String? type;
//   NotificationDataModel({required this.type});

//   NotificationDataModel.fromJson(Map data) {
//     NotificationDataModel(type: data["data"]);
//   }
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
