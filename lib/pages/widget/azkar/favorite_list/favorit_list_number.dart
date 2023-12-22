import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:flutter/material.dart';

class FavoritListNumber extends StatelessWidget {
  const FavoritListNumber({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    int i = index + 1;
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
            padding: const EdgeInsets.only(top: 3, left: 3),
            child: Text(
              i.toArabicNumbers,
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
