import 'package:scriby_app/core/domain/domain.dart';

abstract interface class IEditStagesRepository {
  Future<void> addStage(Note note);
  Future<Note> undo();
  Future<Note> redo();
  Future<bool> isUndoAvailable();
  Future<bool> isRedoAvailable();
  Future<void> clear();
}
