import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/cubit/home_cubit/home_cubit.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AyaCard extends StatelessWidget {
  const AyaCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
            alignment: Alignment.topCenter,
            width: width(context, 350),
            height: height(context, 182),
            decoration: BoxDecoration(
                gradient: BlocProvider.of<ThemeCubit>(context).isDark
                    ? AppColors.gradientDark
                    : AppColors.gradientLight,
                borderRadius: BorderRadius.circular(8)),
            child: Image.asset(AppImages.mainPageCard,
                color: BlocProvider.of<ThemeCubit>(context).isDark
                    ? AppColors.accentClr.withOpacity(0.1)
                    : AppColors.accentClr.withOpacity(0.2))),
        Padding(
          padding: EdgeInsets.only(
            top: height(context, 8),
            right: width(context, 24),
            left: width(context, 24),
          ),
          child: Column(
            children: [
              Text(
                'ايه اليوم',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gamila',
                    color: BlocProvider.of<ThemeCubit>(context).isDark
                        ? AppColors.mainClr
                        : AppColors.accentClr),
              ),
              SizedBox(
                height: height(context, 10),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BlocProvider.of<HomeCubit>(context).aya,
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gamila',
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: height(context, 10),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          BlocProvider.of<HomeCubit>(context)
                              .sourah
                              .toArabicNumbers,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Gamila',
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                                  ? AppColors.mainClr
                                  : Colors.white),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
