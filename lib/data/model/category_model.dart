import 'package:flutter/material.dart';

class CategoryModel {
  final String text;
  final String image;
  final Widget widget;
  const CategoryModel(
      {required this.text, required this.image, required this.widget});
}
