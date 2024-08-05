import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'all_notes_event.dart';
part 'all_notes_state.dart';

class AllNotesBloc extends Bloc<AllNotesEvent, AllNotesState> {
  AllNotesBloc({
    required INotesRepository notesRepository,
    required ILogger logger,
  })  : _notesRepository = notesRepository,
        _logger = logger,
        super(AllNotesLoadingState()) {
    on<LoadAllNotesEvent>(_onLoadNotes);
    on<_NoteAddedEvent>(_onNoteAdded);
    on<_NoteEditedEvent>(_onNoteEdited);
    on<_NoteDeletedEvent>(_onNoteDeleted);
    add(LoadAllNotesEvent());
    _subscribeToNotesStream();
  }

  final INotesRepository _notesRepository;
  final ILogger _logger;
  late final StreamSubscription<NoteActivityRecord>? _notesSubscription;

  void _subscribeToNotesStream() {
    _notesSubscription = _notesRepository.notesStream().listen(
      (record) {
        switch (record.action) {
          case NoteAction.created:
            add(_NoteAddedEvent(addedNote: record.note!));
            return;
          case NoteAction.edited:
            add(_NoteEditedEvent(editedNote: record.note!));
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

  Future<void> _onLoadNotes(
    LoadAllNotesEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }

      //
      await Future.delayed(const Duration(milliseconds: 700));
      //

      final notes = await _notesRepository.getAllNotes();
      emit(AllNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(AllNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteAdded(
    _NoteAddedEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      //
      await Future.delayed(const Duration(milliseconds: 700));
      //

      final prevState = state;
      if (prevState is AllNotesLoadedState) {
        final updatedNotes = [event.addedNote] + prevState.notes;
        return emit(prevState.copyWith(notes: updatedNotes));
      }

      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }
      final notes = await _notesRepository.getAllNotes();
      emit(AllNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(AllNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteEdited(
    _NoteEditedEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      //
      await Future.delayed(const Duration(milliseconds: 700));
      //

      final prevState = state;
      if (prevState is AllNotesLoadedState) {
        List<Note> updatedNotes = List.from(prevState.notes);
        updatedNotes.removeWhere(
          (Note note) => note.id == event.editedNote.id,
        );
        updatedNotes = [event.editedNote] + updatedNotes;

        return emit(prevState.copyWith(notes: updatedNotes));
      }

      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }
      final notes = await _notesRepository.getAllNotes();
      emit(AllNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(AllNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteDeleted(
    _NoteDeletedEvent event,
    Emitter<AllNotesState> emit,
  ) async {
    try {
      //
      await Future.delayed(const Duration(milliseconds: 700));
      //

      final prevState = state;
      if (prevState is AllNotesLoadedState) {
        List<Note> updatedNotes = List.from(prevState.notes);
        updatedNotes.removeWhere(
          (Note note) => note.id == event.deletedNote.id,
        );

        return emit(prevState.copyWith(notes: updatedNotes));
      }

      if (state is! AllNotesLoadingState) {
        emit(AllNotesLoadingState());
      }
      final notes = await _notesRepository.getAllNotes();
      emit(AllNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(AllNotesFailureState(exception: exception));
    }
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    return super.close();
  }
}
