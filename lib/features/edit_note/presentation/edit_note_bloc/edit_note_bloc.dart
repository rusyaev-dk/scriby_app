import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'edit_note_event.dart';
part 'edit_note_state.dart';

class EditNoteBloc extends Bloc<EditNoteEvent, EditNoteState> {
  EditNoteBloc({
    required INotesRepository notesRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _logger = logger,
        super(NoteEditingState()) {
    on<PrepareToEditNoteEvent>(_onPrepareToEditNote);
    on<SaveNewNoteEvent>(_onSaveNewNote);
    on<SaveEditedNoteEvent>(_onSaveEditedNote);
  }

  final INotesRepository _notesRepository;
  final ILogger _logger;

  Future<void> _onPrepareToEditNote(
    PrepareToEditNoteEvent event,
    Emitter<EditNoteState> emit,
  ) async {
    try {
      if (state is! EditNoteLoadingState) {
        emit(EditNoteLoadingState());
      }
      //
      // await Future.delayed(const Duration(milliseconds: 4000));
      //
      return emit(NoteEditingState(note: event.note));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(EditNoteFailureState(exception: exception));
    }
  }

  Future<void> _onSaveEditedNote(
    SaveEditedNoteEvent event,
    Emitter<EditNoteState> emit,
  ) async {
    try {
      if (state is! NoteSavingState) {
        emit(NoteSavingState());
      }

      final Note formattedNote = _formatNote(event.editedNote);
      await _notesRepository.updateNote(formattedNote);

      //
      await Future.delayed(const Duration(milliseconds: 1000));
      //

      emit(NoteEditingState());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(EditNoteFailureState(exception: exception));
    }

     event.completer.complete();
  }

  Future<void> _onSaveNewNote(
    SaveNewNoteEvent event,
    Emitter<EditNoteState> emit,
  ) async {
    try {
      if (state is! NoteSavingState) {
        emit(NoteSavingState());
      }

      //
      await Future.delayed(const Duration(milliseconds: 1000));
      //

      final Note formattedNote = _formatNote(event.newNote);

      await _notesRepository.addNote(formattedNote);

      emit(NoteEditingState());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(EditNoteFailureState(exception: exception));
    }

    event.completer.complete();
  }

  Note _formatNote(Note note) {
    String formattedTitle;
    if (note.title.trim().isEmpty) {
      formattedTitle = "Empty note";
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
