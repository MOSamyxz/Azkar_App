import 'package:azkar/core/services/cache_helper.dart';
import 'package:azkar/core/services/local_notification_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingInitial());
  void getTime() {
    CacheHelper.sharedPreferences!.getInt('morningHour');
    CacheHelper.sharedPreferences!.getInt('morningMin');
    CacheHelper.sharedPreferences!.getInt('eveningHour');
    CacheHelper.sharedPreferences!.getInt('eveningMin');
    CacheHelper.sharedPreferences!.getInt('sleepHour');
    CacheHelper.sharedPreferences!.getInt('sleepMin');
    emit(GetTimeState());
  }

  void pikcMoriningAzkarTime(context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    CacheHelper.sharedPreferences!.setInt('morningHour', pickedTime!.hour);
    CacheHelper.sharedPreferences!.setInt('morningMin', pickedTime.minute);
    AwesomeNotificationServices().setDailyMorinigNotification();
    getTime();
    emit(PickDailyMorinigTimeState());
  }

  void pikcEveningAzkarTime(context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    CacheHelper.sharedPreferences!.setInt('eveningHour', pickedTime!.hour);
    CacheHelper.sharedPreferences!.setInt('eveningMin', pickedTime.minute);
    AwesomeNotificationServices().setDailyEveningNotification();
    getTime();
    emit(PickDailyEveningState());
  }

  void pikcSleepAzkarTime(context) async {
    TimeOfDay? pickedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
    CacheHelper.sharedPreferences!.setInt('sleepHour', pickedTime!.hour);
    CacheHelper.sharedPreferences!.setInt('sleepMin', pickedTime.minute);
    AwesomeNotificationServices().setDailySleepNotification();
    getTime();
    emit(PickDailySleepState());
  }

  void pikcHourlyDhikrTime(context) async {
    DropdownButton<int>(
        items: List.generate(60, (index) => index)
            .map((number) => DropdownMenuItem<int>(
                  child: Text('$number'),
                ))
            .toList(),
        onChanged: (value) {
          CacheHelper.sharedPreferences!.setInt('dhikrMin', value ?? 0);
          AwesomeNotificationServices().setDailySleepNotification();
          emit(PickHourlyDhikrState());
        });
  }

  String min(int minute) {
    return minute < 10 ? '0$minute' : '$minute';
  }

  String hour(int hour, int minute) {
    return hour == 0
        ? '${hour + 12}:${min(minute)} AM'
        : hour < 10
            ? '0$hour:${min(minute)} Am'
            : hour == 12
                ? '$hour:${min(minute)} PM'
                : hour > 12
                    ? '0${hour - 12}:${min(minute)} PM'
                    : '$hour:${min(minute)} AM';
  }

  void setNotifications(value) {
    CacheHelper.setBoolean(key: 'notifications', value: value);
    getNotifications();
    emit(SetNotificationsState());
  }

  void getNotifications() {
    CacheHelper.getBoolean(key: 'notifications');
    emit(GetNotificationsState());
  }
}
