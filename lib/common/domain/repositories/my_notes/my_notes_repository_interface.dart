import 'package:scriby_app/common/domain/repositories/my_notes/models/models.dart';

abstract interface class IMyNotesRepository {
  Future<List<Note>> getAllNotes();
  Future<void> addNote(Note newNote);
  Future<void> deleteNote(Note noteToDelete);
  Future<void> deleteAllNotes();
}
