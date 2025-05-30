import 'package:flutter/widgets.dart';

class SizeConfigData {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? block;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    block = screenWidth! / 100;
    orientation = _mediaQueryData!.orientation;
  }
}
