import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes_repository_interface.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

part 'all_notes_event.dart';
part 'all_notes_state.dart';

class AllNotesBloc extends Bloc<AllNotesEvent, AllNotesState> {
  AllNotesBloc({
    required NotesRepositoryI notesRepository,
  })  : _notesRepository = notesRepository,
        super(AllNotesLoadingState()) {
    on<LoadAllNotesEvent>(_onLoadNotes);
    on<DeleteNoteEvent>(_onDeleteNote);
    add(LoadAllNotesEvent());
  }

  final NotesRepositoryI _notesRepository;

  Future<void> _onLoadNotes(
    LoadAllNotesEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }

      final localNotes = await _notesRepository.getAllNotes();

      ///
      await Future.delayed(const Duration(milliseconds: 300));

      ///

      List<Note> notes = [];
      for (var localNote in localNotes) {
        notes.add(Note.fromLocal(localNote));
      }
      emit(AllNotesLoadedState(notes: notes));
    } catch (err, stackTrace) {
      emit(AllNotesFailureState(exception: err));
    }
  }

  Future<void> _onDeleteNote(
    DeleteNoteEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }

      LocalNote noteToDelete = event.note.toLocal();
      await _notesRepository.deleteNote(noteToDelete);

      ///
      await Future.delayed(const Duration(milliseconds: 300));

      ///
      add(LoadAllNotesEvent());
    } catch (err, stackTrace) {
      emit(AllNotesFailureState(exception: err));
    }

    event.completer.complete();
  }
}
