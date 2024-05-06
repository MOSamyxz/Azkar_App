import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/core/services/local_notification_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:azkar/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await AwesomeNotificationServices().initializeNotifications();
  await AwesomeNotificationServices().initHourly();
  initializeDateFormatting("ar_SA", null);
  bool? isDark = CacheHelper.getBoolean(key: 'isDark');
  runApp(MyApp(isDark));
}
