import 'package:flutter/material.dart';

class CustomTheme {
  static const Color lightThemeTextColor = Color(0xff1f1f1f);
  static const Color darkThemeTextColor = Colors.white;
  static const Color darkBgColor = Color(0xff243447);
  static const Color lightBgColor = Color(0xffFFFDD0);

  static final lightTheme = ThemeData(
    primarySwatch: Colors.red,
    scaffoldBackgroundColor: Color(0xffFFFDD0),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 24,
          color: lightThemeTextColor,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 22,
          color: lightThemeTextColor,
          fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontSize: 20,
          color: lightThemeTextColor,
          fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 18, color: lightThemeTextColor),
      headline5: TextStyle(fontSize: 16, color: lightThemeTextColor),
      headline6: TextStyle(fontSize: 14, color: lightThemeTextColor),
    ),
  );

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff243447),
    primarySwatch: Colors.red,
    hintColor: darkThemeTextColor,
    // iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 24, color: darkThemeTextColor, fontWeight: FontWeight.bold),
      headline2: TextStyle(
          fontSize: 22, color: darkThemeTextColor, fontWeight: FontWeight.bold),
      headline3: TextStyle(
          fontSize: 20, color: darkThemeTextColor, fontWeight: FontWeight.bold),
      headline4: TextStyle(fontSize: 18, color: darkThemeTextColor),
      headline5: TextStyle(fontSize: 16, color: darkThemeTextColor),
      headline6: TextStyle(fontSize: 14, color: darkThemeTextColor),
      button: TextStyle(fontSize: 16, color: darkThemeTextColor),
    ),
  );

  static final highContrastLightTheme = ThemeData();

  static final highContrastDarkTheme = ThemeData();
}
