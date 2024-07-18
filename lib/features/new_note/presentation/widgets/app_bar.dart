import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/new_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NewNoteAppBar extends StatelessWidget {
  const NewNoteAppBar({
    super.key,
    required this.isSaving,
    required this.titleController,
    required this.noteTextController,
  });

  final bool isSaving;
  final TextEditingController titleController;
  final TextEditingController noteTextController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return SliverAppBar(
      forceElevated: false,
      scrolledUnderElevation: 0,
      floating: true,
      pinned: true,
      backgroundColor: colorScheme.background,
      foregroundColor: colorScheme.onBackground,
      iconTheme: IconThemeData(color: colorScheme.onBackground),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SaveNoteButton(
            onPressed: () => _onSaveButtonPressed(context),
            isSaving: isSaving,
          ),
        ),
      ],
    );
  }

  void _onSaveButtonPressed(BuildContext context) async {
    final Completer completer = Completer();

    bool? shouldSave = true;

    if (noteTextController.text.trim().isEmpty) {
      shouldSave = await _showSavingEmptyNoteDialog(context);
      if (!shouldSave!) {
        return;
      }
    }

    final Note newNote = Note.create(
      title: titleController.text,
      dateTime: DateTime.now(),
      hexColor: ColorFormatter.getRandomHexColor(),
      tags: const ["test_tag", "one_more_test_tag"],
      text: noteTextController.text,
    );
    
    if (!context.mounted) return;

    BlocProvider.of<NewNoteBloc>(context).add(
      SaveNewNoteEvent(
        note: newNote,
        completer: completer,
      ),
    );

    await completer.future;

    if (!context.mounted) return;

    FocusScope.of(context).unfocus();
    AutoRouter.of(context).back();
  }

  Future<bool?> _showSavingEmptyNoteDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            TextButton(
              onPressed: () => AutoRouter.of(context).maybePop(true),
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () => AutoRouter.of(context).maybePop(false),
              child: const Text("Cancel"),
            ),
          ],
          content: const Text("Save empty note?"),
        );
      },
    );
  }
}
