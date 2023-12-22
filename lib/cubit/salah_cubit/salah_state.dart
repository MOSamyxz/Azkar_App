part of 'salah_cubit.dart';

sealed class SalahState {}

final class SalahInitial extends SalahState {}

final class SalahTimeFailState extends SalahState {}

final class SalahTimeLoadingState extends SalahState {}

final class NoSalahTimeState extends SalahState {}

final class SalahTimeSuccesState extends SalahState {
  List<SalahTimeEntity> salahTimeEntity;

  SalahTimeSuccesState(this.salahTimeEntity);
}
