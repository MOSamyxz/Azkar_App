part of 'sebha_cubit.dart';

sealed class SebhaState extends Equatable {
  const SebhaState();

  @override
  List<Object> get props => [];
}

final class SebhaInitial extends SebhaState {}

final class CounterIncrementStat extends SebhaState {}

final class CounterLoadStat extends SebhaState {}

final class CounterSaveStat extends SebhaState {}

final class CounterRemoveStat extends SebhaState {}

final class CounterResetStat extends SebhaState {}
