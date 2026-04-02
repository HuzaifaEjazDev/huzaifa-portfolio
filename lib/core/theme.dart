import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color background = Color(0xFF050816);
  static const Color primary = Color(0xFF02569B);
  static const Color secondary = Color(0xFF22D3EE);
  static const Color accent = Color(0xFF7C3AED);
  static const Color cardBg = Color(0x1AFFFFFF); // 10% white
  static const Color glassBorder = Color(0x26FFFFFF); // 15% white
  static const Color textMain = Colors.white;
  static const Color textDim = Color(0xB3FFFFFF); // 70% white
  static const Color textDark = Colors.black;
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      primaryColor: AppColors.primary,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        surface: AppColors.background,
      ),
      textTheme: GoogleFonts.outfitTextTheme().apply(
        bodyColor: AppColors.textMain,
        displayColor: AppColors.textMain,
      ),
      useMaterial3: true,
    );
  }
}
