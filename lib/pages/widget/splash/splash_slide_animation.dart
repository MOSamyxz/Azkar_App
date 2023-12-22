import 'package:azkar/core/constants/colors.dart';
import 'package:azkar/cubit/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

class SplashSlideAnimation extends StatelessWidget {
  const SplashSlideAnimation({
    super.key,
    required this.splash,
  });

  final SplashCubit splash;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: splash.slidingAnimation,
        builder: (context, _) {
          return SlideTransition(
            position: splash.slidingAnimation,
            child: const Text(
              'ساحة هادئة تنعش روحك وتلطف قلبك',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                  fontFamily: 'KFGQPC',
                  color: AppColors.mainClr),
            ),
          );
        });
  }
}
