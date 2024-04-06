import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/constants/strings.dart';
import 'package:azkar/core/functions/function.dart';

import 'package:azkar/pages/screen/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class HomeDateBar extends StatelessWidget {
  const HomeDateBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: width(context, 60),
        ),
        Container(
          alignment: Alignment.center,
          height: height(context, 40),
          child: Text(
            AppStrings.date,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        SizedBox(
          width: width(context, 60),
          child: InkWell(
            onTap: () async {
              navigatWithSlideAnimation(const SettingsScreen(), context: context);
            },
            child: const Icon(Icons.settings),
          ),
        )
      ],
    );
  }
}
