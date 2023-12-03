import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String isDarkModeKey = "isDarkMode";

class ThemeProvider extends ChangeNotifier {
  //TODO:: get data from local storage

  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void init() async {
    final prefs = await SharedPreferences.getInstance();
    final isDarkMode = prefs.getBool(isDarkModeKey);
    if (isDarkMode != null) {
      _isDarkMode = true;
      notifyListeners();
    }
    print('isDarkMode: $_isDarkMode');
  }

  void toggleTheme() async {
    _isDarkMode = !_isDarkMode;
    _saveThemeToLocalStorage();
    notifyListeners();
  }

  void _saveThemeToLocalStorage() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(isDarkModeKey, _isDarkMode);
  }
}
