import 'package:azkar/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class CountDownToSalah extends StatelessWidget {
  const CountDownToSalah({
    super.key,
    required this.dur,
  });

  final Duration dur;

  @override
  Widget build(BuildContext context) {
    return TimerCountdown(
      hoursDescription: 'ساعة',
      minutesDescription: 'دقيقة',
      secondsDescription: 'ثانية',
      timeTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          fontFamily: 'Gamila',
          color: AppColors.mainClr),
      descriptionTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          fontFamily: 'Gamila',
          color: AppColors.mainClr),
      colonsTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 12,
          fontFamily: 'Gamila',
          color: AppColors.mainClr),
      format: CountDownTimerFormat.hoursMinutesSeconds,
      endTime: DateTime.now().add(dur),
      onEnd: () {
        print("Timer finished");
      },
    );
  }
}
