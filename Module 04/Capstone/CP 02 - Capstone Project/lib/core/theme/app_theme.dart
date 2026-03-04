import 'package:flutter/material.dart';

/// Amazon-style theme: dark header #131921, orange accent #FF9900.
abstract class AppTheme {
  static const Color amazonDark = Color(0xFF131921);
  static const Color amazonOrange = Color(0xFFFF9900);
  static const Color amazonOrangeDark = Color(0xFFE88B00);
  static const Color amazonLightBg = Color(0xFFEAEDED);
  static const Color amazonFooterBg = Color(0xFF232F3E);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: amazonOrange,
        primary: amazonOrange,
        surface: Colors.white,
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: amazonLightBg,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: amazonDark,
        foregroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: amazonOrange,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
      ),
    );
  }
}
