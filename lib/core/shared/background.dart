import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Background extends StatelessWidget {
  const Background({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppImages.scaffoldBackground,
      height: double.infinity,
      width: double.infinity,
      // ignore: deprecated_member_use
      color: BlocProvider.of<ThemeCubit>(context).isDark
          ? AppColors.greyClr
          : AppColors.greyLightClr,
      fit: BoxFit.cover,
    );
  }
}
