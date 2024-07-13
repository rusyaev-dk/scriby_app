part of 'my_notes_bloc.dart';

sealed class MyNotesState extends Equatable {}

final class MyNotesLoadingState extends MyNotesState {
  @override
  List<Object?> get props => [];
}

final class MyNotesLoadedState extends MyNotesState {
  final List<Note> notes;

  MyNotesLoadedState({required this.notes});

  @override
  List<Object?> get props => [];
}

final class MyNotesFailureState extends MyNotesState {
  MyNotesFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
