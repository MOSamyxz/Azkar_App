import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/constants/strings.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDateBar extends StatelessWidget {
  const HomeDateBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width(context, 60),
        ),
        Container(
          alignment: Alignment.center,
          height: height(context, 40),
          child: Text(
            AppStrigs.date,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        InkWell(
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: width(context, 60),
                height: height(context, 40),
              ),
              Icon(
                BlocProvider.of<ThemeCubit>(context).isDark
                    ? Icons.mode_night
                    : Icons.light_mode,
                color: BlocProvider.of<ThemeCubit>(context).isDark
                    ? AppColors.accentClr
                    : AppColors.mainClr,
              )
            ],
          ),
          onTap: () {
            BlocProvider.of<ThemeCubit>(context).changeAppMode();
          },
        )
      ],
    );
  }
}
