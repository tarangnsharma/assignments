import 'package:flutter/material.dart';

/// Theme for the cake-ordering capstone app.
/// Primary: fuchsia/pink (#E91E63) to match design assets.
abstract class AppTheme {
  static const Color primaryPink = Color(0xFFE91E63);
  static const Color primaryPinkDark = Color(0xFFC2185B);
  static const Color progressGreen = Color(0xFF4CAF50);
  static const Color drawerOrdersYellow = Color(0xFFFFC107);

  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryPink,
        primary: primaryPink,
        surface: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: primaryPink,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}
