import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class EditNoteAppBar extends StatelessWidget {
  const EditNoteAppBar({
    super.key,
    required this.titleController,
    required this.noteTextController,
  });

  final TextEditingController titleController;
  final TextEditingController noteTextController;

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
                  child: IconButton(
                    onPressed: () => AutoRouter.of(context).back(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: colorScheme.onBackground,
                    ),
                  ),
                ),
                const Spacer(),
                BlocBuilder<EditNoteBloc, EditNoteState>(
                  builder: (context, state) {
                    return SaveNoteButton(
                      onPressed: () => (state is NoteEditingState)
                          ? _onSaveButtonPressed(context)
                          : () {},
                      isSaving: state is NoteSavingState,
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

  void _onSaveButtonPressed(BuildContext context) async {
    final Completer completer = Completer();

    bool? shouldSave = true;

    if (noteTextController.text.trim().isEmpty) {
      shouldSave = await _showSaveEmptyNoteDialog(context);
      if (shouldSave != null && !shouldSave) {
        return;
      }
    }

    if (!context.mounted) return;

    final editNoteBloc = BlocProvider.of<EditNoteBloc>(context);
    final state = editNoteBloc.state;
    if (state is NoteEditingState && state.note != null) {
      final Note editedNote = Note(
        id: state.note!.id,
        title: titleController.text,
        date: DateTime.now(),
        hexColor: ColorFormatter.getRandomHexColor(),
        tags: const ["test_tag", "one_more_test_tag"],
        text: noteTextController.text,
        pinned: state.note!.pinned,
      );
      editNoteBloc.add(
        SaveEditedNoteEvent(
          editedNote: editedNote,
          completer: completer,
        ),
      );
    } else {
      final Note newNote = Note.create(
        title: titleController.text,
        date: DateTime.now(),
        hexColor: ColorFormatter.getRandomHexColor(),
        tags: const ["test_tag", "one_more_test_tag"],
        text: noteTextController.text,
        pinned: true,
      );
      editNoteBloc.add(
        SaveNewNoteEvent(
          newNote: newNote,
          completer: completer,
        ),
      );
    }

    await completer.future;

    if (!context.mounted) return;

    FocusScope.of(context).unfocus();
    AutoRouter.of(context).back();
  }

  Future<bool?> _showSaveEmptyNoteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AppAlertDialog(
          actions: [
            AppAlertDialogAction(
              child: const Text("Yes"),
              onPressed: () => AutoRouter.of(context).maybePop(true),
            ),
            AppAlertDialogAction(
              child: const Text("Cancel"),
              onPressed: () => AutoRouter.of(context).maybePop(false),
            ),
          ],
          title: const Text("Save empty note?"),
        );
      },
    );
  }
}
