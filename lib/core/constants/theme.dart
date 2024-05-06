import 'package:azkar/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightScaffold,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.darkClr,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: 'Gamila',
    ),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: 'Gamila',
        color: AppColors.mainClr),
  ),
);
ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xff323232),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.accentClr,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      fontFamily: 'Gamila',
    ),
    displayMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        fontFamily: 'Gamila',
        color: AppColors.mainClr),
  ),
);
