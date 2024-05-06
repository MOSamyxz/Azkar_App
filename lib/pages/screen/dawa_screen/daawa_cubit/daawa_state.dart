part of 'daawa_cubit.dart';

sealed class DaawaState extends Equatable {
  const DaawaState();

  @override
  List<Object> get props => [];
}

final class DaawaInitial extends DaawaState {}

final class DaawaLoading extends DaawaState {}

final class DaawaSuccess extends DaawaState {}

final class DaawaFailuer extends DaawaState {}
