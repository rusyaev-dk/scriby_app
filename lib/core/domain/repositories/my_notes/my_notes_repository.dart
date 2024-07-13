import 'package:realm/realm.dart';
import 'package:scriby_app/core/domain/repositories/my_notes/my_notes.dart';

class MyNotesRepository implements MyNotesRepositoryI {
  MyNotesRepository({required Realm realm}) : _realm = realm;

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