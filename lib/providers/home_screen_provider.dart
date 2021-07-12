import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseHomeScreenSettings extends ChangeNotifier {
  final String key = "homeScreen";
  SharedPreferences _pref;
  bool _homeScreenTheme; // false is Campus Screen, true is Favs Screen

  bool get homeScreen => _homeScreenTheme;

  ChooseHomeScreenSettings() {
    _homeScreenTheme = false;
    _loadFromPrefs();
  }

  toggleTheme() {
    _homeScreenTheme = !_homeScreenTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _homeScreenTheme = _pref.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _homeScreenTheme);
  }
}
