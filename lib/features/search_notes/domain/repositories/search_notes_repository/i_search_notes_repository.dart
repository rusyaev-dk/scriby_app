import 'package:scriby_app/core/domain/domain.dart';

abstract interface class ISearchNotesRepository {
  Future<List<Note>> searchNoteByQuery(String query);
}
