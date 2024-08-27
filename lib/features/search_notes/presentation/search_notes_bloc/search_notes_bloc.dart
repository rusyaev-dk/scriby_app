import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/search_notes/domain/domain.dart';
import 'package:stream_transform/stream_transform.dart';

part 'search_notes_event.dart';
part 'search_notes_state.dart';

EventTransformer<E> debounceDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.debounce(duration), mapper);
  };
}

class SearchNotesBloc extends Bloc<SearchNotesEvent, SearchNotesState> {
  SearchNotesBloc({
    required ISearchNotesRepository searchNotesRepository,
    required INotesRepository notesRepository,
    required ILogger logger,
  })  : _searchNotesRepository = searchNotesRepository,
        _notesRepository = notesRepository,
        _logger = logger,
        super(SearchNotesInitialState()) {
    on<SearchNotesByQueryEvent>(
      _onSearchNotes,
      transformer: debounceDroppable(
        const Duration(milliseconds: 200),
      ),
    );
    on<_NoteUpdatedEvent>(_onNoteUpdated);
    on<_NoteDeletedEvent>(_onNoteDeleted);
    _subscribeToNotesStream();
  }

  final ISearchNotesRepository _searchNotesRepository;
  final INotesRepository _notesRepository;
  final ILogger _logger;
  late final StreamSubscription<NoteActivityRecord>? _notesSubscription;

  void _subscribeToNotesStream() {
    _notesSubscription = _notesRepository.notesStream().listen(
      (record) {
        switch (record.action) {
          case NoteAction.created:
            return;
          case NoteAction.updated:
            add(_NoteUpdatedEvent(updatedNote: record.note!));
            return;
          case NoteAction.deleted:
            add(_NoteDeletedEvent(deletedNote: record.note!));
            return;
          case NoteAction.deletedAll:
            add(_AllNotesDeletedEvent());
            return;
          default:
            return;
        }
      },
      onError: (exception, stackTrace) {
        _logger.exception(exception, stackTrace);
        add(_AllNotesFailureEvent(
          exception: exception,
          stackTrace: stackTrace,
        ));
      },
    );
  }

  Future<void> _onSearchNotes(
    SearchNotesByQueryEvent event,
    Emitter<SearchNotesState> emit,
  ) async {
    try {
      final validatedQuery = _validateQuery(event.query);
      if (validatedQuery.isEmpty) {
        return emit(SearchNotesInitialState());
      }

      if (state is! SearchNotesLoadingState) {
        emit(SearchNotesLoadingState());
      }

      final List<Note> foundNotes =
          await _searchNotesRepository.searchNoteByQuery(validatedQuery);
      emit(SearchNotesLoadedState(notes: foundNotes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(SearchNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteUpdated(
    _NoteUpdatedEvent event,
    Emitter<SearchNotesState> emit,
  ) async {
    try {
      final curState = state;
      if (curState is SearchNotesLoadedState) {
        emit(SearchNotesLoadingState());

        List<Note> updatedNotes = List.from(curState.notes);
        updatedNotes.removeWhere(
          (Note note) => note.id == event.updatedNote.id,
        );
        updatedNotes = [event.updatedNote] + updatedNotes;

        return emit(SearchNotesLoadedState(notes: updatedNotes));
      }

      // add(LoadAllNotesEvent());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(SearchNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteDeleted(
    _NoteDeletedEvent event,
    Emitter<SearchNotesState> emit,
  ) async {
    try {
      final curState = state;
      if (curState is SearchNotesLoadedState) {
        List<Note> updatedNotes = List.from(curState.notes);
        updatedNotes.removeWhere(
          (Note note) => note.id == event.deletedNote.id,
        );

        return emit(SearchNotesLoadedState(notes: updatedNotes));
      }

      // add(LoadAllNotesEvent());
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(SearchNotesFailureState(exception: exception));
    }
  }

  String _validateQuery(String query) {
    return query.trim();
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    return super.close();
  }
}
