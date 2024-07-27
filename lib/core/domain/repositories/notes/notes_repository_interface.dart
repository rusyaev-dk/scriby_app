import 'package:scriby_app/core/domain/entity/entity.dart';

abstract interface class NotesRepositoryI {
  Future<List<Note>> getAllNotes();
  Future<void> addNote(Note newNote);
  Future<void> deleteNote(Note noteToDelete);
  Future<void> deleteAllNotes();
}
