import 'package:scriby_app/features/edit_note/domain/domain.dart';
import 'package:scriby_app/persistence/utils/utils.dart';

class EditStagesRepository implements IEditStagesRepository {
  final DataStack<EditActionRecord> _editingNoteStack = DataStack();
  final DataStack<EditActionRecord> _editingNoteTempStack = DataStack();

  @override
  Future<void> addStage(EditActionRecord editActionRecord) async {
    if (_editingNoteStack.isNotEmpty &&
        editActionRecord == _editingNoteStack.peek()) {
      return;
    }

    _editingNoteStack.push(editActionRecord);
  }

  @override
  Future<EditActionRecord> undo() async {
    final poppedStage = _editingNoteStack.pop();
    _editingNoteTempStack.push(poppedStage);
    if (_editingNoteStack.isEmpty) {
      return poppedStage;
    }
    return _editingNoteStack.peek();
  }

  @override
  Future<EditActionRecord> redo() async {
    final poppedTempStage = _editingNoteTempStack.pop();
    _editingNoteStack.push(poppedTempStage);
    return poppedTempStage;
  }

  @override
  Future<bool> isUndoAvailable() async {
    return _editingNoteStack.isNotEmpty;
  }

  @override
  Future<bool> isRedoAvailable() async {
    return _editingNoteTempStack.isNotEmpty;
  }

  @override
  Future<void> clear() async {
    _editingNoteStack.clear();
    _editingNoteTempStack.clear();
  }
}
