import 'package:azkar/pages/screen/splash_screen/splash_cubit/splash_cubit.dart';
import 'package:azkar/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          BlocProvider(
            create: (context) => SplashCubit()..initState(context),
            child: BlocBuilder<SplashCubit, SplashState>(
              builder: (context, state) {
                var splash = BlocProvider.of<SplashCubit>(context);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SplashFadeAnimation(splash: splash),
                    SplashSlideAnimation(splash: splash)
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
