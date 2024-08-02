part of 'pinned_notes_bloc.dart';

sealed class PinnedNotesEvent extends Equatable {}

final class LoadPinnedNotesEvent extends PinnedNotesEvent {
  @override
  List<Object?> get props => [];
}

final class _NoteAddedEvent extends PinnedNotesEvent {
  _NoteAddedEvent({required this.addedNote});

  final Note addedNote;

  @override
  List<Object?> get props => [addedNote];
}

final class _NoteEditedEvent extends PinnedNotesEvent {
  _NoteEditedEvent({required this.editedNote});

  final Note editedNote;

  @override
  List<Object?> get props => [editedNote];
}

final class _NoteDeletedEvent extends PinnedNotesEvent {
  _NoteDeletedEvent({required this.deletedNote});

  final Note deletedNote;

  @override
  List<Object?> get props => [deletedNote];
}

final class _AllPinnedNotesDeletedEvent extends PinnedNotesEvent {
  @override
  List<Object?> get props => [];
}

final class _PinnedNotesFailureEvent extends PinnedNotesEvent {
  _PinnedNotesFailureEvent({
    required this.exception,
    required this.stackTrace,
  });

  final Object exception;
  final StackTrace stackTrace;

  @override
  List<Object?> get props => [];
}
