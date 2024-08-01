import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'notes_manager_event.dart';
part 'notes_manager_state.dart';

class NotesManagerBloc extends Bloc<NotesManagerEvent, NotesManagerState> {
  NotesManagerBloc({
    required INotesRepository notesRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _logger = logger,
        super(NotesManagerInitialState()) {
    on<DeleteNoteEvent>(_onDeleteNote);
    on<DeleteAllNotesEvent>(_onDeleteAllNotes);
    // add(LoadAllNotesEvent());
  }

  final INotesRepository _notesRepository;
  final ILogger _logger;

  Future<void> _onDeleteNote(
    DeleteNoteEvent event,
    Emitter<NotesManagerState> emit,
  ) async {
    try {
      if (state is! NotesManagerLoadingState) {
        emit(NotesManagerLoadingState());
      }
      //
      await Future.delayed(const Duration(milliseconds: 300));
      //

      await _notesRepository.deleteNote(event.note);
      emit(NotesManagerInitialState());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(NotesManagerFailureState(exception: exception));
    }

    event.completer.complete();
  }

  Future<void> _onDeleteAllNotes(
    DeleteAllNotesEvent event,
    Emitter<NotesManagerState> emit,
  ) async {
    try {
      if (state is! NotesManagerLoadingState) {
        emit(NotesManagerLoadingState());
      }

      //
      await Future.delayed(const Duration(milliseconds: 300));
      //

      await _notesRepository.deleteAllNotes();
      emit(NotesManagerInitialState());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(NotesManagerFailureState(exception: exception));
    }
  }
}
