import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageProvider extends ChangeNotifier {
  bool _isEnglish = true;

  bool get isEnglish => _isEnglish;

  void init() async {
    final pref = await SharedPreferences.getInstance();
    var lang =
        pref.getBool('isEnglish'); // first loading is null, second not null

    if (lang != null) {
      _isEnglish = lang;
      // _isEnglish = false
      notifyListeners();
    }
  }

  void saveLanguageToLocalStorage() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool('isEnglish', _isEnglish);
  }

  void toggleLanguage() {
    _isEnglish = !_isEnglish;
    notifyListeners();
  }
}
