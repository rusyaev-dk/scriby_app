import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/edit_note/domain/domain.dart';
import 'package:scriby_app/persistence/utils/utils.dart';

class EditStagesRepository implements IEditStagesRepository {
  final DataStack<Note> _editingNoteStack = DataStack();
  final DataStack<Note> _editingNoteTempStack = DataStack();

  @override
  Future<void> addStage(Note note) async {
    if (_editingNoteStack.isNotEmpty && note == _editingNoteStack.peek()) {
      return;
    }

    _editingNoteStack.push(note);
  }

  @override
  Future<Note> undo() async {
    final poppedStage = _editingNoteStack.pop();
    _editingNoteTempStack.push(poppedStage);
    if (_editingNoteStack.isEmpty) {
      return poppedStage;
    }
    return _editingNoteStack.peek();
  }

  @override
  Future<Note> redo() async {
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
