import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class settings_provider extends ChangeNotifier {
  ThemeMode themMode = ThemeMode.light;
  String language = "ar";

  void changeTheme(ThemeMode newTheme) async {
    if (themMode == newTheme) return;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (newTheme == ThemeMode.dark) {
      prefs.setBool("them", true);
    } else {
      prefs.setBool("them", false);
    }
    themMode = newTheme;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) async {
    if (language == newLanguage) return;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("language", newLanguage);
    language = newLanguage;
    notifyListeners();
  }

  initialize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    language = prefs.getString("language") ?? "en";
    themMode = prefs.getBool("them") == true ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
