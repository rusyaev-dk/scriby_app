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
    required this.note,
    required this.completer,
  });

  final Note note;
  final Completer completer;

  @override
  List<Object?> get props => [note, completer];
}

final class SaveEditedNoteEvent extends EditNoteEvent {
  SaveEditedNoteEvent({
    required this.note,
    required this.completer,
  });

  final Note note;
  final Completer completer;

  @override
  List<Object?> get props => [note, completer];
}
