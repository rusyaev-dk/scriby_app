import 'package:equatable/equatable.dart';

class SearchFilters extends Equatable {
  const SearchFilters({required bool searchAmongPinned})
      : _searchAmongPinned = searchAmongPinned;

  final bool _searchAmongPinned;

  SearchFilters copyWith({bool? searchAmongPinned}) {
    return SearchFilters(
      searchAmongPinned: searchAmongPinned ?? _searchAmongPinned,
    );
  }

  bool areDefault() {
    return (_searchAmongPinned == false);
  }

  bool get searchAmongPinned => _searchAmongPinned;

  @override
  List<Object?> get props => [_searchAmongPinned];
}
