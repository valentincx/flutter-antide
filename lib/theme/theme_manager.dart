import 'package:flutter/material.dart';

import '../services/storage_manager.dart';
import 'constants.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
      fontFamily: "Alegreya",
      brightness: Brightness.dark,
      bottomAppBarColor: backgroundColor,
      scaffoldBackgroundColor: backgroundColor,
      canvasColor: backgroundColor,
      primaryColor: lightColor,
      hintColor: Colors.white,
      accentColor: primaryColor,
      accentIconTheme: IconThemeData(color: Colors.white),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Color(0xFF212121),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Color(0xFF212121),
      ),
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Color(0xFFBDC2C2)),
        bodyText1: TextStyle(color: Color(0xFF000000)),
        bodyText2: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
      ));

  final lightTheme = ThemeData(
      fontFamily: "Alegreya",
      primarySwatch: Colors.grey,
      primaryColor: Colors.black,
      brightness: Brightness.light,
      hintColor: Colors.black,
      bottomAppBarColor: kBackgroundColor,
      scaffoldBackgroundColor: kBackgroundColor,
      canvasColor: kBackgroundColor,
      accentColor: kPrimaryColor,
      accentIconTheme: IconThemeData(color: Colors.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Color(0xFFFFFFFF),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Color(0xFFFFFFFF),
      ),
      textTheme: TextTheme(
        subtitle1: TextStyle(color: Color(0xFFAEAEAE)),
        bodyText1: TextStyle(color: Color(0xFFAEAEAE)),
        bodyText2: TextStyle(color: Colors.black),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: TextStyle(color: kDarkerColor),
        hintStyle: TextStyle(color: kDarkerColor),
      ));

  ThemeData _themeData;
  ThemeData getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {
        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }
}
