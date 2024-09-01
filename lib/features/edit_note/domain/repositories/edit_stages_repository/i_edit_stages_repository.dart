enum EditAction {
  title,
  color,
  tags,
  noteText,
  pinned,
}

typedef EditActionRecord = ({EditAction action, dynamic data});

abstract interface class IEditStagesRepository {
  Future<void> addStage(EditActionRecord editActionRecord);
  Future<EditActionRecord?> undo();
  Future<EditActionRecord> redo();
  Future<bool> isUndoAvailable();
  Future<bool> isRedoAvailable();
  Future<void> clear();
}
