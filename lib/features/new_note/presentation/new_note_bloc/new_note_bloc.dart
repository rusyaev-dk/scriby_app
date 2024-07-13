import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:realm/realm.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes.dart';
import 'package:scriby_app/persistence/storage/realm/models/models.dart';

part 'new_note_event.dart';
part 'new_note_state.dart';

class NewNoteBloc extends Bloc<NewNoteEvent, NewNoteState> {
  NewNoteBloc({required NotesRepositoryI notesRepository})
      : _notesRepository = notesRepository,
        super(NewNoteInitialState()) {
    on<SaveNoteLocallyEvent>(_onSaveNewNote);
  }

  final NotesRepositoryI _notesRepository;

  Future<void> _onSaveNewNote(
    SaveNoteLocallyEvent event,
    Emitter<NewNoteState> emit,
  ) async {
    if (state is! NewNoteSavingState) {
      emit(NewNoteSavingState());
    }

    try {
      final LocalNote newLocalNote = LocalNote(
        Uuid.v4().toString(),
        event.title,
        event.dateTime,
        event.text,
        tags: event.tags,
      );

      await _notesRepository.addNote(newLocalNote);
      emit(NewNoteInitialState());
    } catch (err, stackTrace) {
      emit(NewNoteFailureState(exception: err));
    }

    event.completer.complete();
  }
}
