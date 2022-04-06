import 'package:flutter/material.dart';
import 'extension.dart';

class MyColors {
  static Color appColor = hexToColor("#E87722");
  // static Color startGradientColor = hexToColor("#1CA941");
  // static Color endGradientColor = hexToColor("#1CA941");
  // static LinearGradient appBarGradient =
  //     LinearGradient(begin: Alignment.centerLeft, stops: [
  //   0.4,
  //   0.9
  // ], colors: [
  //   MyColors.startGradientColor,
  //   MyColors.endGradientColor,
  // ]);
  static Color primaryColor = hexToColor("#00C1EC");
  static Color secondaryColor = hexToColor("#00D0A7");
  static Color greenColor = hexToColor("#328D2E");
  static Color orangeColor = hexToColor("#E87722");
  static Color whiteGreyColor1 = hexToColor("#e6e7e8");
  static Color whiteGreyColor2 = hexToColor("#eeedf2");
  static MaterialColor appTheme = MaterialColor(
    0xfff7892b,
    <int, Color>{
      50: appColor,
      100: appColor,
      200: appColor,
      300: appColor,
      400: appColor,
      500: appColor,
      600: appColor,
      700: appColor,
      800: appColor,
      900: appColor,
    },
  );
}
