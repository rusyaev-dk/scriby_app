import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/edit_note/domain/domain.dart';
import 'package:scriby_app/features/settings/domain/domain.dart';

part 'edit_note_stage_state.dart';

class EditNoteStageCubit extends Cubit<EditNoteStageState> {
  EditNoteStageCubit({
    required INotesRepository notesRepository,
    required IGeneralSettingsRepository generalSettingsRepository,
    required IEditStagesRepository editStagesRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _generalSettingsRepository = generalSettingsRepository,
        _editStagesRepository = editStagesRepository,
        _logger = logger,
        super(EditNoteStageInitialState());

  final INotesRepository _notesRepository;
  final IGeneralSettingsRepository _generalSettingsRepository;
  final IEditStagesRepository _editStagesRepository;
  final ILogger _logger;

  Future<void> loadNote({required Note initialNote}) async {
    try {
      final bool autosavingEnabled =
          await _generalSettingsRepository.getAutosaveStatus();
      emit(EditNoteStageEditingState(
        initialNote: initialNote,
        updatedNote: null,
        autosavingEnabled: autosavingEnabled,
        undoAvailable: false,
        redoAvailable: false,
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
      final Note updatedNote = noteToCopyFrom.copyWith(
        title: updatedTitle.trim().isEmpty ? "Untitled" : updatedTitle,
      );

      if (curState.autosavingEnabled) {
        await _notesRepository.updateNote(
          updatedNote.copyWith(
            date: DateTime.now(),
          ),
        );
      }

      _editStagesRepository.addStage(updatedNote);
      emit(curState.copyWith(
        updatedNote: updatedNote,
        undoAvailable: await _editStagesRepository.isUndoAvailable(),
        redoAvailable: await _editStagesRepository.isRedoAvailable(),
      ));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> stageNoteText(String updatedNoteText) async {
    try {
      final curState = state;
      if (curState is! EditNoteStageEditingState) return;

      final Note noteToCopyFrom = curState.updatedNote ?? curState.initialNote;
      final Note updatedNote = noteToCopyFrom.copyWith(
        text: updatedNoteText,
      );

      if (curState.autosavingEnabled) {
        await _notesRepository.updateNote(
          updatedNote.copyWith(
            date: DateTime.now(),
          ),
        );
      }

      _editStagesRepository.addStage(updatedNote);
      emit(curState.copyWith(
        updatedNote: updatedNote,
        undoAvailable: await _editStagesRepository.isUndoAvailable(),
        redoAvailable: await _editStagesRepository.isRedoAvailable(),
      ));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> undo() async {
    try {
      final curState = state;
      if (curState is! EditNoteStageEditingState) return;

      final Note updatedNote = await _editStagesRepository.undo();
      emit(curState.copyWith(
        updatedNote: updatedNote,
        undoAvailable: await _editStagesRepository.isUndoAvailable(),
        redoAvailable: await _editStagesRepository.isRedoAvailable(),
      ));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> redo() async {
    try {
      final curState = state;
      if (curState is! EditNoteStageEditingState) return;

      final Note updatedNote = await _editStagesRepository.redo();
      emit(curState.copyWith(
        updatedNote: updatedNote,
        undoAvailable: await _editStagesRepository.isUndoAvailable(),
        redoAvailable: await _editStagesRepository.isRedoAvailable(),
      ));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  @override
  Future<void> close() {
    _editStagesRepository.clear();
    return super.close();
  }
}
