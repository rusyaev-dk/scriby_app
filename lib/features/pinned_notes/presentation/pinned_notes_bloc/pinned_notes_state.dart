part of 'pinned_notes_bloc.dart';

sealed class PinnedNotesState extends Equatable {}

final class PinnedNotesLoadingState extends PinnedNotesState {
  @override
  List<Object?> get props => [];
}

final class PinnedNotesLoadedState extends PinnedNotesState {
  PinnedNotesLoadedState({required this.notes});

  final List<Note> notes;

  PinnedNotesLoadedState copyWith({
    List<Note>? notes,
  }) {
    return PinnedNotesLoadedState(notes: notes ?? this.notes);
  }

  @override
  List<Object?> get props => [notes];
}

final class PinnedNotesFailureState extends PinnedNotesState {
  PinnedNotesFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
