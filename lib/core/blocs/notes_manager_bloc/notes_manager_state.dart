part of 'notes_manager_bloc.dart';

sealed class NotesManagerState extends Equatable {}

final class NotesManagerInitialState extends NotesManagerState {
  @override
  List<Object?> get props => [];
}

final class NotesManagerLoadingState extends NotesManagerState {
  @override
  List<Object?> get props => [];
}

final class NotesManagerLoadedState extends NotesManagerState {
  @override
  List<Object?> get props => [];
}

final class NotesManagerFailureState extends NotesManagerState {
  NotesManagerFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
