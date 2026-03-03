import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static final _baseTextTheme = GoogleFonts.interTextTheme();

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightBg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.emerald,
      brightness: Brightness.light,
      surface: AppColors.lightSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightSurface,
      foregroundColor: AppColors.lightText,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.lightText,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.lightCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textTheme: _baseTextTheme.copyWith(
      headlineLarge: _baseTextTheme.headlineLarge?.copyWith(
        color: AppColors.lightText,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: _baseTextTheme.bodyLarge?.copyWith(color: AppColors.lightText),
      bodyMedium: _baseTextTheme.bodyMedium?.copyWith(
        color: AppColors.lightSubtext,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.emerald),
  );

  // ── Dark Theme ──
  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkBg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.emerald,
      brightness: Brightness.dark,
      surface: AppColors.darkSurface,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkSurface,
      foregroundColor: AppColors.darkText,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.darkText,
      ),
    ),
    cardTheme: CardThemeData(
      color: AppColors.darkCard,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    textTheme: _baseTextTheme.copyWith(
      headlineLarge: _baseTextTheme.headlineLarge?.copyWith(
        color: AppColors.darkText,
        fontWeight: FontWeight.w800,
      ),
      bodyLarge: _baseTextTheme.bodyLarge?.copyWith(color: AppColors.darkText),
      bodyMedium: _baseTextTheme.bodyMedium?.copyWith(
        color: AppColors.darkSubtext,
      ),
    ),
    iconTheme: const IconThemeData(color: AppColors.emeraldLight),
  );
}
