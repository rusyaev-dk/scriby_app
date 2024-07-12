import 'package:realm/realm.dart';
import 'package:scriby_app/common/domain/repositories/my_notes/my_notes.dart';

class MyNotesRepository implements IMyNotesRepository {
  MyNotesRepository({required Realm realm}) : _realm = realm;

  final Realm _realm;

  @override
  Future<List<Note>> getAllNotes() async {
    return _realm.all<Note>().toList();
  }

  @override
  Future<void> addNote(Note newNote) async {
    _realm.write(() => _realm.add(newNote));
  }

  @override
  Future<void> deleteNote(Note noteToDelete) async {
    _realm.write(() => _realm.delete<Note>(noteToDelete));
  }

  @override
  Future<void> deleteAllNotes() async {
    _realm.write(() => _realm.deleteAll<Note>());
  }
}
