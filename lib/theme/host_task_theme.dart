import 'package:flutter/material.dart';

class HostTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9a83ef)),
      useMaterial3: true,
    );
  }
}
