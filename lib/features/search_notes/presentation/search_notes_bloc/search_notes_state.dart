part of 'search_notes_bloc.dart';

sealed class SearchNotesState extends Equatable {}

final class SearchNotesInitialState extends SearchNotesState {
  @override
  List<Object?> get props => [];
}

final class SearchNotesLoadingState extends SearchNotesState {
  @override
  List<Object?> get props => [];
}

final class SearchNotesLoadedState extends SearchNotesState {
  SearchNotesLoadedState({required this.foundNotes});

  final List<Note> foundNotes;

  @override
  List<Object?> get props => [foundNotes];
}

final class SearchNotesFailureState extends SearchNotesState {
  SearchNotesFailureState(this.exception);

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
