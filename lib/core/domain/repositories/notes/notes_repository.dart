import 'package:realm/realm.dart';
import 'package:scriby_app/core/domain/entity/entity.dart';
import 'package:scriby_app/core/domain/repositories/repositories.dart';
import 'package:scriby_app/persistence/storage/realm/realm.dart';

class NotesRepository implements NotesRepositoryI {
  NotesRepository({required Realm realm}) : _realm = realm {
    // deleteAllNotes();
  }

  final Realm _realm;

  @override
  Future<List<Note>> getAllNotes() async {
    final List<LocalNote> localNotes = _realm.all<LocalNote>().toList();
    List<Note> notes = [];

    for (int i = localNotes.length - 1; i >= 0; i--) {
      notes.add(Note.fromLocal(localNotes[i]));
    }

    return notes;
  }

  @override
  Future<void> addNote(Note newNote) async {
    final localNote = newNote.toLocal();
    _realm.write(() => _realm.add(localNote));
  }

  @override
  Future<void> deleteNote(Note noteToDelete) async {
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
