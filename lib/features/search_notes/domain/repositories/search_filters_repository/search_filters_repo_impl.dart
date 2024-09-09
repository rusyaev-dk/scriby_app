import 'package:scriby_app/features/search_notes/domain/domain.dart';
import 'package:scriby_app/persistence/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchFiltersRepository implements ISearchFiltersRepository {
  SearchFiltersRepository({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<bool> toggleSearchPinnedOnlyFilter(bool value) async {
    return await _prefs.setBool(
      LocalStorageKeys.searchPinnedOnlyFilterKey,
      value,
    );
  }

  @override
  Future<void> clearFilters() async {
    await toggleSearchPinnedOnlyFilter(false);
  }

  @override
  Future<SearchFilters> getFilters() async {
    final bool searchPinnedOnlystatus = _prefs.getBool(
          LocalStorageKeys.searchPinnedOnlyFilterKey,
        ) ??
        false;

    return SearchFilters(pinnedOnly: searchPinnedOnlystatus);
  }
}
