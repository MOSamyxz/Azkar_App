import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/core/shared/app_card.dart';
import 'package:flutter/material.dart';

class NextSalahCard extends StatelessWidget {
  const NextSalahCard({
    super.key,
    required this.salah,
    required this.child,
  });
  final String salah;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AppCard.salah(
      context: context,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'الوقت المتبقي حتى صلاة $salah',
                style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'KFGQPC',
                    color: AppColors.mainClr),
              ),
              child
            ],
          ),
          Image.asset(
            AppImages.salah,
            height: height(context, 75),
            width: width(context, 75),
            color: AppColors.mainClr,
          ),
        ],
      ),
    );
  }
}
