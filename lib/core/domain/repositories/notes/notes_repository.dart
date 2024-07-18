import 'package:realm/realm.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

class NotesRepository implements NotesRepositoryI {
  NotesRepository({required Realm realm}) : _realm = realm {
    // deleteAllNotes();
  }

  final Realm _realm;

  @override
  Future<List<LocalNote>> getAllNotes() async {
    return _realm.all<LocalNote>().toList().reversed.toList();
  }

  @override
  Future<void> addNote(LocalNote newNote) async {
    _realm.write(() => _realm.add(newNote));
  }

  @override
  Future<void> deleteNote(LocalNote noteToDelete) async {
    final note = _realm
        .query<LocalNote>(
          "id == '${noteToDelete.id}' ",
        )
        .first;
    _realm.write(() => _realm.delete(note));
  }

  @override
  Future<void> deleteAllNotes() async {
    _realm.write(() => _realm.deleteAll<LocalNote>());
  }
}
