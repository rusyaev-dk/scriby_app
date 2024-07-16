import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes_repository_interface.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required NotesRepositoryI notesRepository,
  })  : _notesRepository = notesRepository,
        super(HomeLoadingState()) {
    on<LoadMyNotesEvent>(_onLoadNotes);
    add(LoadMyNotesEvent());
  }

  final NotesRepositoryI _notesRepository;

  Future<void> _onLoadNotes(
    LoadMyNotesEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      if (state is! HomeLoadingState) {
        emit(HomeLoadingState());
      }

      final localNotes = await _notesRepository.getAllNotes();
      List<Note> notes = [];
      for (var localNote in localNotes) {
        notes.add(Note.fromLocal(localNote));
      }
      emit(HomeLoadedState(notes: notes));
    } catch (err, stackTrace) {
      emit(HomeFailureState(exception: err));
    }
  }
}
