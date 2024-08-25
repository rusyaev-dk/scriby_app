import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return SafeArea(
      child: Container(
        color: colorScheme.background,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                PopScreenButtonCirlced(
                  diameter: 40,
                  icon: Icons.close_rounded,
                  onPressed: () => _onScreenPop(context),
                ),
                const Spacer(),
                BlocBuilder<EditNoteBloc, EditNoteState>(
                  builder: (context, state) {
                    return SaveNoteButton(
                      onPressed: () => (state is EditNoteEditingState)
                          ? _onSaveButtonPressed(context)
                          : null,
                      isSaving: state is EditNoteSavingState,
                      height: 40,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onScreenPop(BuildContext context) async {
    final stageCubitState = BlocProvider.of<EditNoteStageCubit>(context).state;
    if (stageCubitState is! EditNoteStageEditingState ||
        stageCubitState.updatedNote == null ||
        (stageCubitState.updatedNote != null &&
            stageCubitState.updatedNote == stageCubitState.initialNote)) {
      _closeKeyboardAndPop(context);
      return;
    }

    if (stageCubitState.autosavingEnabled) {
      _closeKeyboardAndPop(context);
      return;
    }

    bool shouldSave =
        await _showConfirmationDialog(context, "Save changes?", true) ?? false;
    if (!context.mounted) return;

    if (!shouldSave) {
      FocusScope.of(context).unfocus();
      await Future.delayed(const Duration(milliseconds: 200));

      if (!context.mounted) return;
      AutoRouter.of(context).maybePop();
      return;
    }

    final Completer completer = Completer();
    BlocProvider.of<EditNoteBloc>(context).add(SaveNoteEvent(
      note: stageCubitState.updatedNote!,
      completer: completer,
    ));
    await completer.future;

    if (!context.mounted) return;

    _closeKeyboardAndPop(context);
  }

  void _onSaveButtonPressed(BuildContext context) async {
    final stageCubitState = BlocProvider.of<EditNoteStageCubit>(context).state;
    if (stageCubitState is! EditNoteStageEditingState) return;

    if (stageCubitState.autosavingEnabled) {
      _closeKeyboardAndPop(context);
      return;
    }

    if (stageCubitState.updatedNote == null &&
        stageCubitState.initialNote.isEmpty()) {
      bool shouldSave =
          await _showConfirmationDialog(context, "Save empty note?") ?? false;
      if (!shouldSave) return;
    }

    if (!context.mounted) return;

    if ((stageCubitState.updatedNote == null &&
            !stageCubitState.initialNote.isEmpty()) ||
        stageCubitState.updatedNote == stageCubitState.initialNote) {
      _closeKeyboardAndPop(context);
      return;
    }

    final Completer completer = Completer();
    BlocProvider.of<EditNoteBloc>(context).add(SaveNoteEvent(
      note: stageCubitState.updatedNote ?? stageCubitState.initialNote,
      completer: completer,
    ));
    await completer.future;

    if (!context.mounted) return;

    _closeKeyboardAndPop(context);
  }

  Future<bool?> _showConfirmationDialog(
    BuildContext context,
    String title, [
    bool? withDestructiveAction,
  ]) {
    return showDialog<bool?>(
      context: context,
      builder: (context) {
        return AppAlertDialog(
          actions: [
            AppAlertDialogAction(
              onPressed: () => AutoRouter.of(context).maybePop<bool?>(true),
              child: const Text("Yes"),
            ),
            AppAlertDialogAction(
              isDefaultAction: withDestructiveAction ?? false,
              onPressed: () => AutoRouter.of(context).maybePop<bool?>(false),
              child: const Text("No"),
            ),
          ],
          title: Text(title),
        );
      },
    );
  }

  void _closeKeyboardAndPop(BuildContext context) {
    FocusScope.of(context).unfocus();
    AutoRouter.of(context).maybePop();
  }
}
