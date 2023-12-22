import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/pages/screen/salah_screen/search_city_screen.dart';
import 'package:azkar/pages/widget/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SalahScreen extends StatelessWidget {
  const SalahScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width(context, 20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height(context, 56),
                ),
                CustomAppBar(
                  title: 'أوقات الصلاة',
                  onTap: () {
                    navigateBack(context);
                  },
                  widget: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    child: Icon(
                      Icons.search,
                      size: 25,
                      color: BlocProvider.of<ThemeCubit>(context).isDark
                          ? Colors.white
                          : AppColors.darkClr,
                    ),
                    onTap: () {
                      BlocProvider.of<AzkarCubit>(context).initSearch();
                      navigatWithSlideAnimation(const SearchCityScreen(),
                          context: context);
                    },
                  ),
                ),
                SizedBox(
                  height: height(context, 19),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
