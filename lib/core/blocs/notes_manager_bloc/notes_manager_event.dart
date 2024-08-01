part of 'notes_manager_bloc.dart';

sealed class NotesManagerEvent extends Equatable {}

final class DeleteNoteEvent extends NotesManagerEvent {
  DeleteNoteEvent({
    required this.note,
    required this.completer,
  });

  final Note note;
  final Completer completer;

  @override
  List<Object?> get props => [note, completer];
}

final class DeleteAllNotesEvent extends NotesManagerEvent {
  @override
  List<Object?> get props => [];
}
