part of 'all_notes_bloc.dart';

sealed class AllNotesEvent extends Equatable {}

final class LoadAllNotesEvent extends AllNotesEvent {
  @override
  List<Object?> get props => [];
}

final class DeleteNoteEvent extends AllNotesEvent {
  DeleteNoteEvent({
    required this.note,
  });

  final Note note;

  @override
  List<Object?> get props => [note];
}
