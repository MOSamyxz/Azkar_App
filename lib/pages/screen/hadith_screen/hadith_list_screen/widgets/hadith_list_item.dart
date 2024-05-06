import 'package:azkar/core/functions/function.dart';
import 'package:azkar/pages/screen/hadith_screen/hadith_list_screen/widgets/hadith_list_num.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/colors.dart';
import '../../../../../core/shared/app_card.dart';
import '../../../../../data/model/hadith_list_model.dart';
import '../../hadith_full_screen/hadith_full_screen.dart';

class HadithListItem extends StatelessWidget {
  const HadithListItem({
    super.key,
    required this.model,
  });

  final HadithListModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigatWithSlideAnimation(
            HadithBuildScreen(id: model.id!, hadithNum: model.number!),
            context: context);
      },
      child: AppCard.hadithList(
        context: context,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('${model.number}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        fontFamily: 'Gamila',
                        color: AppColors.mainClr)),
                Text('${model.name}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: 'Gamila',
                        color: AppColors.mainClr))
              ],
            ),
            HadithListNumber(model: model),
          ],
        ),

        /**/
      ),
    );
  }
}
