part of 'all_notes_bloc.dart';

sealed class AllNotesEvent extends Equatable {}

final class LoadAllNotesEvent extends AllNotesEvent {
  @override
  List<Object?> get props => [];
}

final class DeleteNoteEvent extends AllNotesEvent {
  DeleteNoteEvent({
    required this.note,
    required this.completer,
  });

  final Note note;
  final Completer completer;

  @override
  List<Object?> get props => [note, completer];
}

final class DeleteAllNotesEvent extends AllNotesEvent {
  @override
  List<Object?> get props => [];
}
