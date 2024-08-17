import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'search_notes_event.dart';
part 'search_notes_state.dart';

class SearchNotesBloc extends Bloc<SearchNotesEvent, SearchNotesState> {
  SearchNotesBloc() : super(SearchNotesInitialState()) {
    on<SearchNotesEvent>((event, emit) {});
  }
}
