import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme() {
    themeMode == ThemeMode.dark
        ? themeMode = ThemeMode.light
        : themeMode = ThemeMode.dark;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 5,
      color: Colors.black45,
    ),
    scaffoldBackgroundColor: Colors.black,
    primaryColor: Colors.black,
    backgroundColor: Colors.black12,
    // brightness: Brightness.dark,
    accentColor: Colors.white,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
      ),
    ),
    dividerColor: Colors.white54,
    bottomAppBarColor: Colors.black12,
    iconTheme: IconThemeData(
      color: Colors.purpleAccent.shade100,
    ),
    dividerTheme: DividerThemeData(
      thickness: 1.0,
      indent: 10,
      endIndent: 10,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    // colorScheme: ColorScheme.dark(),
  );

  static final lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      elevation: 5,
      color: Colors.orange,
    ),
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.orange,
    backgroundColor: Colors.white,
    accentColor: Colors.blue.shade700,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.black,
      ),
      bodyText1: TextStyle(
        color: Colors.black,
      ),
    ),
    dividerColor: Colors.grey,
    iconTheme: IconThemeData(
      color: Colors.pink.shade400,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
  );
}
