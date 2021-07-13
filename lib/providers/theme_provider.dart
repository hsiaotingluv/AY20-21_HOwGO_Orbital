import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier {
  final String key = "theme";
  SharedPreferences _pref;
  bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeSettings() {
    _darkTheme = true;
    _loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if (_pref == null) _pref = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = _pref.getBool(key) ?? true;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _pref.setBool(key, _darkTheme);
  }
}

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  scaffoldBackgroundColor: const Color(0xFF212121),
  primaryColor: Colors.cyan[900],
  // primarySwatch: Colors.grey,
  accentColor: Colors.white54,
  // accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.white54,
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    // Building & Room title
    headline1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    // Campus & Faculty title
    headline2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    // Location title
    subtitle1: TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    ),
    // description
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    // contrasting color
  ),
  // dividerColor: Colors.white54,
  bottomAppBarColor: const Color(0xFF212121),
  dividerTheme: DividerThemeData(
    thickness: 1.0,
    indent: 10,
    endIndent: 10,
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF212121),
  ),
  // colorScheme: ColorScheme.dark(),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.cyan[900],
  accentColor: Colors.blueGrey[600],
  // highlightColor: Colors.blueGrey[600],
  dividerColor: Colors.grey,
  iconTheme: IconThemeData(color: Colors.blueGrey[600]),
  cardTheme: CardTheme(
    color: Colors.white,
  ),
  // accentColor: Colors.black54,
  fontFamily: 'Roboto',
  textTheme: TextTheme(
    // Building & Room title
    headline1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    // Campus & Faculty title
    headline2: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: Colors.cyan[900],
    ),
    // Location title
    subtitle1: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
    // description
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
    ),
    // contrasting color
  ),
);
