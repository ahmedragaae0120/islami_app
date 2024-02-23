import 'package:flutter/material.dart';

class settings_provider extends ChangeNotifier {
  ThemeMode themMode = ThemeMode.light;
  Locale language = Locale("ar");
  void changeTheme(ThemeMode newTheme) {
    if (themMode == newTheme) return;
    themMode = newTheme;
    notifyListeners();
  }

  void changeLanguage(Locale newLanguage) {
    if (language == newLanguage) return;
    language = newLanguage;
    notifyListeners();
  }
}
