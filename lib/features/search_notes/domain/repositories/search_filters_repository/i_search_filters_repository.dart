import 'package:scriby_app/features/search_notes/domain/domain.dart';

abstract interface class ISearchFiltersRepository {
  Future<bool> toggleSearchAmongPinnedFilter(bool value);

  Future<SearchFilters> getFilters();
  Future<void> clearFilters();
}
