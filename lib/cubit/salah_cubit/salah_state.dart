part of 'salah_cubit.dart';

sealed class SalahState {}

final class SalahInitial extends SalahState {}

final class SalahTimeFailState extends SalahState {}

final class SalahTimeLoadingState extends SalahState {}

final class NoInternetState extends SalahState {}

final class InternetState extends SalahState {}

final class SalahSaveState extends SalahState {}

final class SalahTimeSuccesLocalState extends SalahState {
  List<SalahTimeModel> salahList;

  SalahTimeSuccesLocalState(this.salahList);
}

final class SalahTimeSuccesRemoteState extends SalahState {
  SalahTimeModel salahList;

  SalahTimeSuccesRemoteState(this.salahList);
}
