part of 'edit_note_stage_cubit.dart';

sealed class EditNoteStageState extends Equatable {}

final class EditNoteStageInitialState extends EditNoteStageState {
  @override
  List<Object?> get props => [];
}

final class EditNoteStageEditingState extends EditNoteStageState {
  EditNoteStageEditingState({
    required this.initialNote,
    required this.updatedNote,
    required this.undoAvailable,
    required this.redoAvailable,
    required this.autosavingEnabled,
  });

  final Note initialNote;
  final Note? updatedNote;
  final bool undoAvailable;
  final bool redoAvailable;
  final bool autosavingEnabled;

  EditNoteStageEditingState copyWith({
    Note? initialNote,
    Note? updatedNote,
    bool? undoAvailable,
    bool? redoAvailable,
  }) {
    return EditNoteStageEditingState(
      initialNote: initialNote ?? this.initialNote,
      updatedNote: updatedNote ?? this.updatedNote,
      undoAvailable: undoAvailable ?? this.undoAvailable,
      redoAvailable: redoAvailable ?? this.redoAvailable,
      autosavingEnabled: autosavingEnabled,
    );
  }

  @override
  List<Object?> get props => [
        initialNote,
        updatedNote,
        autosavingEnabled,
        undoAvailable,
        redoAvailable,
      ];
}
