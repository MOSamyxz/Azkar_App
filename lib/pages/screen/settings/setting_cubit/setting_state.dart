part of 'setting_cubit.dart';

sealed class SettingState extends Equatable {
  const SettingState();

  @override
  List<Object> get props => [];
}

final class SettingInitial extends SettingState {}

final class GetTimeState extends SettingState {}

final class PickDailyMorinigTimeState extends SettingState {}

final class PickDailyEveningState extends SettingState {}

final class PickDailySleepState extends SettingState {}

final class PickHourlyDhikrState extends SettingState {}

final class SetNotificationsState extends SettingState {}

final class GetNotificationsState extends SettingState {}
