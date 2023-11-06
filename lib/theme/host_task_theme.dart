import 'package:flutter/material.dart';

class HostTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
    );
  }
}

class LightPalette {
  static const Color primaryPurple = Color(0xFF9a83ef);
  static const Color white = Color(0xffffffff);
  static const Color black = Color(0xff000000);
  static const Color lightGrey = Color(0xfff5f7fa); // Background for cards
  static const Color greyBorder = Color(0xffedeff2); // Border for (some) cards
  static const Color grey = Color(0xff9FA6B1);
  static const Color darkGrey = Color(0xff6D7789);
  static const Color smokeGrey = Color(0xffc7ccd5);
  static const Color green = Color(0xff27AE60);
  static const Color brightGreen = Color(0xffEEF9F2);
  static const Color purpleBlue = Color(0xff3733D6);
  static const Color darkBlue = Color(0xff0E2957);
  static const Color red = Color(0xffDB524E);
  static const Color brightRed = Color(0xffFCF1F1);
}

const lightColorScheme = ColorScheme.light(
  primary: LightPalette.primaryPurple,
  onPrimary: LightPalette.white,
  primaryContainer: LightPalette.primaryPurple,
  onPrimaryContainer: LightPalette.white,
  secondary: LightPalette.black,
  onSecondary: LightPalette.white,
  // secondaryContainer: Color(0xFFE3E0F9),
  onSecondaryContainer: LightPalette.darkGrey,
  tertiary: LightPalette.purpleBlue,
  onTertiary: null,
);
