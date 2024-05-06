import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: double.infinity,
          width: height(context, 28),
        ),
        SizedBox(
          height: height(context, 28),
          width: height(context, 28),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Align(
                child: Image.asset(
                  AppImages.emptyHeart,
                  color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white
                      : AppColors.darkClr,
                  width: width(context, 20),
                  height: height(context, 20),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    AppImages.favNotify,
                    width: width(context, 16),
                    height: height(context, 16),
                  ),
                  BlocBuilder<AzkarCubit, AzkarState>(
                    builder: (context, state) {
                      int i =
                          BlocProvider.of<AzkarCubit>(context).favorite.length;
                      return Text(
                        i.toArabicNumbers,
                        style: const TextStyle(
                            color: AppColors.darkClr,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Gamila'),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
