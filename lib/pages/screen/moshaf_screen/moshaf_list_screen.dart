import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/constants.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_state.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/pages/screen/moshaf_screen/moshaf_screen.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MoshafList extends StatelessWidget {
  const MoshafList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              const Background(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width(context, 20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: height(context, 56),
                    ),
                    CustomAppBar(
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
                                  color: BlocProvider.of<ThemeCubit>(context)
                                          .isDark
                                      ? Colors.white
                                      : AppColors.darkClr,
                                )
                              ],
                            ),
                            onTap: () {
                              navigatWithSlideAnimation(
                                  MoshafScreen(
                                    targetPage:
                                        BlocProvider.of<AzkarCubit>(context)
                                            .savedPage,
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
                                  color: BlocProvider.of<ThemeCubit>(context)
                                          .isDark
                                      ? Colors.white
                                      : AppColors.darkClr,
                                )
                              ],
                            ),
                            onTap: () {
                              navigatWithSlideAnimation(
                                  MoshafScreen(
                                    targetPage:
                                        BlocProvider.of<AzkarCubit>(context)
                                            .savedHPage,
                                  ),
                                  context: context);
                            },
                          )
                        ],
                      ),
                      onTap: () {
                        navigateBack(context);
                      },
                    ),
                    SizedBox(
                      height: height(context, 19),
                    ),
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          int num = index + 1;
                          var arNum = num.toArabicNumbers;
                          return GestureDetector(
                            onTap: () {
                              navigatWithSlideAnimation(
                                  MoshafScreen(
                                    targetPage: surahNo[index]['surah'],
                                  ),
                                  context: context);
                            },
                            child: AppCard.moshafList(
                                context: context,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${surahNo[index]['name']}',
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Gamila',
                                            color: AppColors.mainClr),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(
                                              left: width(context, 10),
                                              right: width(context, 14.5)),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Image.asset(
                                                AppImages.frame,
                                                width: width(context, 35),
                                                height: height(context, 35),
                                              ),
                                              Text(
                                                arNum,
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Gamila',
                                                    color: AppColors.mainClr),
                                              )
                                            ],
                                          ))
                                    ])),
                          );
                        },
                        itemCount: surahNo.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: height(context, 10),
                          );
                        },
                        padding: EdgeInsets.zero,
                      ),
                    ),
                    SizedBox(
                      height: height(context, 10),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
