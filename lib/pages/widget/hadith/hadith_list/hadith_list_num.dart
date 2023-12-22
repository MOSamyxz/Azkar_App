import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/images.dart';
import '../../../../core/constants/size.dart';
import '../../../../data/model/hadith_list_model.dart';

class HadithListNumber extends StatelessWidget {
  const HadithListNumber({
    super.key,
    required this.model,
  });

  final HadithListModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: width(context, 10), right: width(context, 14.5)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            AppImages.frame,
            width: width(context, 32.5),
            height: height(context, 32.5),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              '${model.hadithNumber}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DG_Kufi',
                  color: AppColors.mainClr),
            ),
          )
        ],
      ),
    );
  }
}
