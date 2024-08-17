part of 'search_notes_bloc.dart';

final class SearchNotesEvent extends Equatable {
  const SearchNotesEvent({required this.query});

  final String query;

  @override
  List<Object?> get props => [query];
}
