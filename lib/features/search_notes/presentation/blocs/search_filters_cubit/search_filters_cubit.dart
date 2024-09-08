import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/features/search_notes/domain/domain.dart';

part 'search_filters_state.dart';

class SearchFiltersCubit extends Cubit<SearchFiltersState> {
  SearchFiltersCubit({
    required ISearchFiltersRepository searchFiltersRepository,
    required ILogger logger,
  })  : _searchFiltersRepository = searchFiltersRepository,
        _logger = logger,
        super(SearchFiltersLoadingState()) {
    _initFilters();
  }

  final ISearchFiltersRepository _searchFiltersRepository;
  final ILogger _logger;
  late SearchFilters _filters;

  Future<void> _initFilters() async {
    try {
      final filters = await _searchFiltersRepository.getFilters();
      _filters = filters;
      emit(SearchFiltersLoadedState(filters: _filters));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(SearchFiltersFailureState(exception: exception));
    }
  }

  Future<void> toggleSearchAmongPinnedFilter(bool value) async {
    try {
      await _searchFiltersRepository.toggleSearchAmongPinnedFilter(value);
      _filters = _filters.copyWith(searchAmongPinned: value);
      emit(SearchFiltersLoadedState(filters: _filters));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(SearchFiltersFailureState(exception: exception));
    }
  }
}
