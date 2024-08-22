import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'edit_note_stage_state.dart';

class EditNoteStageCubit extends Cubit<EditNoteStageState> {
  EditNoteStageCubit({
    required INotesRepository notesRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _logger = logger,
        super(EditNoteStageInitialState());

  final INotesRepository _notesRepository;
  final ILogger _logger;

  Future<void> loadNote({required Note initialNote}) async {
    try {
      emit(EditNoteStageEditingState(
        initialNote: initialNote,
        updatedNote: null,
      ));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> stageTitleText(String updatedTitle) async {
    try {
      final curState = state;
      if (curState is! EditNoteStageEditingState) return;

      final Note noteToCopyFrom = curState.updatedNote ?? curState.initialNote;
      final Note updatedNote = noteToCopyFrom.copyWith(title: updatedTitle);

      await _notesRepository.updateNote(updatedNote);
      emit(curState.copyWith(updatedNote: updatedNote));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> stageNoteText(String updatedNoteText) async {
    try {
      final curState = state;
      if (curState is! EditNoteStageEditingState) return;

      final Note noteToCopyFrom = curState.updatedNote ?? curState.initialNote;
      final Note updatedNote = noteToCopyFrom.copyWith(text: updatedNoteText);

      await _notesRepository.updateNote(updatedNote);
      emit(curState.copyWith(updatedNote: updatedNote));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }
}
