import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/main.dart';
import 'package:visitor_pass/views/pages/dashboard/employee_dashboard_page.dart';
import 'package:visitor_pass/views/pages/drawer_view_page.dart';
import 'package:visitor_pass/views/pages/onbording/omboarding_screen.dart';
import 'package:visitor_pass/views/pages/onbording/user_type.dart';
import 'package:visitor_pass/views/pages/profile.dart';
import 'package:visitor_pass/views/pages/visitor/visitor.dart';
import 'package:visitor_pass/views/widget/bottom_nav.dart';

import '../SplashScreen/splash_screen.dart';
import '../views/pages/login.dart';

// abstract class Routes {
//   static final pages = [
//     GetPage(name: "/", page: () => SplashScreen()),
//     // GetPage(name: "/", page: () => OnboardingView()),
//     GetPage(name: "/login", page: () => LoginPage()),
//     GetPage(name: "/BottomNav", page: () => SideBar()),
//     GetPage(name: "/AdminDashboardPage", page: () => EmployeeDashboardPage()),
//     GetPage(name: "/visitor", page: () => VisitorListPage()),
//     GetPage(name: "/profile", page: () => ProfilePage()),

//     GetPage(name: "/SideBar", page: () => SideBar()),
//     GetPage(name: "/BottomNav", page: () => BottomNav()),
//     GetPage(name: "/UserType", page: () => UserType()),
//     GetPage(name: "/OnboardingView", page: () => OnboardingView()),

//   ];
// }


abstract class Routes {
  static final pages = [
    GetPage(name: "/", page: () => SplashScreen()),

    GetPage(name: "/login", page: () => LoginPage()),

    // 🔒 Routes protégées par middleware
    GetPage(
      name: "/BottomNav",
      page: () => BottomNav(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: "/SideBar",
      page: () => SideBar(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: "/AdminDashboardPage",
      page: () => EmployeeDashboardPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: "/visitor",
      page: () => VisitorListPage(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: "/profile",
      page: () => ProfilePage(),
      middlewares: [AuthMiddleware()],
    ),

    // Routes publiques
    GetPage(name: "/UserType", page: () => UserType()),
    GetPage(name: "/OnboardingView", page: () => OnboardingView()),
  ];
}

class AuthMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    final userId = prefs.getString("user-id");
    if (userId == null) {
      return const RouteSettings(name: "/");
    }
    return null; // accès autorisé
  }
}
