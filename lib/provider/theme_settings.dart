import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  ThemeData _currentTheme = ThemeData.light();
  ThemeData get currentTheme => _currentTheme;
  bool get isDark => currentTheme.brightness == Brightness.dark;

  ThemeSettings(bool isDark) {
    _loadTheme(isDark);
  }

  void _loadTheme(bool isDark) async {
    if (isDark) {
      _currentTheme = ThemeData.dark();
    } else {
      _currentTheme = ThemeData.light();
    }
  }

  Future<void> toggleTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (_currentTheme == ThemeData.light()) {
      _currentTheme = ThemeData.dark();
      sharedPreferences.setBool('is_dark', true);
    } else {
      _currentTheme = ThemeData.light();
      sharedPreferences.setBool('is_dark', false);
    }
    notifyListeners();
  }
}

