import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/shared/background.dart';
import 'package:azkar/core/shared/custom_app_bar.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/cubit/theme_cubit/state.dart';
import 'package:azkar/pages/screen/settings/notifications_setting_screen.dart';
import 'package:azkar/pages/widget/settings/setting_category.dart';
import 'package:azkar/pages/widget/settings/setting_switch_button.dart';
import 'package:azkar/pages/widget/settings/setting_tile_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Background(),
              Column(
                children: [
                  SizedBox(
                    height: height(context, 56),
                  ),
                  CustomAppBar(
                      title: 'الإعدادات',
                      onTap: () {
                        navigateBack(context);
                      }),
                  const SettingCategory(title: 'إعدادات عامة'),
                  SettingSwitchTile(
                    leadingIcon: Icons.light_mode,
                    leadingTitle: 'ثيم البرنامج',
                    currentValue:
                        BlocProvider.of<ThemeCubit>(context).isDark ? 1 : 0,
                    firstSwitchIcon: Icons.light_mode,
                    secondeSwitchIcon: Icons.dark_mode,
                    onChanged: (i) {
                      BlocProvider.of<ThemeCubit>(context).changeAppMode();
                    },
                  ),
                  SettingButtonTile(
                    leadingIcon: Icons.notifications,
                    leadingTitle: 'التذكيرات',
                    onTap: () {
                      navigatWithSlideAnimation(
                          const NotificationSettingsScreen(),
                          context: context);
                    },
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}



/* InkWell(
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
        ), */