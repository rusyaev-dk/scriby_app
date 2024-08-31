import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class UndoRedoBar extends StatelessWidget {
  const UndoRedoBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: BlocBuilder<EditNoteStageCubit, EditNoteStageState>(
        builder: (context, state) {
          bool undoAvailable;
          bool redoAvailable;

          if (state is EditNoteStageEditingState) {
            undoAvailable = state.undoAvailable;
            redoAvailable = state.redoAvailable;
          } else {
            undoAvailable = false;
            redoAvailable = false;
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomIconButton(
                onPressed: () => undoAvailable ? _undo(context) : null,
                icon: Icons.undo_rounded,
                iconColor: undoAvailable
                    ? colorScheme.onBackground
                    : colorScheme.surfaceBright,
              ),
              CustomIconButton(
                onPressed: () => redoAvailable ? _redo(context) : null,
                icon: Icons.redo_rounded,
                iconColor: redoAvailable
                    ? colorScheme.onBackground
                    : colorScheme.surfaceBright,
              ),
            ],
          );
        },
      ),
    );
  }

  void _undo(BuildContext context) {
    BlocProvider.of<EditNoteStageCubit>(context).undo();
  }

  void _redo(BuildContext context) {
    BlocProvider.of<EditNoteStageCubit>(context).redo();
  }
}
