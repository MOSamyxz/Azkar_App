import 'package:flutter/material.dart';

double width(BuildContext context, double width) {
  return MediaQuery.of(context).size.width * width / 390;
}

double height(BuildContext context, double height) {
  return MediaQuery.of(context).size.height * height / 844;
}
