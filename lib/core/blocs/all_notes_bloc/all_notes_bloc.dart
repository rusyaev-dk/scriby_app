import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'all_notes_event.dart';
part 'all_notes_state.dart';

class AllNotesBloc extends Bloc<AllNotesEvent, AllNotesState> {
  AllNotesBloc({
    required INotesRepository notesRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _logger = logger,
        super(AllNotesLoadingState()) {
    on<LoadAllNotesEvent>(_onLoadNotes);
    on<DeleteNoteEvent>(_onDeleteNote);
    on<DeleteAllNotesEvent>(_onDeleteAllNotes);
    add(LoadAllNotesEvent());
  }

  final INotesRepository _notesRepository;
  final ILogger _logger;

  Future<void> _onLoadNotes(
    LoadAllNotesEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }

      //
      await Future.delayed(const Duration(milliseconds: 300));
      //
      
      final notes = await _notesRepository.getAllNotes();

      emit(AllNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(AllNotesFailureState(exception: exception));
    }
  }

  Future<void> _onDeleteNote(
    DeleteNoteEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {

      //
      await Future.delayed(const Duration(milliseconds: 300));
      //

      await _notesRepository.deleteNote(event.note);
      final remainingNotes = await _notesRepository.getAllNotes();

      final prevState = state;
      if (prevState is AllNotesLoadedState) {
        emit(prevState.copyWith(notes: remainingNotes));
      }
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(AllNotesFailureState(exception: exception));
    }

    event.completer.complete();
  }

  Future<void> _onDeleteAllNotes(
    DeleteAllNotesEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }

      //
      await Future.delayed(const Duration(milliseconds: 300));
      //

      await _notesRepository.deleteAllNotes();
      add(LoadAllNotesEvent());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(AllNotesFailureState(exception: exception));
    }
  }
}
