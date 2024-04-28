import 'package:azkar/core/constants/theme.dart';
import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/core/services/local_notification_service.dart';
import 'package:azkar/cubit/azkar_cubit/azkar_cubit.dart';
import 'package:azkar/cubit/theme_cubit/cubit.dart';
import 'package:azkar/cubit/theme_cubit/state.dart';
import 'package:azkar/pages/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await AwesomeNotificationServices().initializeNotifications();
  await AwesomeNotificationServices().initHourly();
  initializeDateFormatting("ar_SA", null);
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp(
    this.isDark, {
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit()..changeAppMode(fromShared: isDark),
        ),
        BlocProvider(
          create: (context) => AzkarCubit()..initial(),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: BlocProvider.of<ThemeCubit>(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            home: const SplashView(),
          );
        },
      ),
    );
  }
}
