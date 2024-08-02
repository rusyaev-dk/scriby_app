import 'package:scriby_app/core/domain/entity/entity.dart';

enum NoteAction { created, edited, deleted, deletedAll }

typedef NoteActivityRecord = ({NoteAction action, Note? note});

abstract interface class INotesRepository {
  Future<List<Note>> getAllNotes();
  Future<List<Note>> getPinnedNotes();
  Future<void> addNote(Note newNote);
  Future<void> deleteNote(Note noteToDelete);
  Future<void> deleteAllNotes();
  Stream<NoteActivityRecord> notesStream();
  Future<void> generateFakeNotes(int quantity);
}
