part of 'all_notes_bloc.dart';

sealed class AllNotesEvent extends Equatable {}

final class LoadAllNotesEvent extends AllNotesEvent {
  @override
  List<Object?> get props => [];
}

final class _NoteAddedEvent extends AllNotesEvent {
  _NoteAddedEvent({required this.addedNote});

  final Note addedNote;

  @override
  List<Object?> get props => [addedNote];
}

final class _NoteEditedEvent extends AllNotesEvent {
  _NoteEditedEvent({required this.editedNote});

  final Note editedNote;

  @override
  List<Object?> get props => [editedNote];
}

final class _NoteDeletedEvent extends AllNotesEvent {
  _NoteDeletedEvent({required this.deletedNote});

  final Note deletedNote;

  @override
  List<Object?> get props => [deletedNote];
}

final class _AllNotesDeletedEvent extends AllNotesEvent {
  @override
  List<Object?> get props => [];
}

final class _AllNotesFailureEvent extends AllNotesEvent {
  _AllNotesFailureEvent({
    required this.exception,
    required this.stackTrace,
  });
  
  final Object exception;
  final StackTrace stackTrace;

  @override
  List<Object?> get props => [];
}
