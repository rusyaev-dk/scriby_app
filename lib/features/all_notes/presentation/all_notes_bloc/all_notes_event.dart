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

final class _NoteUpdatedEvent extends AllNotesEvent {
  _NoteUpdatedEvent({required this.updatedNote});

  final Note updatedNote;

  @override
  List<Object?> get props => [updatedNote];
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
  List<Object?> get props => [exception, stackTrace];
}
