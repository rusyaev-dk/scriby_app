part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {}

final class LoadMyNotesEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
