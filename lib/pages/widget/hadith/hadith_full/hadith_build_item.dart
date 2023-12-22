import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/size.dart';
import '../../../../core/shared/app_card.dart';
import '../../../../data/model/hadith_model.dart';

class HadithBuildItem extends StatelessWidget {
  const HadithBuildItem({
    super.key,
    required this.model,
  });

  final HadithModel model;

  @override
  Widget build(BuildContext context) {
    return AppCard.hadith(
      context: context,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width(context, 20), vertical: height(context, 40)),
        child: Text(
          "${model.hadithBody}",
          style: const TextStyle(
              fontFamily: 'KFGQPC',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: AppColors.mainClr),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
