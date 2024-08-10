import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'edit_note_stage_state.dart';

class EditNoteStageCubit extends Cubit<EditNoteStageState> {
  EditNoteStageCubit() : super(EditNoteStageInitialState());

  late final Note _initialNote;

  Future<void> loadNote({required Note? initialNote}) async {
    emit(EditNoteStageEditingState(
      initialNote: initialNote,
      updatedNote: null,
    ));
  }

  Future<void> stageTitleText(String updatedTitle) async {
    if (_initialNote.title == updatedTitle) return;

    final Note updatedNote = _initialNote.copyWith(title: updatedTitle);
    final curState = state;
    if (curState is EditNoteStageEditingState) {
      emit(curState.copyWith(updatedNote: updatedNote));
    }
  }

  Future<void> stageText(String updatedText) async {
    if (_initialNote.text == updatedText) return;

    final Note updatedNote = _initialNote.copyWith(text: updatedText);
    final curState = state;
    if (curState is EditNoteStageEditingState) {
      emit(curState.copyWith(updatedNote: updatedNote));
    }
  }
}
