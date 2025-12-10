import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: const Color(0xFF0B8FDC),
        secondary: const Color(0xFF6C63FF),
        background: const Color(0xFFF6F8FB),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(base.textTheme),
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
