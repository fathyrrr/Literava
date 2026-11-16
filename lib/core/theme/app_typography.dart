import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  // Headlines: EB Garamond (Editorial serif with tight leading)
  static TextStyle displayLarge = GoogleFonts.ebGaramond(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.15,
    letterSpacing: -0.5,
  );

  static TextStyle displayMedium = GoogleFonts.ebGaramond(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.2,
    letterSpacing: -0.3,
  );

  static TextStyle headlineLarge = GoogleFonts.ebGaramond(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.2,
  );

  static TextStyle headlineMedium = GoogleFonts.ebGaramond(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.25,
  );

  static TextStyle headlineSmall = GoogleFonts.ebGaramond(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.onSurface,
    height: 1.3,
  );

  static TextStyle quote = GoogleFonts.ebGaramond(
    fontSize: 17,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w500,
    color: AppColors.onSurface,
    height: 1.4,
  );

  // Body: Manrope (Geometric, clean modern sans-serif)
  static TextStyle bodyLarge = GoogleFonts.manrope(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurface,
    height: 1.5,
  );

  static TextStyle bodyMedium = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurfaceVariant,
    height: 1.45,
  );

  static TextStyle bodySmall = GoogleFonts.manrope(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.onSurfaceVariant,
    height: 1.4,
  );

  // Labels & Chips: Manrope
  static TextStyle labelLarge = GoogleFonts.manrope(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
    color: AppColors.onSurface,
  );

  static TextStyle labelMedium = GoogleFonts.manrope(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColors.onSurfaceVariant,
  );

  static TextStyle labelSmall = GoogleFonts.manrope(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.8,
    color: AppColors.secondary,
  );

  // Vintage Mono tag (Ticket number, call number)
  static TextStyle monoTag = GoogleFonts.jetBrainsMono(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: AppColors.primary,
  );
}
