import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/constants/styles.dart';
import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/core/services/local_notification_service.dart';
import 'package:azkar/pages/screen/settings/setting_cubit/setting_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
