part of 'moshaf_cubit.dart';

sealed class MoshafState extends Equatable {
  const MoshafState();

  @override
  List<Object> get props => [];
}

final class MoshafInitial extends MoshafState {}

final class PageLoadStat extends MoshafState {}

final class PageSaveStat extends MoshafState {}

final class PageRemoveStat extends MoshafState {}

final class HPageLoadStat extends MoshafState {}

final class HPageSaveStat extends MoshafState {}

final class HPageRemoveStat extends MoshafState {}
