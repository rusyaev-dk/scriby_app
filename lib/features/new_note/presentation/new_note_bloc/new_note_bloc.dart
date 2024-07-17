import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:scriby_app/core/domain/domain.dart';
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

      final LocalNote newLocalNote = _formatNote(event.note);
      await Future.delayed(const Duration(milliseconds: 1000));
      await _notesRepository.addNote(newLocalNote);
      emit(NewNoteInitialState());
    } catch (err, stackTrace) {
      emit(NewNoteFailureState(exception: err));
    }

    event.completer.complete();
  }

  LocalNote _formatNote(Note note) {
    String actualTitle;
    if (note.title.trim().isEmpty) {
      actualTitle = "New note";
    } else {
      actualTitle = note.title;
    }

    return LocalNote(
      Uuid.v4().toString(),
      actualTitle,
      note.dateTime,
      note.hexColor,
      note.text,
      tags: note.tags,
    );
  }
}
