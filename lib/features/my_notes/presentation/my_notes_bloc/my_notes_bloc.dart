import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/core/domain/repositories/my_notes/my_notes_repository_interface.dart';

part 'my_notes_event.dart';
part 'my_notes_state.dart';

class MyNotesBloc extends Bloc<MyNotesEvent, MyNotesState> {
  MyNotesBloc({
    required MyNotesRepositoryI myNotesRepository,
  })  : _myNotesRepository = myNotesRepository,
        super(MyNotesLoadingState()) {
    on<LoadMyNotesEvent>(_onLoadNotes);
  }

  final MyNotesRepositoryI _myNotesRepository;

  Future<void> _onLoadNotes(
    LoadMyNotesEvent event,
    Emitter<MyNotesState> emit,
  ) async {
    if (state is! MyNotesLoadingState) {
      emit(MyNotesLoadingState());
    }

    final localNotes = await _myNotesRepository.getAllNotes();
    List<Note> notes = [];
    for (var localNote in localNotes) {
      notes.add(Note.fromLocal(localNote));
    }
    emit(MyNotesLoadedState(notes: notes));
  }
}
