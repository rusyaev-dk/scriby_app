part of 'edit_note_bloc.dart';

sealed class EditNoteEvent extends Equatable {}

final class PrepareToEditNoteEvent extends EditNoteEvent {
  PrepareToEditNoteEvent({required this.note});

  final Note note;

  @override
  List<Object?> get props => [note];
}

final class SaveNoteEvent extends EditNoteEvent {
  SaveNoteEvent({
    required this.note,
    required this.completer,
  });

  final Note note;
  final Completer completer;

  @override
  List<Object?> get props => [note, completer];
}
