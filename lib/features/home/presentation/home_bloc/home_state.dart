part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

final class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

final class HomeLoadedState extends HomeState {
  final List<Note> notes;

  HomeLoadedState({required this.notes});

  @override
  List<Object?> get props => [];
}

final class HomeFailureState extends HomeState {
  HomeFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
