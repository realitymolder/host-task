import 'package:flutter/material.dart';

class HostTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );
  }
}
