part of 'edit_note_bloc.dart';

sealed class EditNoteEvent extends Equatable {}

final class LoadNoteToEditEvent extends EditNoteEvent {
  LoadNoteToEditEvent({required this.initialNote});

  final Note initialNote;

  @override
  List<Object?> get props => [initialNote];
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
