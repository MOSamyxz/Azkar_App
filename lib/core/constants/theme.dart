import 'package:azkar/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.lightScaffold,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.darkClr,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontFamily: 'DG_Kufi',
    ),
    displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'DG_Kufi',
        color: AppColors.mainClr),
  ),
);
ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.darkScaffold,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: AppColors.accentClr,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      fontFamily: 'DG_Kufi',
    ),
    displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        fontFamily: 'DG_Kufi',
        color: AppColors.mainClr),
  ),
);
