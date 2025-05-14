import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../theme/app_theme.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  String _currentThemeKey = 'default';
  
  ThemeMode get themeMode => _themeMode;
  String get currentThemeKey => _currentThemeKey;
  
  // Get current user theme based on selected user
  UserTheme get currentUserTheme => 
      AppTheme.userThemes[_currentThemeKey] ?? AppTheme.userThemes['default']!;
  
  // Update theme based on selected user
  void setUserTheme(UserData userData) {
    if (userData.identifyingColor == const Color(0xFF4CAF50)) {
      _currentThemeKey = 'green';
    } else if (userData.identifyingColor == const Color(0xFF2196F3)) {
      _currentThemeKey = 'blue';
    } else if (userData.identifyingColor == const Color(0xFFF44336)) {
      _currentThemeKey = 'red';
    } else {
      _currentThemeKey = 'default';
    }
    notifyListeners();
  }
  
  // Toggle between light and dark mode
  void toggleThemeMode() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
  
  // Get current background color based on brightness
  Color getBackgroundColor(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return isDark 
        ? currentUserTheme.darkBackground
        : currentUserTheme.lightBackground;
  }
  
  // Get current gradient based on user theme
  LinearGradient get currentGradient => currentUserTheme.gradient;
  
  // Get current primary color
  Color get primaryColor => currentUserTheme.primary;
}