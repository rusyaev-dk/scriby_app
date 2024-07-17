import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes_repository_interface.dart';

part 'all_notes_event.dart';
part 'all_notes_state.dart';

class AllNotesBloc extends Bloc<AllNotesEvent, AllNotesState> {
  AllNotesBloc({
    required NotesRepositoryI notesRepository,
  })  : _notesRepository = notesRepository,
        super(AllNotesLoadingState()) {
    on<LoadAllNotesEvent>(_onLoadNotes);
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
      await Future.delayed(Duration(milliseconds: 500));
      List<Note> notes = [];
      for (var localNote in localNotes) {
        notes.add(Note.fromLocal(localNote));
      }
      emit(AllNotesLoadedState(notes: notes));
    } catch (err, stackTrace) {
      emit(AllNotesFailureState(exception: err));
    }
  }
}
