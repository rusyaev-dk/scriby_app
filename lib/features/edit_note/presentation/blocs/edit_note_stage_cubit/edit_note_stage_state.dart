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
  });

  final Note? initialNote;
  final Note? updatedNote;

  EditNoteStageEditingState copyWith({
    Note? initialNote,
    Note? updatedNote,
  }) {
    return EditNoteStageEditingState(
      initialNote: initialNote ?? this.initialNote,
      updatedNote: updatedNote ?? this.updatedNote,
    );
  }

  @override
  List<Object?> get props => [initialNote, updatedNote];
}
