import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/settings/domain/domain.dart';

part 'edit_note_event.dart';
part 'edit_note_state.dart';

class EditNoteBloc extends Bloc<EditNoteEvent, EditNoteState> {
  EditNoteBloc({
    required INotesRepository notesRepository,
    required IGeneralSettingsRepository generalSettingsRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _generalSettingsRepository = generalSettingsRepository,
        _logger = logger,
        super(EditNoteEditingState()) {
    on<LoadNoteToEditEvent>(_onLoadNoteToEdit);
    on<SaveNoteEvent>(_onSaveNote);
  }

  final INotesRepository _notesRepository;
  final IGeneralSettingsRepository _generalSettingsRepository;
  final ILogger _logger;

  Future<void> _onLoadNoteToEdit(
    LoadNoteToEditEvent event,
    Emitter<EditNoteState> emit,
  ) async {
    try {
      if (state is! EditNoteLoadingState) {
        emit(EditNoteLoadingState());
      }

      final bool autosaveEnabled =
          await _generalSettingsRepository.getAutosaveStatus();

      final bool exists = await _notesRepository.exists(event.initialNote.id);

      // TODO: compute in an Isolate
      if (autosaveEnabled && !exists) {
        Future.delayed(
          const Duration(milliseconds: 600),
          () async {
            await _notesRepository
                .addNote(event.initialNote.copyWith(title: "Untitled"));
          },
        );
      }

      return emit(EditNoteEditingState(note: event.initialNote));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(EditNoteFailureState(exception: exception));
    }
  }

  Future<void> _onSaveNote(
    SaveNoteEvent event,
    Emitter<EditNoteState> emit,
  ) async {
    try {
      if (state is! EditNoteSavingState) {
        emit(EditNoteSavingState());
      }

      final Note formattedNote = _formatNote(event.note);
      await _notesRepository
          .updateNote(formattedNote.copyWith(date: DateTime.now()));

      //
      await Future.delayed(const Duration(milliseconds: 500));
      //

      emit(EditNoteEditingState());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(EditNoteFailureState(exception: exception));
    }

    event.completer.complete();
  }

  Note _formatNote(Note note) {
    String formattedTitle;
    if (note.title.trim().isEmpty) {
      formattedTitle = "Untitled";
    } else {
      formattedTitle = TextFormatter.removeLeadingEmptyLines(note.title);
    }

    return Note(
      id: note.id,
      title: formattedTitle,
      date: note.date,
      hexColor: note.hexColor,
      tags: note.tags,
      text: note.text,
      pinned: note.pinned,
    );
  }
}
