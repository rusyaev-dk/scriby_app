part of 'edit_note_bloc.dart';

sealed class EditNoteEvent extends Equatable {}

final class PrepareToEditNoteEvent extends EditNoteEvent {
  PrepareToEditNoteEvent({required this.note});

  final Note note;

  @override
  List<Object?> get props => [note];
}

final class SaveNewNoteEvent extends EditNoteEvent {
  SaveNewNoteEvent({
    required this.newNote,
    required this.completer,
  });

  final Note newNote;
  final Completer completer;

  @override
  List<Object?> get props => [newNote, completer];
}

final class SaveEditedNoteEvent extends EditNoteEvent {
  SaveEditedNoteEvent({
    required this.editedNote,
    required this.completer,
  });

  final Note editedNote;
  final Completer completer;

  @override
  List<Object?> get props => [editedNote, completer];
}
