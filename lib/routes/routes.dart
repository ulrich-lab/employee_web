import 'package:get/get.dart';
import 'package:visitor_pass/views/pages/chat/chat.dart';
import 'package:visitor_pass/views/pages/dashboard/employee_dashboard_page.dart';
import 'package:visitor_pass/views/pages/drawer_view_page.dart';
import 'package:visitor_pass/views/pages/profile.dart';
import 'package:visitor_pass/views/pages/visitor/visitor.dart';
import 'package:visitor_pass/views/widget/bottom_nav.dart';

import '../SplashScreen/splash_screen.dart';
import '../views/pages/attendance/attendance_page.dart';
import '../views/pages/login.dart';

abstract class Routes {
  static final pages = [
    GetPage(name: "/", page: () => SplashScreen()),
    // GetPage(name: "/", page: () => OnboardingView()),
    GetPage(name: "/login", page: () => LoginPage()),
    GetPage(name: "/BottomNav", page: () => SideBar()),
    GetPage(name: "/AdminDashboardPage", page: () => EmployeeDashboardPage()),
    GetPage(name: "/visitor", page: () => VisitorListPage()),
    // GetPage(name: "/pre-register", page: () => PreRegisterListPage()),
    // GetPage(name: "/attendance", page: () => AttendancePage()),
    GetPage(name: "/profile", page: () => ProfilePage()),
    // GetPage(
    //     name: "/pre-visitor-details", page: () => PreRegisterVisitorDetails()),
    // GetPage(name: "/pre-register-edit", page: () => PreRegisterEditPage()),
    // GetPage(name: "/pre-register-add", page: () => PreRegisterAddPage()),
    /////////////
    // GetPage(name: "/chat", page: () => RealtimeChatScreen()),
    // GetPage(name: "/contact", page: () => RealtimeConversationsScreen()),
    // GetPage(name: "/call", page: () => CallScreen()),

    // GetPage(name: "/chat-page", page: () => ChatPage()),
    // GetPage(name: "/call", page: () => CallScreen()),
  ];
}
