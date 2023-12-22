part of 'azkar_build_cubit.dart';

sealed class AzkarBuildState extends Equatable {
  const AzkarBuildState();

  @override
  List<Object> get props => [];
}

final class AzkarBuildInitial extends AzkarBuildState {}

final class IncrementState extends AzkarBuildState {}

final class CounterInitialState extends AzkarBuildState {}

final class PageIncrementState extends AzkarBuildState {}

final class PageChangedState extends AzkarBuildState {}
