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
    required ILogger logger,
  })  : _searchNotesRepository = searchNotesRepository,
        _logger = logger,
        super(SearchNotesInitialState()) {
    on<SearchNotesEvent>(
      _onSearchNotes,
      transformer: debounceDroppable(
        const Duration(milliseconds: 200),
      ),
    );
  }

  final ISearchNotesRepository _searchNotesRepository;
  final ILogger _logger;

  Future<void> _onSearchNotes(
    SearchNotesEvent event,
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
      emit(SearchNotesLoadedState(foundNotes: foundNotes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(SearchNotesFailureState(exception));
    }
  }

  String _validateQuery(String query) {
    return query.trim();
  }
}
