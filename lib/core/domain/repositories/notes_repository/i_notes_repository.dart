import 'package:scriby_app/core/domain/entity/entity.dart';

enum NoteAction { created, updated, pinned, unpinned, deleted, deletedAll }

typedef NoteActivityRecord = ({NoteAction action, Note? note});

abstract interface class INotesRepository {
  Future<List<Note>> getAllNotes();
  Future<List<Note>> getPinnedNotes();

  Future<void> addNote(Note newNote);
  Future<bool> exists(String noteId);

  Future<void> pinNote(Note note);
  Future<void> unpinNote(Note note);

  Future<void> updateNote(Note updatedNote);

  Future<void> deleteNote(Note noteToDelete);
  Future<void> deleteAllNotes();

  Stream<NoteActivityRecord> notesStream();
  Future<void> generateFakeNotes(int quantity);
}
