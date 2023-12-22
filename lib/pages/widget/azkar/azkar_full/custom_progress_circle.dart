import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/services/to_ar_num_converter.dart';
import 'package:flutter/material.dart';

class CustomProgressCircle extends StatelessWidget {
  const CustomProgressCircle({
    super.key,
    required this.index,
    required this.counter,
    required this.count,
    required this.aLeanght,
  });

  final int index;
  final int counter;
  final int count;
  final String aLeanght;
  @override
  Widget build(BuildContext context) {
    int i = index + 1;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              ' / ${aLeanght.toArabicNumbers}  ',
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'DG_Kufi',
                  color: AppColors.darkClr),
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
            ),
            Text(
              i.toArabicNumbers,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  fontFamily: 'DG_Kufi',
                  color: AppColors.mainClr),
              textAlign: TextAlign.left,
              textDirection: TextDirection.rtl,
            ),
          ],
        ),
        SizedBox(
          width: width(context, 30),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: width(context, 88),
              height: height(context, 88),
              child: CircularProgressIndicator(
                value: counter / count,
                strokeWidth: 6,
                backgroundColor: AppColors.mainClr.withOpacity(0.2),
                color: AppColors.mainClr,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                counter.toArabicNumbers,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
                    fontFamily: 'DG_Kufi',
                    color: AppColors.mainClr),
                textAlign: TextAlign.center,
                // textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
        SizedBox(
          width: width(context, 30),
        ),
        Text(
            count > 10
                ? '$count مرة'
                : count == 1
                    ? 'مرة واحدة'
                    : count == 2
                        ? 'مرتان'
                        : '${count.toArabicNumbers} مرات',
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                fontFamily: 'DG_Kufi',
                color: AppColors.mainClr)),
      ],
    );
  }
}
