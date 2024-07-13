part of 'new_note_bloc.dart';

sealed class NewNoteState extends Equatable {}

final class NewNoteInitialState extends NewNoteState {
  @override
  List<Object?> get props => [];
}

final class NewNoteInProgressState extends NewNoteState {
  @override
  List<Object?> get props => [];
}

final class NewNoteSavingState extends NewNoteState {
  @override
  List<Object?> get props => [];
}

final class NewNoteFailureState extends NewNoteState {
  NewNoteFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
