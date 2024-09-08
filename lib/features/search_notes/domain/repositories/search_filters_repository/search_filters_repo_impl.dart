import 'package:scriby_app/features/search_notes/domain/domain.dart';
import 'package:scriby_app/persistence/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchFiltersRepository implements ISearchFiltersRepository {
  SearchFiltersRepository({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<bool> toggleSearchAmongPinnedFilter(bool value) async {
    return await _prefs.setBool(
      LocalStorageKeys.searchAmongPinnedFilterKey,
      value,
    );
  }

  @override
  Future<void> clearFilters() async {
    await toggleSearchAmongPinnedFilter(false);
  }

  @override
  Future<SearchFilters> getFilters() async {
    final bool searchAmongPinnedstatus = _prefs.getBool(
          LocalStorageKeys.searchAmongPinnedFilterKey,
        ) ??
        false;

    return SearchFilters(searchAmongPinned: searchAmongPinnedstatus);
  }
}
