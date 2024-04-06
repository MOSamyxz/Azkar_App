import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/constants/styles.dart';
import 'package:flutter/material.dart';

class SettingSwitchTile extends StatelessWidget {
  const SettingSwitchTile({
    super.key,
    required this.leadingIcon,
    this.firstSwitchIcon,
    this.secondeSwitchIcon,
    required this.leadingTitle,
    required this.currentValue,
    this.onChanged,
    this.firstTextIcon,
    this.secondeTextIcon,
  });
  final IconData leadingIcon;
  final IconData? firstSwitchIcon;
  final IconData? secondeSwitchIcon;
  final String? firstTextIcon;
  final String? secondeTextIcon;
  final String leadingTitle;
  final int currentValue;
  final void Function(int)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height(context, 50),
      decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width(context, 20)),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Icon(
              leadingIcon,
              size: 20,
            ),
            SizedBox(
              width: width(context, 5),
            ),
            Text(
              leadingTitle,
              style: settings,
            ),
            const Spacer(),
            AnimatedToggleSwitch<int>.rolling(
              height: 30,
              indicatorSize: const Size.fromWidth(45.0),
              style: const ToggleStyle(
                  borderColor: AppColors.mainClr,
                  indicatorColor: AppColors.mainClr),
              current: currentValue,
              values: const [0, 1],
              onChanged: onChanged,
              iconBuilder: (int value, bool current) {
                if (firstSwitchIcon != null) {
                  return value == 0
                      ? Icon(firstSwitchIcon,
                          color: current ? AppColors.white : Colors.grey)
                      : Icon(secondeSwitchIcon,
                          color: current ? AppColors.white : Colors.grey);
                } else {
                  return value == 0
                      ? Text(
                          firstTextIcon!,
                          style: TextStyle(
                              color: current ? AppColors.white : Colors.grey),
                        )
                      : Text(
                          secondeTextIcon!,
                          style: TextStyle(
                              color: current ? AppColors.white : Colors.grey),
                        );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
