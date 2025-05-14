import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color schemes
const Color primaryColor = Color(0xFF3E64FF);
const Color secondaryColor = Color(0xFF5EDFFF);
const Color accentColor = Color(0xFFFF9F1C);

// Light theme colors
final ColorScheme lightColorScheme = ColorScheme.light(
  primary: primaryColor,
  secondary: secondaryColor,
  tertiary: accentColor,
  onPrimary: Colors.white,
  onSecondary: Colors.black87,
  onTertiary: Colors.black,
  background: Colors.grey.shade50,
  surface: Colors.grey.shade100,
  onBackground: Colors.black87,
  onSurface: Colors.black87,
);

// Dark theme colors
final ColorScheme darkColorScheme = ColorScheme.dark(
  primary: primaryColor,
  secondary: secondaryColor.withOpacity(0.8),
  tertiary: accentColor,
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onTertiary: Colors.black,
  background: const Color(0xFF121212),
  surface: const Color(0xFF1E1E1E),
  onBackground: Colors.white,
  onSurface: Colors.white,
);

// Text themes
TextTheme _createTextTheme(TextTheme base) {
  return base.copyWith(
    displayLarge: GoogleFonts.poppins(
      textStyle: base.displayLarge,
      fontWeight: FontWeight.w700,
    ),
    displayMedium: GoogleFonts.poppins(
      textStyle: base.displayMedium,
      fontWeight: FontWeight.w600, 
    ),
    displaySmall: GoogleFonts.poppins(
      textStyle: base.displaySmall,
      fontWeight: FontWeight.w600,
    ),
    headlineLarge: GoogleFonts.poppins(
      textStyle: base.headlineLarge,
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: GoogleFonts.poppins(
      textStyle: base.headlineMedium,
      fontWeight: FontWeight.w600,
    ),
    headlineSmall: GoogleFonts.poppins(
      textStyle: base.headlineSmall,
      fontWeight: FontWeight.w600,
    ),
    titleLarge: GoogleFonts.poppins(
      textStyle: base.titleLarge,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: base.titleMedium,
      fontWeight: FontWeight.w500,
    ),
    titleSmall: GoogleFonts.poppins(
      textStyle: base.titleSmall,
      fontWeight: FontWeight.w500,
    ),
    bodyLarge: GoogleFonts.inter(
      textStyle: base.bodyLarge,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: GoogleFonts.inter(
      textStyle: base.bodyMedium,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: GoogleFonts.inter(
      textStyle: base.bodySmall,
      fontWeight: FontWeight.w400,
    ),
    labelLarge: GoogleFonts.inter(
      textStyle: base.labelLarge,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: GoogleFonts.inter(
      textStyle: base.labelMedium,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: GoogleFonts.inter(
      textStyle: base.labelSmall,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
    ),
  );
}

// Button themes
ButtonStyle _elevatedButtonStyle(ColorScheme colors) {
  return ElevatedButton.styleFrom(
    foregroundColor: colors.onPrimary,
    backgroundColor: colors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    elevation: 1,
  );
}

ButtonStyle _textButtonStyle(ColorScheme colors) {
  return TextButton.styleFrom(
    foregroundColor: colors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}

ButtonStyle _outlinedButtonStyle(ColorScheme colors) {
  return OutlinedButton.styleFrom(
    foregroundColor: colors.primary,
    side: BorderSide(color: colors.primary),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  );
}

// Input decoration theme
InputDecorationTheme _inputDecorationTheme(ColorScheme colors) {
  return InputDecorationTheme(
    filled: true,
    fillColor: colors.surface,
    labelStyle: GoogleFonts.inter(
      textStyle: const TextStyle(fontSize: 14),
      color: colors.onSurface.withOpacity(0.7),
    ),
    hintStyle: GoogleFonts.inter(
      textStyle: const TextStyle(fontSize: 14),
      color: colors.onSurface.withOpacity(0.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: colors.onSurface.withOpacity(0.1)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: colors.primary),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: colors.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: colors.error, width: 2),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  );
}

// Card theme
CardTheme _cardTheme(ColorScheme colors) {
  return CardTheme(
    elevation: 0.5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    color: colors.surface,
    clipBehavior: Clip.antiAlias,
    margin: const EdgeInsets.all(8),
  );
}

// Light theme
final ThemeData lightTheme = ThemeData.light().copyWith(
  colorScheme: lightColorScheme,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: lightColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  textTheme: _createTextTheme(ThemeData.light().textTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _elevatedButtonStyle(lightColorScheme),
  ),
  textButtonTheme: TextButtonThemeData(
    style: _textButtonStyle(lightColorScheme),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: _outlinedButtonStyle(lightColorScheme),
  ),
  inputDecorationTheme: _inputDecorationTheme(lightColorScheme),
  cardTheme: _cardTheme(lightColorScheme),
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.2),
    thickness: 1,
    space: 1,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: primaryColor,
    unselectedLabelColor: Colors.grey.shade600,
    indicatorColor: primaryColor,
    labelStyle: GoogleFonts.poppins(
      fontSize: 14, 
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey.shade800,
    size: 24,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey.shade600,
    selectedLabelStyle: GoogleFonts.inter(fontSize: 12),
    unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
  ),
);

// Dark theme
final ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: darkColorScheme,
  primaryColor: primaryColor,
  scaffoldBackgroundColor: darkColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: const Color(0xFF1A1A1A),
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  textTheme: _createTextTheme(ThemeData.dark().textTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: _elevatedButtonStyle(darkColorScheme),
  ),
  textButtonTheme: TextButtonThemeData(
    style: _textButtonStyle(darkColorScheme),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: _outlinedButtonStyle(darkColorScheme),
  ),
  inputDecorationTheme: _inputDecorationTheme(darkColorScheme),
  cardTheme: _cardTheme(darkColorScheme),
  dividerTheme: DividerThemeData(
    color: Colors.grey.withOpacity(0.15),
    thickness: 1,
    space: 1,
  ),
  tabBarTheme: TabBarTheme(
    labelColor: primaryColor,
    unselectedLabelColor: Colors.grey.shade400,
    indicatorColor: primaryColor,
    labelStyle: GoogleFonts.poppins(
      fontSize: 14, 
      fontWeight: FontWeight.w600,
    ),
    unselectedLabelStyle: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
    size: 24,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: const Color(0xFF1A1A1A),
    selectedItemColor: primaryColor,
    unselectedItemColor: Colors.grey.shade400,
    selectedLabelStyle: GoogleFonts.inter(fontSize: 12),
    unselectedLabelStyle: GoogleFonts.inter(fontSize: 12),
  ),
);