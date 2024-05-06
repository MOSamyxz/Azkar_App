import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/pages/screen/settings/setting_cubit/setting_cubit.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationButtons extends StatelessWidget {
  const NotificationButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingButtonTile(
          leadingIcon: Icons.notifications,
          leadingTitle: 'أذكار الصباح',
          trillingText: BlocProvider.of<SettingCubit>(context).hour(
              CacheHelper.getInt(key: 'morningHour') ?? 9,
              CacheHelper.getInt(key: 'morningMin') ?? 0),
          onTap: () {
            BlocProvider.of<SettingCubit>(context)
                .pikcMoriningAzkarTime(context);
          },
        ),
        const Divider(),
        SettingButtonTile(
          leadingIcon: Icons.notifications,
          leadingTitle: 'أذكار المساء',
          trillingText: BlocProvider.of<SettingCubit>(context).hour(
              CacheHelper.getInt(key: 'eveningHour') ?? 18,
              CacheHelper.getInt(key: 'eveningMin') ?? 0),
          onTap: () {
            BlocProvider.of<SettingCubit>(context)
                .pikcEveningAzkarTime(context);
          },
        ),
        const Divider(),
        SettingButtonTile(
          leadingIcon: Icons.notifications,
          leadingTitle: 'أذكار النوم',
          trillingText: BlocProvider.of<SettingCubit>(context).hour(
              CacheHelper.getInt(key: 'sleepHour') ?? 21,
              CacheHelper.getInt(key: 'sleepMin') ?? 0),
          onTap: () {
            BlocProvider.of<SettingCubit>(context).pikcSleepAzkarTime(context);
          },
        ),
        const Divider(),
      ],
    );
  }
}
