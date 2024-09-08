import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/search_notes/domain/domain.dart';

abstract interface class ISearchNotesRepository {
  Future<List<Note>> searchNotesByQuery(
    String query, {
    required SearchFilters filters,
  });
}
