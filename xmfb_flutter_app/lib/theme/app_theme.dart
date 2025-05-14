import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Color Definitions
  static const Color basePrimary = Color(0xFF3E64FF);
  static const Color baseSecondary = Color(0xFF5EDFFF);
  static const Color baseAccent = Color(0xFFFF9F1C);

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [basePrimary, Color(0xFF304FFE)],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [baseSecondary, Color(0xFF00B8D4)],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [baseAccent, Color(0xFFF57C00)],
  );

  static final Map<String, UserTheme> userThemes = {
    'default': UserTheme(
      primary: basePrimary,
      gradient: primaryGradient,
      lightBackground: const Color(0xFFF5F7FF),
      darkBackground: const Color(0xFF121A2F),
    ),
    'green': UserTheme(
      primary: const Color(0xFF4CAF50),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF4CAF50), Color(0xFF2E7D32)],
      ),
      lightBackground: const Color(0xFFEDF7ED),
      darkBackground: const Color(0xFF0D2412),
    ),
    'blue': UserTheme(
      primary: const Color(0xFF2196F3),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFF2196F3), Color(0xFF0D47A1)],
      ),
      lightBackground: const Color(0xFFE5F2FF),
      darkBackground: const Color(0xFF0A1929),
    ),
    'red': UserTheme(
      primary: const Color(0xFFF44336),
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFF44336), Color(0xFFC62828)],
      ),
      lightBackground: const Color(0xFFFEEAEA),
      darkBackground: const Color(0xFF2D1212),
    ),
  };

  static TextTheme getTextTheme(Brightness brightness) {
    final base = brightness == Brightness.light
        ? ThemeData.light().textTheme
        : ThemeData.dark().textTheme;

    TextStyle use(TextStyle? style, TextStyle Function(TextStyle) wrap) =>
        wrap(style ?? const TextStyle());

    return TextTheme(
      displayLarge: use(base.displayLarge, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w700)),
      displayMedium: use(base.displayMedium, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w600)),
      displaySmall: use(base.displaySmall, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w600)),
      headlineLarge: use(base.headlineLarge, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w600)),
      headlineMedium: use(base.headlineMedium, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w600)),
      headlineSmall: use(base.headlineSmall, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w600)),
      titleLarge: use(base.titleLarge, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w600, fontSize: 20)),
      titleMedium: use(base.titleMedium, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w500)),
      titleSmall: use(base.titleSmall, (b) => GoogleFonts.montserrat(textStyle: b, fontWeight: FontWeight.w500)),
      bodyLarge: use(base.bodyLarge, (b) => GoogleFonts.outfit(textStyle: b, fontWeight: FontWeight.w400)),
      bodyMedium: use(base.bodyMedium, (b) => GoogleFonts.outfit(textStyle: b, fontWeight: FontWeight.w400)),
      bodySmall: use(base.bodySmall, (b) => GoogleFonts.outfit(textStyle: b, fontWeight: FontWeight.w400)),
      labelLarge: use(base.labelLarge, (b) => GoogleFonts.outfit(textStyle: b, fontWeight: FontWeight.w600)),
      labelMedium: use(base.labelMedium, (b) => GoogleFonts.outfit(textStyle: b, fontWeight: FontWeight.w500)),
      labelSmall: use(base.labelSmall, (b) => GoogleFonts.outfit(textStyle: b, fontWeight: FontWeight.w500, letterSpacing: 0.5)),
    );
  }
}

class UserTheme {
  final Color primary;
  final LinearGradient gradient;
  final Color lightBackground;
  final Color darkBackground;

  UserTheme({
    required this.primary,
    required this.gradient,
    required this.lightBackground,
    required this.darkBackground,
  });
}
