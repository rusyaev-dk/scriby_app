import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/formatters/formatters.dart';
import 'package:scriby_app/core/domain/domain.dart';

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
      //
      await Future.delayed(const Duration(milliseconds: 1000));
      //

      final Note formattedNote = _formatNote(event.note);

      await _notesRepository.addNote(formattedNote);
      emit(NewNoteInitialState());
    } catch (err, stackTrace) {
      emit(NewNoteFailureState(exception: err));
    }

    event.completer.complete();
  }

  Note _formatNote(Note note) {
    String formattedTitle;
    if (note.title.trim().isEmpty) {
      formattedTitle = "New note";
    } else {
      formattedTitle = TextFormatter.removeLeadingEmptyLines(note.title);
    }

    return Note.create(
      title: formattedTitle,
      date: note.date,
      hexColor: note.hexColor,
      tags: note.tags,
      text: note.text,
    );
  }
}
