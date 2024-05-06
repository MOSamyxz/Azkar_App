import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/constants.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:flutter/material.dart';

class InMoshafListCard extends StatelessWidget {
  const InMoshafListCard({
    super.key,
    required this.arNum,
    required this.index,
  });

  final String arNum;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(
        '${surahNo[index]['name']}',
        style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Gamila',
            color: AppColors.mainClr),
      ),
      Padding(
          padding: EdgeInsets.only(
              left: width(context, 10), right: width(context, 14.5)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppImages.frame,
                width: width(context, 35),
                height: height(context, 35),
              ),
              Text(
                arNum,
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gamila',
                    color: AppColors.mainClr),
              )
            ],
          ))
    ]);
  }
}
