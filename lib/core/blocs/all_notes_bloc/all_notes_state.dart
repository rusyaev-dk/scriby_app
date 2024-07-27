part of 'all_notes_bloc.dart';

sealed class AllNotesState extends Equatable {}

final class AllNotesLoadingState extends AllNotesState {
  @override
  List<Object?> get props => [];
}

final class AllNotesLoadedState extends AllNotesState {
  final List<Note> notes;

  AllNotesLoadedState({required this.notes});

  @override
  List<Object?> get props => [notes];
}

final class AllNotesFailureState extends AllNotesState {
  AllNotesFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
