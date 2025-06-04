import 'dart:async';
// import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:visitor_pass/Services/date_time_service.dart';
import 'package:visitor_pass/config/locator/locator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visitor_pass/notificatons/notifications_helper.dart';
import 'package:visitor_pass/routes/routes.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:visitor_pass/theme/theme.dart';
import 'Controllers/global-controller.dart';
import 'package:get_storage/get_storage.dart';
import '../../language/language.dart';
import 'constants/constants.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();

  await DateTimeService.instance.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  configureDependencies();
  // dynamic langValue = const Locale('en', 'US');
  // if (box.read('lang') != null) {
  //   langValue = Locale(box.read('lang'), box.read('langKey'));
  // } else {
  //   langValue = const Locale('en', 'US');
  // }

  dynamic langValue = const Locale('fr', 'FR');

  // HttpOverrides.global = MyHttpOverrides();

  await NotificationControllerService.initializeLocalNotifications();
  // await NotificationControllerService.initializeIsolateReceivePort();
  setPathUrlStrategy();
  await initializeDateFormatting()
      .then((_) => runApp(MyApp(langValue: langValue)));
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
      ),
    );
  }
}

class NotificationDataModel {
  String? type;
  NotificationDataModel({required this.type});

  NotificationDataModel.fromJson(Map data) {
    NotificationDataModel(type: data["data"]);
  }
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
