import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/constants/styles.dart';
import 'package:azkar/core/functions/function.dart';
import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/core/services/local_notification_service.dart';
import 'package:azkar/core/shared/background.dart';
import 'package:azkar/core/shared/custom_app_bar.dart';
import 'package:azkar/cubit/setting_cubit/setting_cubit.dart';
import 'package:azkar/pages/widget/settings/setting_category.dart';
import 'package:azkar/pages/widget/settings/setting_tile_button.dart';
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
                      Column(
                        children: [
                          SettingButtonTile(
                            leadingIcon: Icons.notifications,
                            leadingTitle: 'أذكار الصباح',
                            trillingText: BlocProvider.of<SettingCubit>(context)
                                .hour(
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
                            trillingText: BlocProvider.of<SettingCubit>(context)
                                .hour(
                                    CacheHelper.getInt(key: 'eveningHour') ??
                                        18,
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
                            trillingText: BlocProvider.of<SettingCubit>(context)
                                .hour(
                                    CacheHelper.getInt(key: 'sleepHour') ?? 21,
                                    CacheHelper.getInt(key: 'sleepMin') ?? 0),
                            onTap: () {
                              BlocProvider.of<SettingCubit>(context)
                                  .pikcSleepAzkarTime(context);
                            },
                          ),
                          const Divider(),
                        ],
                      ),
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

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  _SwitchButtonState createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: width(context, 20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            textDirection: TextDirection.rtl,
            children: [
              Text(
                'تفعيل الإشعارات',
                style: settings,
              ),
              Switch(
                activeColor: AppColors.mainClr,
                value:
                    CacheHelper.getBoolean(key: 'notifications') ?? isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                  });
                  BlocProvider.of<SettingCubit>(context)
                      .setNotifications(value);
                  if (isSwitched) {
                    AwesomeNotificationServices().init();
                  }
                  if (!isSwitched) {
                    AwesomeNotificationServices().cancleAll();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
