import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/settings/domain/domain.dart';

part 'edit_note_stage_state.dart';

class EditNoteStageCubit extends Cubit<EditNoteStageState> {
  EditNoteStageCubit({
    required INotesRepository notesRepository,
    required IGeneralSettingsRepository generalSettingsRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _generalSettingsRepository = generalSettingsRepository,
        _logger = logger,
        super(EditNoteStageInitialState());

  final INotesRepository _notesRepository;
  final IGeneralSettingsRepository _generalSettingsRepository;
  final ILogger _logger;

  Future<void> loadNote({required Note initialNote}) async {
    try {
      final bool autosavingEnabled =
          await _generalSettingsRepository.getAutosaveStatus();
      emit(EditNoteStageEditingState(
        initialNote: initialNote,
        updatedNote: null,
        autosavingEnabled: autosavingEnabled,
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
        date: DateTime.now(),
      );

      if (curState.autosavingEnabled) {
        await _notesRepository.updateNote(updatedNote);
      }
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
      final Note updatedNote = noteToCopyFrom.copyWith(
        text: updatedNoteText,
        date: DateTime.now(),
      );

      if (curState.autosavingEnabled) {
        await _notesRepository.updateNote(updatedNote);
      }
      emit(curState.copyWith(updatedNote: updatedNote));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> undoLastAction() async {
    try {
      print("undo pressed");
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> redoLastAction() async {
    try {
      print("redo pressed");
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }
}
