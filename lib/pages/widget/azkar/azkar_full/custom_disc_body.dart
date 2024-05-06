import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDiscText extends StatelessWidget {
  const CustomDiscText({
    super.key,
    required this.disc,
    required this.index,
  });

  final String disc;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      disc,
      style: TextStyle(
        fontFamily: 'Gamila',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: BlocProvider.of<ThemeCubit>(context).isDark
            ? const Color.fromARGB(255, 184, 182, 182)
            : AppColors.greyLightClr,
      ),
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
    );
  }
}
