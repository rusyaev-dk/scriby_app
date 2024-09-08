part of 'search_filters_cubit.dart';

sealed class SearchFiltersState extends Equatable {}

final class SearchFiltersLoadedState extends SearchFiltersState {
  SearchFiltersLoadedState({required this.filters});

  final SearchFilters filters;

  @override
  List<Object?> get props => [filters];
}

final class SearchFiltersLoadingState extends SearchFiltersState {
  @override
  List<Object?> get props => [];
}

final class SearchFiltersFailureState extends SearchFiltersState {
  SearchFiltersFailureState({required this.exception});

  final Object exception;

  @override
  List<Object?> get props => [exception];
}
