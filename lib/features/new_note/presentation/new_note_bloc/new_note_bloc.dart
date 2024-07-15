import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

part 'new_note_event.dart';
part 'new_note_state.dart';

class NewNoteBloc extends Bloc<NewNoteEvent, NewNoteState> {
  NewNoteBloc({
    required NotesRepositoryI notesRepository,
  })  : _notesRepository = notesRepository,
        super(NewNoteInitialState()) {
    on<SaveNewNoteEvent>(_onSaveNewNote);
  }

  final NotesRepositoryI _notesRepository;

  Future<void> _onSaveNewNote(
    SaveNewNoteEvent event,
    Emitter<NewNoteState> emit,
  ) async {
    try {
      if (state is! NewNoteSavingState) {
        emit(NewNoteSavingState());
      }

      final LocalNote newLocalNote = _formatNote(
        title: event.title,
        dateTime: event.dateTime,
        colorHex: event.colorHex,
        tags: event.tags,
        text: event.text,
      );
      await Future.delayed(const Duration(milliseconds: 1000));
      await _notesRepository.addNote(newLocalNote);
      emit(NewNoteInitialState());
    } catch (err, stackTrace) {
      emit(NewNoteFailureState(exception: err));
    }

    event.completer.complete();
  }

  LocalNote _formatNote({
    required String title,
    required DateTime dateTime,
    required String colorHex,
    required List<String> tags,
    required String text,
  }) {
    if (title.trim().isEmpty) {
      title = "New note";
    }

    return LocalNote(
      Uuid.v4().toString(),
      title,
      dateTime,
      colorHex,
      text,
      tags: tags,
    );
  }

  
}
