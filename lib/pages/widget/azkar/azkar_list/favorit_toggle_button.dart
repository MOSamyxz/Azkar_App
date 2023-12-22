import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteToggleButton extends StatelessWidget {
  const FavoriteToggleButton({
    super.key,
    required this.isFavorite,
    required this.index,
    required this.onPressed,
  });

  final bool isFavorite;

  final int index;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: IconButton(
            icon: isFavorite
                ? Image.asset(
                    AppImages.heart,
                    width: 20,
                  )
                : Image.asset(AppImages.emptyHeart,
                    width: 20,
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? AppColors.mainClr
                        : Colors.black),
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}
