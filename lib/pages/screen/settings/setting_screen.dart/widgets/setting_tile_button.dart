import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/constants/styles.dart';
import 'package:flutter/material.dart';

class SettingButtonTile extends StatelessWidget {
  const SettingButtonTile({
    super.key,
    required this.leadingIcon,
    required this.leadingTitle,
    this.onTap,
    this.trillingText,
  });
  final IconData leadingIcon;
  final void Function()? onTap;

  final String leadingTitle;
  final String? trillingText;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(color: Theme.of(context).cardTheme.color),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(
                leadingIcon,
                size: 20,
              ),
              SizedBox(
                width: width(context, 10),
              ),
              Text(
                leadingTitle,
                style: settings,
              ),
              const Spacer(),
              trillingText == null
                  ? const Icon(Icons.arrow_back_ios)
                  : Text(
                      trillingText!,
                      style: settings,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
