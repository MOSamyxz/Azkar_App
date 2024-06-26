import 'package:azkar/core/constants/size.dart';
import 'package:azkar/pages/screen/home_screen/home_cubit/home_cubit.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/cubit/theme_cubit/state.dart';
import 'package:azkar/pages/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return BlocProvider(
          create: (context) => HomeCubit()..initRandomText(),
          child: Scaffold(
            body: Stack(
              children: [
                Background(),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height(context, 56),
                      ),
                      const HomeDateBar(),
                      SizedBox(
                        height: height(context, 15),
                      ),
                      BlocBuilder<HomeCubit, HomeState>(
                        builder: (context, state) {
                          return AyaCard();
                        },
                      ),
                      SizedBox(height: height(context, 15)),
                      HomeWarpView()
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
