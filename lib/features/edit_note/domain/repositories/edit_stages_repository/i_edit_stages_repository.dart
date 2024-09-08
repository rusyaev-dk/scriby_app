import 'package:scriby_app/features/edit_note/domain/domain.dart';

abstract interface class IEditStagesRepository {
  Future<void> addStage(EditActionRecord editActionRecord);
  Future<EditActionRecord?> undo();
  Future<EditActionRecord> redo();
  Future<bool> isUndoAvailable();
  Future<bool> isRedoAvailable();
  Future<void> clear();
}
