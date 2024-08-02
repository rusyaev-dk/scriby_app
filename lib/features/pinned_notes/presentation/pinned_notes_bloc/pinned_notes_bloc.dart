import 'dart:async';

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
    on<_NoteAddedEvent>(_onNoteAdded);
    on<_NoteEditedEvent>(_onNoteEdited);
    on<_NoteDeletedEvent>(_onNoteDeleted);
    add(LoadPinnedNotesEvent());
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
            if (!record.note!.pinned) return;
            add(_NoteAddedEvent(addedNote: record.note!));
            return;
          case NoteAction.edited:
            if (!record.note!.pinned) return;
            add(_NoteEditedEvent(editedNote: record.note!));
            return;
          case NoteAction.deleted:
            if (!record.note!.pinned) return;
            add(_NoteDeletedEvent(deletedNote: record.note!));
            return;
          case NoteAction.deletedAll:
            add(_AllPinnedNotesDeletedEvent());
            return;
        }
      },
      onError: (exception, stackTrace) {
        _logger.exception(exception, stackTrace);
        add(_PinnedNotesFailureEvent(
          exception: exception,
          stackTrace: stackTrace,
        ));
      },
    );
  }

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

      final notes = await _notesRepository.getPinnedNotes();
      emit(PinnedNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(PinnedNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteAdded(
    _NoteAddedEvent event,
    Emitter<PinnedNotesState> emit,
  ) async {
    try {
      //
      await Future.delayed(const Duration(milliseconds: 700));
      //

      final prevState = state;
      if (prevState is PinnedNotesLoadedState) {
        final updatedNotes = [event.addedNote] + prevState.notes;
        return emit(prevState.copyWith(notes: updatedNotes));
      }

      if (state is! PinnedNotesLoadingState) {
        emit(PinnedNotesLoadingState());
      }
      final notes = await _notesRepository.getPinnedNotes();
      emit(PinnedNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(PinnedNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteEdited(
    _NoteEditedEvent event,
    Emitter<PinnedNotesState> emit,
  ) async {
    try {
      //
      await Future.delayed(const Duration(milliseconds: 700));
      //

      final prevState = state;
      if (prevState is PinnedNotesLoadedState) {
        List<Note> updatedNotes = List.from(prevState.notes);
        updatedNotes.removeWhere(
          (Note note) => note.id == event.editedNote.id,
        );
        updatedNotes = [event.editedNote] + updatedNotes;

        return emit(prevState.copyWith(notes: updatedNotes));
      }

      if (state is! PinnedNotesLoadingState) {
        emit(PinnedNotesLoadingState());
      }
      final notes = await _notesRepository.getPinnedNotes();
      emit(PinnedNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(PinnedNotesFailureState(exception: exception));
    }
  }

  Future<void> _onNoteDeleted(
    _NoteDeletedEvent event,
    Emitter<PinnedNotesState> emit,
  ) async {
    try {
      //
      await Future.delayed(const Duration(milliseconds: 700));
      //

      final prevState = state;
      if (prevState is PinnedNotesLoadedState) {
        List<Note> updatedNotes = List.from(prevState.notes);
        updatedNotes.removeWhere(
          (Note note) => note.id == event.deletedNote.id,
        );

        return emit(prevState.copyWith(notes: updatedNotes));
      }

      if (state is! PinnedNotesLoadingState) {
        emit(PinnedNotesLoadingState());
      }
      final notes = await _notesRepository.getPinnedNotes();
      emit(PinnedNotesLoadedState(notes: notes));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
      emit(PinnedNotesFailureState(exception: exception));
    }
  }

  @override
  Future<void> close() {
    _notesSubscription?.cancel();
    return super.close();
  }
}
