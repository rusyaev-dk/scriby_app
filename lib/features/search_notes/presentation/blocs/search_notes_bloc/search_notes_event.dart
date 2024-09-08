part of 'search_notes_bloc.dart';

sealed class SearchNotesEvent extends Equatable {}

final class SearchNotesByQueryEvent extends SearchNotesEvent {
  SearchNotesByQueryEvent({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];
}

final class _NoteUpdatedEvent extends SearchNotesEvent {
  _NoteUpdatedEvent({required this.updatedNote});

  final Note updatedNote;

  @override
  List<Object?> get props => [updatedNote];
}

final class _NoteDeletedEvent extends SearchNotesEvent {
  _NoteDeletedEvent({required this.deletedNote});

  final Note deletedNote;

  @override
  List<Object?> get props => [deletedNote];
}

final class _AllNotesDeletedEvent extends SearchNotesEvent {
  @override
  List<Object?> get props => [];
}

final class _AllNotesFailureEvent extends SearchNotesEvent {
  _AllNotesFailureEvent({
    required this.exception,
    required this.stackTrace,
  });

  final Object exception;
  final StackTrace stackTrace;

  @override
  List<Object?> get props => [exception, stackTrace];
}
