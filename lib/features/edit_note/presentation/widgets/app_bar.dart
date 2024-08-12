import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({
    super.key,
    required this.onSaveButtonPressed,
  });

  final void Function(BuildContext context) onSaveButtonPressed;

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
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: PopScreenButton(
                    icon: Icons.close_rounded,
                    onPressed: () => _onScreenPopButtonPressed(context),
                  ),
                ),
                const Spacer(),
                BlocBuilder<EditNoteBloc, EditNoteState>(
                  builder: (context, state) {
                    return SaveNoteButton(
                      onPressed: () => (state is EditNoteEditingState)
                          ? onSaveButtonPressed(context)
                          : () {},
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

  Future<void> _onScreenPopButtonPressed(BuildContext context) async {
    final stageCubitState = BlocProvider.of<EditNoteStageCubit>(context).state;
    if (stageCubitState is! EditNoteStageEditingState ||
        stageCubitState.updatedNote == null ||
        (stageCubitState.updatedNote != null &&
            stageCubitState.updatedNote == stageCubitState.initialNote)) {
      FocusScope.of(context).unfocus();
      AutoRouter.of(context).back();
      return;
    }

    bool shouldSave = await _showSaveChangesDialog(context) ?? false;
    if (!context.mounted) return;

    if (!shouldSave) {
      FocusScope.of(context).unfocus();
      await Future.delayed(const Duration(milliseconds: 200));
      
      if (!context.mounted) return;
      AutoRouter.of(context).back();
      return;
    }

    final Completer completer = Completer();
    BlocProvider.of<EditNoteBloc>(context).add(SaveNoteEvent(
      note: stageCubitState.updatedNote!,
      completer: completer,
    ));
    await completer.future;

    if (!context.mounted) return;

    FocusScope.of(context).unfocus();
    AutoRouter.of(context).back();
  }

  Future<bool?> _showSaveChangesDialog(BuildContext context) {
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
              isDestructiveAction: true,
              onPressed: () => AutoRouter.of(context).maybePop<bool?>(false),
              child: const Text("No"),
            ),
          ],
          title: const Text("Save changes?"),
        );
      },
    );
  }
}
