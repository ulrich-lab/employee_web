import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/theme/color_theme.dart';
import 'package:visitor_pass/theme/text_theme.dart';


// Contrôleur pour le thème
class ThemeController extends GetxController {
  final RxBool isDarkTheme = false.obs;

  ThemeData get currentTheme => isDarkTheme.value ? _darkTheme : _lightTheme;

  void toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    Get.changeTheme(isDarkTheme.value ? _darkTheme : _lightTheme);
  }
}

// Classe CustomThemeData pour contenir le thème personnalisé
class CustomThemeData {
  final textTheme = CustomTextTheme();
  late final ColorTheme colorTheme;

  CustomThemeData({required bool isDarkTheme}) {
    colorTheme = isDarkTheme
        ? ColorTheme(
            iconColor: AppColorsDark.iconColor,
            textColor1: AppColorsDark.textColor1,
            textColor2: AppColorsDark.textColor2,
            appBarColor: AppColorsDark.appBarColor,
            dividerColor: AppColorsDark.dividerColor,
            backgroundColor: AppColorsDark.backgroundColor,
            errorSnackBarColor: AppColorsDark.errorSnackBarColor,
            incomingMessageBubbleColor:
                AppColorsDark.incomingMessageBubbleColor,
            outgoingMessageBubbleColor:
                AppColorsDark.outgoingMessageBubbleColor,
            incomingEmbedColor: AppColorsDark.incomingEmbedColor,
            outgoingEmbedColor: AppColorsDark.outgoingEmbedColor,
            selectedLabelColor: AppColorsDark.selectedLabelColor,
            unselectedLabelColor: AppColorsDark.unselectedLabelColor,
            indicatorColor: AppColorsDark.indicatorColor,
            blueColor: AppColorsDark.blueColor,
            greenColor: AppColorsDark.greenColor,
            yellowColor: AppColorsDark.yellowColor,
            greyColor: AppColorsDark.greyColor,
            statusBarColor: AppColorsDark.statusBarColor,
            navigationBarColor: AppColorsDark.navigationBarColor,
          )
        : ColorTheme(
            iconColor: AppColorsLight.iconColor,
            textColor1: AppColorsLight.textColor1,
            textColor2: AppColorsLight.textColor2,
            appBarColor: AppColorsLight.appBarColor,
            dividerColor: AppColorsLight.dividerColor,
            backgroundColor: AppColorsLight.backgroundColor,
            errorSnackBarColor: AppColorsLight.errorSnackBarColor,
            incomingMessageBubbleColor:
                AppColorsLight.incomingMessageBubbleColor,
            outgoingMessageBubbleColor:
                AppColorsLight.outgoingMessageBubbleColor,
            incomingEmbedColor: AppColorsLight.incomingEmbedColor,
            outgoingEmbedColor: AppColorsLight.outgoingEmbedColor,
            selectedLabelColor: AppColorsLight.selectedLabelColor,
            unselectedLabelColor: AppColorsLight.unselectedLabelColor,
            indicatorColor: AppColorsLight.indicatorColor,
            blueColor: AppColorsLight.blueColor,
            greenColor: AppColorsLight.greenColor,
            yellowColor: AppColorsLight.yellowColor,
            greyColor: AppColorsLight.greyColor,
            statusBarColor: AppColorsLight.statusBarColor,
            navigationBarColor: AppColorsLight.navigationBarColor,
          );
  }
}

// Thèmes personnalisés pour les modes clair et sombre
final _customTheme = CustomThemeData(isDarkTheme: false);
final _lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColorsLight.backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorsLight.appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColorsLight.appBarColor,
    ),
  ),
  iconTheme: IconThemeData(color: AppColorsLight.iconColor),
);

final _customDarkTheme = CustomThemeData(isDarkTheme: true);
final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColorsDark.backgroundColor,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColorsDark.appBarColor,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: AppColorsDark.appBarColor,
    ),
  ),
  iconTheme: IconThemeData(color: AppColorsDark.iconColor),
);

// Extension pour utiliser le thème personnalisé
extension CustomTheme on ThemeData {
  CustomThemeData get custom =>
      brightness == Brightness.dark ? _customDarkTheme : _customTheme;

       AssetImage themedImage(String name) {
    final path =
        brightness == Brightness.dark ? 'assets/images/dark' : 'assets/images';
    return AssetImage('$path/$name');
  }
}