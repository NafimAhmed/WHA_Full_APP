import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  primaryColor: primaryColor,
  backgroundColor: backgroundColor,
  brightness: Brightness.light,
  appBarTheme: const AppBarTheme(
    backgroundColor: primaryColor,
    titleTextStyle: TextStyle(
      color: backgroundColor,
    ),
  ),
);

final ThemeData darkThemeData = ThemeData(
  primaryColor: darkPrimaryColor,
  backgroundColor: darkBackgroundColor,
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: darkBackgroundColor,
    titleTextStyle: TextStyle(color: darkPrimaryColor),
  ),
);
