import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/size.dart';

class AppCard extends StatelessWidget {
  final double? cHeight;
  final double cWidth;
  final double zHeight;
  final double zWidth;
  final Widget child;
  final BuildContext context;
  final EdgeInsetsGeometry paddingTop;
  final EdgeInsetsGeometry paddingBottom;

  const AppCard({
    super.key,
    this.cHeight,
    required this.cWidth,
    required this.zHeight,
    required this.zWidth,
    required this.child,
    required this.context,
    required this.paddingTop,
    required this.paddingBottom,
  });

  AppCard.home({Key? key, required this.child, required this.context})
      : cHeight = height(context, 166),
        cWidth = width(context, 170),
        zHeight = height(context, 53),
        zWidth = width(context, 67),
        paddingTop = const EdgeInsets.only(top: 5.0),
        paddingBottom = const EdgeInsets.only(bottom: 5.0),
        super(key: key);

  AppCard.sebha({Key? key, required this.child, required this.context})
      : cHeight = height(context, 730),
        cWidth = width(context, 350),
        zHeight = height(context, 113.75),
        zWidth = width(context, 113),
        paddingTop = const EdgeInsets.all(8.0),
        paddingBottom = const EdgeInsets.all(8.0),
        super(key: key);

  AppCard.azkar(
      {Key? key,
      required this.child,
      required this.context,
      required this.cHeight})
      : cWidth = width(context, 180),
        zHeight = 67,
        zWidth = 53,
        paddingTop = const EdgeInsets.symmetric(horizontal: 5.0),
        paddingBottom = const EdgeInsets.symmetric(horizontal: 5.0),
        super(key: key);

  AppCard.azkarList({Key? key, required this.child, required this.context})
      : cHeight = height(context, 77),
        cWidth = width(context, 350),
        zHeight = height(context, 48.23),
        zWidth = width(context, 50.5),
        paddingTop = const EdgeInsets.all(5.0),
        paddingBottom = const EdgeInsets.all(5.0),
        super(key: key);

  AppCard.favoriteList({Key? key, required this.child, required this.context})
      : cHeight = height(context, 77),
        cWidth = width(context, 350),
        zHeight = height(context, 48.23),
        zWidth = width(context, 50.5),
        paddingTop = const EdgeInsets.all(5.0),
        paddingBottom = const EdgeInsets.all(5.0),
        super(key: key);

  AppCard.dialog({Key? key, required this.child, required this.context})
      : cHeight = height(context, 250),
        cWidth = width(context, 350),
        zHeight = height(context, 48.23),
        zWidth = width(context, 50.5),
        paddingTop = const EdgeInsets.all(5.0),
        paddingBottom = const EdgeInsets.all(5.0),
        super(key: key);

  AppCard.zekr({Key? key, required this.child, required this.context})
      : cHeight = height(context, 720),
        cWidth = double.infinity,
        zHeight = height(context, 113.75),
        zWidth = width(context, 118.25),
        paddingTop = const EdgeInsets.all(4.0),
        paddingBottom = const EdgeInsets.all(4.0),
        super(key: key);

  AppCard.hadithList({Key? key, required this.child, required this.context})
      : cHeight = height(context, 77),
        cWidth = width(context, 350),
        zHeight = height(context, 48.23),
        zWidth = width(context, 50.5),
        paddingTop = const EdgeInsets.all(5.0),
        paddingBottom = const EdgeInsets.all(5.0),
        super(key: key);

  AppCard.hadith(
      {Key? key, required this.child, required this.context, this.cHeight})
      : cWidth = double.infinity,
        zHeight = height(context, 79.75),
        zWidth = width(context, 82.91),
        paddingTop = const EdgeInsets.all(4.0),
        paddingBottom = const EdgeInsets.all(4.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Stack(
          alignment: Alignment.topLeft,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        width: cWidth,
                        height: cHeight,
                        decoration: BoxDecoration(
                            color: BlocProvider.of<ThemeCubit>(context).isDark
                                ? const Color.fromARGB(255, 71, 71, 71)
                                : const Color(0xffFCF6EA),
                            borderRadius: BorderRadius.circular(4)),
                        child: child),
                    Padding(
                        padding: paddingBottom,
                        child: Image.asset(
                          AppImages.textBackgroundBottomLeft,
                          width: zWidth,
                          height: zHeight,
                          color: AppColors.mainClr.withOpacity(0.8),
                        ))
                  ],
                ),
                Padding(
                    padding: paddingBottom,
                    child: Image.asset(
                      AppImages.textBackgroundBottomRight,
                      width: zWidth,
                      height: zHeight,
                      color: AppColors.mainClr.withOpacity(0.8),
                    ))
              ],
            ),
            Padding(
                padding: paddingTop,
                child: Image.asset(
                  AppImages.textBackgroundTopLeft,
                  width: zWidth,
                  height: zHeight,
                  color: AppColors.mainClr.withOpacity(0.8),
                ))
          ],
        ),
        Padding(
            padding: paddingTop,
            child: Image.asset(
              AppImages.textBackgroundTopRight,
              width: zWidth,
              height: zHeight,
              color: AppColors.mainClr.withOpacity(0.8),
            ))
      ],
    );
  }
}
