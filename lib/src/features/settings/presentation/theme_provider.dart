import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // State
  bool _isDarkMode = false;

  ThemeProvider() {
    // was soll getan werden, wenn die Klasse erzeugt wird?
    getLocalThemeMode();
  }

  Future<bool> getLocalThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final localIsDark = prefs.getBool('themeMode') ?? false;
    _isDarkMode = localIsDark;
    notifyListeners();
    return _isDarkMode;
  }

  Future<void> toggleLocalThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool currentIsDark = await getLocalThemeMode();
    await prefs.setBool('themeMode', !currentIsDark);
    _isDarkMode = !currentIsDark;
    notifyListeners();
  }

  bool getThemeMode() {
    return _isDarkMode;
  }
}
