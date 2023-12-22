import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/shared/app_card.dart';
import 'package:azkar/core/shared/custom_app_bar.dart';
import 'package:azkar/cubit/sebha_cubit/sebha_cubit.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SebhaScreen extends StatelessWidget {
  const SebhaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SebhaCubit()..loadCounter(),
      child: BlocBuilder<SebhaCubit, SebhaState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Background(),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: height(context, 56),
                    ),
                    CustomAppBar(
                      title: 'السبحة',
                      widget: InkWell(
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: double.infinity,
                              width: height(context, 35),
                            ),
                            Image.asset(
                              AppImages.refresh,
                              width: width(context, 20),
                              height: height(context, 20),
                              color: BlocProvider.of<ThemeCubit>(context).isDark
                                  ? Colors.white
                                  : AppColors.darkClr,
                            ),
                          ],
                        ),
                        onTap: () {
                          BlocProvider.of<SebhaCubit>(context).countReset();
                        },
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(
                      height: height(context, 15),
                    ),
                    GestureDetector(
                      onTap: () {
                        BlocProvider.of<SebhaCubit>(context).countIncrement();
                      },
                      child: AppCard.sebha(
                          context: context,
                          child: Text(
                            '${BlocProvider.of<SebhaCubit>(context).index}',
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 110,
                                fontFamily: 'digital-7',
                                color: AppColors.mainClr),
                          )),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
