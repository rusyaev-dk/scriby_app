import 'package:scriby_app/persistence/storage/realm/models/models.dart';

abstract interface class MyNotesRepositoryI {
  Future<List<LocalNote>> getAllNotes();
  Future<void> addNote(LocalNote newNote);
  Future<void> deleteNote(LocalNote noteToDelete);
  Future<void> deleteAllNotes();
}
