import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:flutter/material.dart';

class CustomMainBody extends StatelessWidget {
  const CustomMainBody({
    super.key,
    required this.mainBody,
    required this.index,
  });

  final String mainBody;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      mainBody,
      style: TextStyle(
          height: height(context, 1.8),
          fontFamily: 'Gamila',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.mainClr),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
