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
    return _realm.all<LocalNote>().toList();
  }

  @override
  Future<void> addNote(LocalNote newNote) async {
    _realm.write(() => _realm.add(newNote));
  }

  @override
  Future<void> deleteNote(LocalNote noteToDelete) async {
    _realm.write(() => _realm.delete<LocalNote>(noteToDelete));
  }

  @override
  Future<void> deleteAllNotes() async {
    _realm.write(() => _realm.deleteAll<LocalNote>());
  }
}
