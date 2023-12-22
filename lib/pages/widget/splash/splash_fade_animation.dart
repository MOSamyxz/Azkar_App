import 'package:azkar/core/constants/images.dart';
import 'package:azkar/core/constants/size.dart';
import 'package:azkar/cubit/splash_cubit/splash_cubit.dart';
import 'package:flutter/material.dart';

class SplashFadeAnimation extends StatelessWidget {
  const SplashFadeAnimation({
    super.key,
    required this.splash,
  });

  final SplashCubit splash;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: splash.fadeAnimation,
      builder: (context, _) {
        return FadeTransition(
            opacity: splash.fadeAnimation,
            child: Image.asset(
              AppImages.logo,
              height: height(context, 150),
            ));
      },
    );
  }
}
