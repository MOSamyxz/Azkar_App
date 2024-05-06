import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/shared/custom_app_bar.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_screen/moshaf_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarMoshafList extends StatelessWidget {
  const AppBarMoshafList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'المصحف',
      widget: Row(
        children: [
          InkWell(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: double.infinity,
                  width: height(context, 28),
                ),
                Icon(
                  Icons.bookmark,
                  color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white
                      : AppColors.darkClr,
                )
              ],
            ),
            onTap: () {
              navigatWithSlideAnimation(
                  MoshafScreen(
                    targetPage: BlocProvider.of<AzkarCubit>(context).savedPage,
                  ),
                  context: context);
            },
          ),
          InkWell(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: double.infinity,
                  width: height(context, 28),
                ),
                Icon(
                  Icons.history,
                  color: BlocProvider.of<ThemeCubit>(context).isDark
                      ? Colors.white
                      : AppColors.darkClr,
                )
              ],
            ),
            onTap: () {
              navigatWithSlideAnimation(
                  MoshafScreen(
                    targetPage: BlocProvider.of<AzkarCubit>(context).savedHPage,
                  ),
                  context: context);
            },
          )
        ],
      ),
      onTap: () {
        navigateBack(context);
      },
    );
  }
}
