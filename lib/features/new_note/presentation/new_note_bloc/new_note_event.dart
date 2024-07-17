part of 'new_note_bloc.dart';

sealed class NewNoteEvent extends Equatable {}

final class SaveNewNoteEvent extends NewNoteEvent {
  SaveNewNoteEvent({
    required this.note,
    required this.completer,
  });

  final Note note;
  final Completer completer;

  @override
  List<Object?> get props => [note, completer];
}
