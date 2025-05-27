import 'package:flutter/cupertino.dart';

import 'package:get_storage/get_storage.dart';
import 'package:table_calendar/table_calendar.dart';

final box = GetStorage();

class AppColor {
  static const Color primaryColor = Color(0xff386BF6);
  static const Color orangeColor = Color(0xffFF8269);
  static const Color greenColor = Color(0xff52BD70);
  static const Color greenBtn = Color(0xff58C801);
  static const Color borderColor = Color(0xffE3EBFF);
  static const Color violetColor = Color(0xff8157C6);
  static const Color hintColor = Color(0xff959CB1);
  static const Color dividerColor = Color(0xffD2D9E0);
  static const Color nameColor = Color(0xff0A183F);
  static const Color redColor = Color(0xffF96868);
  static const Color imagebackground = Color(0xffEEF3FF);
  static const Color titleColor = Color(0xff0A183F);
  static Color greyBck = const Color(0xffF7F7F7);
  static const Color greenC = Color(0xff2EE401);
  static const Color bgCheckColor = Color(0xffE4ECFF);
  static const Color white = Color(0xffFFFFFF);
  static const Color backgroundCalendar = Color(0xffE5E9F4);
  static const Color orangeBackground = Color(0xffFEE1E1);
  static const Color textPrimaryColor = Color(0xDE000000);

  static const Color surfaceLightColor = Color(0xFFFFFFFF);
  static const Color surfaceDarkColor = Color(0xFF121212);

  static const Color textSecondaryColor = Color(0x99000000);
  static const Color textDisabledColor = Color(0x66000000);

  static const Color textPrimaryDarkColor = Color(0xffFFFFFF);
  static const Color textSecondaryDarkColor = Color(0xB3FFFFFF);
  static const Color textDisabledDarkColor = Color(0x80FFFFFF);

  static  CalendarStyle calendarStyle = CalendarStyle(
    outsideDaysVisible: false,
    defaultTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Color(0xDE000000),
    ),
    weekendTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0x99000000),
    ),
    selectedDecoration: BoxDecoration(
      color: Color(0xff5966EA),
      shape: BoxShape.circle,
    ),
    markerDecoration: BoxDecoration(
      color: Color(0xffFAC05E),
      shape: BoxShape.circle,
    ),
    todayDecoration: BoxDecoration(
      border:  Border.all(color: Color(0xff5966EA)),
      shape: BoxShape.circle,
    ),
    todayTextStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: Color(0x99000000),
    ),
  );

  static const DaysOfWeekStyle daysOfWeekStyle = DaysOfWeekStyle(
    weekdayStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0xDE000000),
    ),
    weekendStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: Color(0x66000000),
    ),
  );
}

const kPrimaryColor = Color(0xFF386BF6);
const kSecondaryColor = Color(0xFF16DBCC);
const kContentColorLightTheme = Color(0xFF1D1D35);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kErrorColor = Color(0xFFF03738);
const kWhiteColor = Color(0xFFFFFFFF);
const kBlackColor = Color(0xFF000000);
const kBackColor = Color(0xFFF7F7F7);

const kDefaultPadding = 20.0;
const kBottomNavigationBarHeight = kDefaultPadding * 2.8;

const kDefaultDuration = Duration(milliseconds: 250);

class Images {
  static String get logoBlue => 'assets/new/blue.png';
  static String get logoIcon => 'assets/images/icon.png';
  static String get logoIconWew => 'assets/new/icon.png';
  static String get bio => 'assets/images/bio.png';
  static String get prerigester_icon => 'assets/images/prerigester_icon.png';
  static String get preregisterfemal => 'assets/images/preregisterfemal.png';

  static String get home => 'assets/icons/home.svg';
  static String get homeActive => 'assets/icons/home_active.svg';
  static String get card => 'assets/icons/card.svg';
  static String get cardActive => 'assets/icons/card_active.svg';
  static String get document => 'assets/icons/document.svg';
  static String get documentActive => 'assets/icons/document_active.svg';
  static String get menu => 'assets/icons/menu.svg';
  static String get menuActive => 'assets/icons/menu_active.svg';
  static String get user => 'assets/icons/user.svg';
  static String get userActive => 'assets/icons/user_active.svg';
  static String get menuCard => 'assets/icons/menu_card.svg';
  static String get menuSms => 'assets/icons/menu_sms.svg';
  static String get menuCall => 'assets/icons/menu_call.svg';
  static String get menuLocation => 'assets/icons/menu_location.svg';
  static String get menuKey => 'assets/icons/menu_key.svg';
  static String get menuEdit => 'assets/icons/menu_edit.svg';
  static String get menuLogout => 'assets/icons/menu_logout.svg';
  static String get right => 'assets/icons/right.svg';
  static String get gallery => 'assets/icons/gallery.svg';
  static String get backArrow => 'assets/icons/back.svg';
  static String get search => 'assets/icons/search.svg';
  static String get delete => 'assets/icons/delete.svg';
  static String get login => 'assets/icons/login.svg';
  static String get logo => 'assets/icons/logo.svg';
  static String get people => 'assets/icons/people.svg';
  static String get people2 => 'assets/icons/people_2.svg';
  static String get profile => 'assets/icons/profile.svg';
  static String get locationTick => 'assets/icons/location_tick.svg';

  static String get name => 'assets/icons/name.svg';
  static String get email => 'assets/icons/email.svg';
  static String get phone => 'assets/icons/phone.svg';
  static String get gender => 'assets/icons/gender.svg';
  static String get company => 'assets/icons/company.svg';
  static String get address => 'assets/icons/address.svg';
  static String get employee => 'assets/icons/employee.svg';
  static String get purpose => 'assets/icons/purpose.svg';
  static String get status => 'assets/icons/status.svg';
  static String get date => 'assets/icons/date.svg';
  static String get clock => 'assets/icons/clock.svg';
  static String get down => 'assets/icons/down.svg';

  static String get Nhome => 'assets/new/home.svg';
  static String get Nschedule => 'assets/new/schedule.svg';
  static String get Nvisitors => 'assets/new/visitors.svg';
  static String get Ncollegue => 'assets/new/collegue.svg';
  static String get Nprofile => 'assets/new/profile.svg';
  static String get Nappointment => 'assets/icons/appointment.svg';
}

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context);
  double get mainHeight => MediaQuery.of(context).size.height;
  double get mainWidth => MediaQuery.of(context).size.width;
  double get block => mainWidth / 100;
}
