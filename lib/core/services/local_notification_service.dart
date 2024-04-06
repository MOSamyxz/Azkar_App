import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:azkar/core/services/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class AwesomeNotificationServices {
  Future<void> initializeNotifications() async {
    AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'daily_morning_notification',
          channelName: 'Daily Morinng Notification',
          channelDescription: 'Daily Morinng notification channel',
          defaultColor: Colors.teal,
          ledColor: Colors.teal,
          playSound: true,
          importance: NotificationImportance.Max,
        ),
        NotificationChannel(
          channelKey: 'daily_evening_notification',
          channelName: 'Daily Evening Notification',
          channelDescription: 'Daily Evening notification channel',
          defaultColor: Colors.teal,
          ledColor: Colors.teal,
          playSound: true,
          importance: NotificationImportance.Max,
        ),
        NotificationChannel(
          channelKey: 'daily_sleep_notification',
          channelName: 'Daily Sleep Notification',
          channelDescription: 'Daily Sleep notification channel',
          defaultColor: Colors.teal,
          ledColor: Colors.teal,
          playSound: true,
          importance: NotificationImportance.Max,
        ),
        NotificationChannel(
          channelKey: 'hourly_dhikr_notification',
          channelName: 'Hourly Dhikr Notification',
          channelDescription: 'Hourly Dhikr notification channel',
          defaultColor: Colors.teal,
          ledColor: Colors.teal,
          playSound: true,
          importance: NotificationImportance.Max,
        ),
        NotificationChannel(
            channelKey: 'hourly_salah_channel',
            channelName: 'Hourly Salah notifications',
            channelDescription: 'Hourly Salah notification channel',
            playSound: true,
            importance: NotificationImportance.Max,
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white),
        NotificationChannel(
            channelKey: 'hourly_channel',
            channelName: 'Hourly notifications',
            channelDescription: 'Hourly notification channel',
            playSound: true,
            importance: NotificationImportance.Max,
            defaultColor: const Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
    );
  }

  void init() {
    setDailyMorinigNotification();
    setDailyEveningNotification();
    setDailySleepNotification();
  }

  Future<void> initHourly() async {
    await setHourlyDhikrNotification();
    await setHourlySalahNotification();
  }

  void cancleAll() {
    AwesomeNotifications().cancelSchedule(0);
    AwesomeNotifications().cancelSchedule(1);
    AwesomeNotifications().cancelSchedule(2);
  }

  Future<void> setDailyMorinigNotification() async {
    tz.initializeTimeZones();
    final String currentTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: 'daily_morning_notification',
        title: 'أذكار الصباح',
        body:
            'الَّذِينَ آمَنُواْ وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللّهِ أَلاَ بِذِكْرِ اللّهِ تَطْمَئِنُّ الْقُلُوبُ',
      ),
      schedule: NotificationCalendar(
          timeZone: currentTimeZone,
          hour: CacheHelper.sharedPreferences!.getInt('morningHour') ?? 7,
          minute: CacheHelper.sharedPreferences!.getInt('morningMin') ?? 0,
          second: 0,
          repeats: true,
          allowWhileIdle: true),
    );
  }

  Future<void> setDailyEveningNotification() async {
    tz.initializeTimeZones();
    final String currentTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'daily_evening_notification',
        title: 'أذكار المساء',
        body:
            'الَّذِينَ آمَنُواْ وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللّهِ أَلاَ بِذِكْرِ اللّهِ تَطْمَئِنُّ الْقُلُوبُ',
      ),
      schedule: NotificationCalendar(
          timeZone: currentTimeZone,
          hour: CacheHelper.sharedPreferences!.getInt('eveningHour') ?? 18,
          minute: CacheHelper.sharedPreferences!.getInt('eveningMin') ?? 0,
          second: 0,
          repeats: true,
          allowWhileIdle: true),
    );
  }

  Future<void> setDailySleepNotification() async {
    tz.initializeTimeZones();
    final String currentTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 2,
        channelKey: 'daily_sleep_notification',
        title: 'أذكار المساء',
        body:
            'الَّذِينَ آمَنُواْ وَتَطْمَئِنُّ قُلُوبُهُم بِذِكْرِ اللّهِ أَلاَ بِذِكْرِ اللّهِ تَطْمَئِنُّ الْقُلُوبُ',
      ),
      schedule: NotificationCalendar(
          timeZone: currentTimeZone,
          hour: CacheHelper.sharedPreferences!.getInt('sleepHour') ?? 18,
          minute: CacheHelper.sharedPreferences!.getInt('sleepMin') ?? 0,
          second: 0,
          repeats: true,
          allowWhileIdle: true),
    );
  }

  Future<void> setHourlyDhikrNotification() async {
    tz.initializeTimeZones();
    final String currentTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 3,
          channelKey: 'hourly_dhikr_notification',
          title: 'سيد الاستغفار',
          body:
              'اللهم أنت ربي لا إله إلا أنت خلقتني وأنا عبدك وأنا على عهدك ووعدك ما استطعت، أعوذ بك من شر ما صنعت، أبوء لك بنعمتك علي وأبوء لك بذنبي فاغفر لي فإنه لا يغفر الذنوب إلا أنت',
          notificationLayout: NotificationLayout.BigText),
      schedule: NotificationCalendar(
          timeZone: currentTimeZone,
          minute: 0,
          second: 0,
          repeats: true,
          allowWhileIdle: true),
    );
  }

  Future<void> setHourlySalahNotification() async {
    tz.initializeTimeZones();
    final String currentTimeZone =
        await AwesomeNotifications().getLocalTimeZoneIdentifier();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 4,
          channelKey: 'hourly_salah_channel',
          title: 'صلِّ على الحبيب',
          body:
              'إِنَّ اللَّهَ وَمَلائِكَتَهُ يُصَلُّونَ عَلَى النَّبِيِّ يَا أَيُّهَا الَّذِينَ آمَنُوا صَلُّوا عَلَيْهِ وَسَلِّمُوا تَسْلِيمًا',
          notificationLayout: NotificationLayout.BigText),
      schedule: NotificationCalendar(
          timeZone: currentTimeZone,
          minute: 30,
          second: 0,
          repeats: true,
          allowWhileIdle: true),
    );
  }

}
