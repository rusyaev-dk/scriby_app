import 'dart:async';

import 'package:realm/realm.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/entity/entity.dart';
import 'package:scriby_app/core/domain/repositories/repositories.dart';
import 'package:scriby_app/persistence/storage/realm/realm.dart';

class NotesRepository implements INotesRepository {
  NotesRepository({required Realm realm}) : _realm = realm {
    _notesStreamController = StreamController<NoteActivityRecord>.broadcast();
    // generateFakeNotes(30);
  }

  final Realm _realm;
  late final StreamController<NoteActivityRecord> _notesStreamController;

  @override
  Future<List<Note>> getAllNotes() async {
    final List<LocalNote> localNotes = _realm.all<LocalNote>().toList();

    return _formatNotesFromLocal(localNotes);
  }

  @override
  Future<List<Note>> getPinnedNotes() async {
    final List<LocalNote> localPinnedNotes =
        _realm.query<LocalNote>("pinned == true").toList();

    return _formatNotesFromLocal(localPinnedNotes);
  }

  @override
  Future<void> addNote(Note newNote) async {
    final localNote = newNote.toLocal();
    _realm.write(() => _realm.add(localNote));
    _notesStreamController.add((action: NoteAction.created, note: newNote));
  }

  @override
  Future<void> pinNote(Note note) async {
    final LocalNote localNote = _realm.query<LocalNote>("id == '${note.id}'").first;
    if (localNote != null) {
      _realm.write(() {
        localNote.pinned = true;
        _realm.add(localNote, update: true);
      });
      _notesStreamController.add((action: NoteAction.pinned, note: note));
    }
  }

  @override
  Future<void> unpinNote(Note note) async {
    final LocalNote localNote =
        _realm.query<LocalNote>("id == '${note.id}'").first;
    if (localNote != null) {
      _realm.write(() {
        localNote.pinned = false;
        _realm.add(localNote, update: true);
      });
      _notesStreamController.add((action: NoteAction.unpinned, note: note));
    }
  }

  @override
  Future<void> deleteNote(Note noteToDelete) async {
    final note = _realm
        .query<LocalNote>(
          "id == '${noteToDelete.id}' ",
        )
        .first;
    _realm.write(() => _realm.delete(note));
    _notesStreamController
        .add((action: NoteAction.deleted, note: noteToDelete));
  }

  @override
  Future<void> deleteAllNotes() async {
    _realm.write(() => _realm.deleteAll<LocalNote>());
    _notesStreamController.add((action: NoteAction.created, note: null));
  }

  @override
  Stream<NoteActivityRecord> notesStream() {
    return _notesStreamController.stream;
  }

  List<Note> _formatNotesFromLocal(List<LocalNote> localNotes) {
    List<Note> notes = [];

    for (int i = localNotes.length - 1; i >= 0; i--) {
      notes.add(Note.fromLocal(localNotes[i]));
    }

    return notes;
  }

  @override
  Future<void> generateFakeNotes(int quantity) async {
    for (int i = 0; i < quantity; i++) {
      await Future.delayed(const Duration(milliseconds: 300));
      final Note fakeNote = FakeNoteGenerator.createFakeNote();
      await addNote(fakeNote);
    }
  }
}
