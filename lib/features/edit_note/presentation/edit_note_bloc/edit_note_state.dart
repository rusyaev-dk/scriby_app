part of 'edit_note_bloc.dart';

sealed class EditNoteState extends Equatable {}

final class EditNoteLoadingState extends EditNoteState {
  @override
  List<Object?> get props => [];
}

final class NoteEditingState extends EditNoteState {
  NoteEditingState({this.note});

  final Note? note;

  @override
  List<Object?> get props => [];
}

final class NoteSavingState extends EditNoteState {
  @override
  List<Object?> get props => [];
}

final class EditNoteFailureState extends EditNoteState {
  EditNoteFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
