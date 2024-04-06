import 'package:flutter/material.dart';

class AppColors {
  static const Color mainClr = Color(0xffE1A438);
  static const Color accentClr = Color(0xffFCF6EA);
  static const Color white = Colors.white;
  static const Color darkClr = Color(0xff333333);
  static const Color greyClr = Color(0xff4F4F4F);
  static const Color greyDarkClr = Color(0xff484A4A);
  static const Color greyLightClr = Color.fromARGB(255, 205, 201, 201);

  static const Color darkScaffold = Colors.black;
  static const Color lightScaffold = Color.fromARGB(255, 255, 255, 255);

  static const Gradient gradient = LinearGradient(
    colors: [
      Color(0xffFFE1B0),
      Color(0xffFDDCA6),
      Color(0xffDE9E2D),
    ],
    end: Alignment.bottomLeft,
    begin: Alignment.topRight,
  );
  static const Gradient gradientLight = LinearGradient(
    colors: [
      Color(0xffFFE1B0),
      Color(0xffDE9E2D),
    ],
    end: Alignment.topRight,
    begin: Alignment.bottomLeft,
  );

  static const Gradient gradientDark = LinearGradient(
    colors: [
      Color.fromARGB(255, 71, 71, 71),
      Color.fromARGB(255, 71, 71, 71),
      Color.fromARGB(255, 71, 71, 71),
      Color.fromARGB(255, 90, 89, 89),
      Color.fromARGB(255, 92, 92, 92),
      Color.fromARGB(255, 119, 118, 118),
    ],
    end: Alignment.topLeft,
    begin: Alignment.bottomRight,
  );
}
