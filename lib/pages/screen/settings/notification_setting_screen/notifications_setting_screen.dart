import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/pages/screen/settings/setting_cubit/setting_cubit.dart';
import 'package:azkar/pages/widgets.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationSettingsScreen extends StatelessWidget {
  const NotificationSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingCubit(),
      child: BlocBuilder<SettingCubit, SettingState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                const Background(),
                Column(
                  children: [
                    SizedBox(
                      height: height(context, 56),
                    ),
                    CustomAppBar(
                      title: 'التذكيرات',
                      onTap: () {
                        navigateBack(context);
                      },
                    ),
                    const SettingCategory(title: 'التذكيرات'),
                    const SwitchButton(),
                    if (CacheHelper.getBoolean(key: 'notifications') == true)
                      const NotificationButtons(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
