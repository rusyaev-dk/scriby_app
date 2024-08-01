import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'pinned_notes_event.dart';
part 'pinned_notes_state.dart';

class PinnedNotesBloc extends Bloc<PinnedNotesEvent, PinnedNotesState> {
  PinnedNotesBloc({
    required INotesRepository notesRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _logger = logger,
        super(PinnedNotesLoadingState()) {
    on<LoadPinnedNotesEvent>(_onLoadNotes);
    on<RefreshPinnedNotesEvent>(_onRefreshNotes);
    add(LoadPinnedNotesEvent());
  }

  final INotesRepository _notesRepository;
  final ILogger _logger;

  Future<void> _onLoadNotes(
    LoadPinnedNotesEvent event,
    Emitter<PinnedNotesState> emit,
  ) async {
    try {
      if (state is! PinnedNotesLoadingState) {
        emit(PinnedNotesLoadingState());
      }

      //
      await Future.delayed(const Duration(milliseconds: 300));
      //

      final notes = await _notesRepository.getAllNotes();
      emit(PinnedNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(PinnedNotesFailureState(exception: exception));
    }
  }

  Future<void> _onRefreshNotes(
    RefreshPinnedNotesEvent event,
    Emitter<PinnedNotesState> emit,
  ) async {
    try {
      //
      await Future.delayed(const Duration(milliseconds: 300));
      //

      final notes = await _notesRepository.getAllNotes();
      final prevState = state;
      if (prevState is PinnedNotesLoadedState) {
        return emit(prevState.copyWith(notes: notes));
      }
      emit(PinnedNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(PinnedNotesFailureState(exception: exception));
    }
  }
}
