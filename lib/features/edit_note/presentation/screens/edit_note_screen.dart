import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage(name: "EditNoteRoute")
class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({
    super.key,
    this.editingNote,
    this.animationAlignment,
  });

  final Note? editingNote;
  final Alignment? animationAlignment;

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteTextController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.editingNote?.title);
    _noteTextController = TextEditingController(text: widget.editingNote?.text);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 60),
        child: EditNoteAppBar(
          onSaveButtonPressed: _onSaveButtonPressed,
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BlocBuilder<EditNoteBloc, EditNoteState>(
          builder: (context, state) {
            if (state is EditNoteEditingState || state is EditNoteSavingState) {
              return DisableScrollStretching(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 15),
                    ),
                    SliverToBoxAdapter(
                      child: TitleTextField(
                        controller: _titleController,
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: 6),
                    ),
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: MainInputTextField(
                        controller: _noteTextController,
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(
              child: CircularProgressIndicator(
                color: colorScheme.onBackground,
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _noteTextController.dispose();
    super.dispose();
  }

  void _onSaveButtonPressed(BuildContext context) async {
    final Completer completer = Completer();

    bool? shouldSave = true;

    if (_noteTextController.text.trim().isEmpty) {
      shouldSave = await _showSaveEmptyNoteDialog(context);
      if (shouldSave != null && !shouldSave) {
        return;
      }
    }

    final Note? editingNote = widget.editingNote;
    final Note note = Note.create(
      id: editingNote?.id,
      title: _titleController.text,
      date: DateTime.now(),
      hexColor: editingNote?.hexColor ?? ColorFormatter.getRandomHexColor(),
      tags: editingNote?.tags ?? const ["test_tag", "one_more_test_tag"],
      text: _noteTextController.text,
      pinned: editingNote?.pinned ?? true,
    );

    if (!context.mounted) return;

    BlocProvider.of<EditNoteBloc>(context).add(SaveNoteEvent(
      note: note,
      completer: completer,
    ));

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
