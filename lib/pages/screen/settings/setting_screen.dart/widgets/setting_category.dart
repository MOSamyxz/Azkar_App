import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/constants/styles.dart';
import 'package:flutter/material.dart';

class SettingCategory extends StatelessWidget {
  const SettingCategory({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
  });
  final String title;
  final double? fontSize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.black.withOpacity(0.1),
      padding: EdgeInsets.symmetric(horizontal: width(context, 20)),
      height: 30,
      child: Text(
        textDirection: TextDirection.rtl,
        title,
        style: settings,
      ),
    );
  }
}
