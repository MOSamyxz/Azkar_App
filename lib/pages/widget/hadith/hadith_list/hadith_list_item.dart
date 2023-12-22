import 'package:azkar/pages/widget/hadith/hadith_list/hadith_list_num.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/shared/app_card.dart';
import '../../../../data/model/hadith_list_model.dart';

class HadithListItem extends StatelessWidget {
  const HadithListItem({
    super.key,
    required this.model,
  });

  final HadithListModel model;

  @override
  Widget build(BuildContext context) {
    return AppCard.hadithList(
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
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'DG_Kufi',
                      color: AppColors.mainClr)),
              Text('${model.name}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      fontFamily: 'DG_Kufi',
                      color: AppColors.mainClr))
            ],
          ),
          HadithListNumber(model: model),
        ],
      ),

      /**/
    );
  }
}
