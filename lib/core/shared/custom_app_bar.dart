import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, this.widget, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        alignment: Alignment.center,
        height: height(context, 28),
        child: Row(
          children: [
            widget ??
                SizedBox(
                  height: double.infinity,
                  width: width(context, 35),
                ),
            Expanded(
                child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
              textDirection: TextDirection.rtl,
            )),
            InkWell(
              borderRadius: BorderRadius.circular(50),
              onTap: onTap,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: double.infinity,
                    width: width(context, 40),
                  ),
                  Image.asset(AppImages.back,
                      width: width(context, 20),
                      height: height(context, 20),
                      color: BlocProvider.of<ThemeCubit>(context).isDark
                          ? Colors.white
                          : AppColors.darkClr),
                ],
              ),
            ),
          ],
        ));
  }
}
