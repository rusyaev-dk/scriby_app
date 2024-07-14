import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes_repository_interface.dart';

part 'my_notes_event.dart';
part 'my_notes_state.dart';

class MyNotesBloc extends Bloc<MyNotesEvent, MyNotesState> {
  MyNotesBloc({
    required NotesRepositoryI notesRepository,
  })  : _notesRepository = notesRepository,
        super(MyNotesLoadingState()) {
    on<LoadMyNotesEvent>(_onLoadNotes);
    add(LoadMyNotesEvent());
  }

  final NotesRepositoryI _notesRepository;

  Future<void> _onLoadNotes(
    LoadMyNotesEvent event,
    Emitter<MyNotesState> emit,
  ) async {
    try {
      if (state is! MyNotesLoadingState) {
        emit(MyNotesLoadingState());
      }
   
      final localNotes = await _notesRepository.getAllNotes();
      List<Note> notes = [];
      for (var localNote in localNotes) {
        notes.add(Note.fromLocal(localNote));
      }
      emit(MyNotesLoadedState(notes: notes));
    } catch (err, stackTrace) {
      emit(MyNotesFailureState(exception: err));
    }
  }
}
