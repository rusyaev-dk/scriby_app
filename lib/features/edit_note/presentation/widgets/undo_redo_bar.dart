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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomIconButton(
            onPressed: () =>
                BlocProvider.of<EditNoteStageCubit>(context).undo(),
            icon: Icons.undo_rounded,
          ),
          CustomIconButton(
            onPressed: () =>
                BlocProvider.of<EditNoteStageCubit>(context).redo(),
            icon: Icons.redo_rounded,
          ),
        ],
      ),
    );
  }
}
