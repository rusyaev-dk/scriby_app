import 'package:realm/realm.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/features/search_notes/domain/domain.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

class SearchNotesRepository implements ISearchNotesRepository {
  SearchNotesRepository({required Realm realm}) : _realm = realm;

  final Realm _realm;

  @override
  Future<List<Note>> searchNoteByQuery(String query) async {
    List<LocalNote> foundLocalNotes = _realm.query<LocalNote>(
        "text CONTAINS[c] \$0 OR title CONTAINS[c] \$0", [query]).toList();

    return _convertNotesFromLocal(foundLocalNotes);
  }

  List<Note> _convertNotesFromLocal(List<LocalNote> localNotes) {
    List<Note> notes = [];

    for (int i = localNotes.length - 1; i >= 0; i--) {
      notes.add(Note.fromLocal(localNotes[i]));
    }

    return notes;
  }
}
