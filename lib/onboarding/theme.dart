import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF0066FF);
  static const Color darkBg = Color(0xFF0A0A0A);
  static const Color glassWhite = Color(0x26FFFFFF); // 0.15 opacity
  static const Color glassBorder = Color(0x40FFFFFF); // 0.25 opacity

  static BoxDecoration glassDecoration({double borderRadius = 24}) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Colors.white.withOpacity(0.15),
          Colors.white.withOpacity(0.05),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      border: Border.all(color: Colors.white.withOpacity(0.2)),
      borderRadius: BorderRadius.circular(borderRadius),
    );
  }

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBg,
    primaryColor: primaryBlue,
    colorScheme: ColorScheme.dark(
      primary: primaryBlue,
      secondary: primaryBlue.withOpacity(0.8),
      surface: Colors.white.withOpacity(0.05),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: -1,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontSize: 16,
      ),
    ),
  );
}
