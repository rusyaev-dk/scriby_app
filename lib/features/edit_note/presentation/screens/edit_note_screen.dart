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
    this.initialNote,
    this.animationAlignment,
  });

  final Note? initialNote;
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
    _titleController = TextEditingController(text: widget.initialNote?.title);
    _noteTextController = TextEditingController(text: widget.initialNote?.text);

    _titleController.addListener(_listenToTitleEditing);
    _noteTextController.addListener(_listenToTextEditing);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = EditNoteBloc(
              notesRepository: context.read<INotesRepository>(),
              logger: context.read<ILogger>(),
            );
            if (widget.initialNote != null) {
              bloc.add(
                  PrepareToEditNoteEvent(initialNote: widget.initialNote!));
            }
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) => EditNoteStageCubit(
            logger: context.read<ILogger>(),
          )..loadNote(initialNote: widget.initialNote),
        ),
      ],
      child: Scaffold(
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
          child: EditNoteContent(
            titleController: _titleController,
            noteTextController: _noteTextController,
            colorScheme: colorScheme,
          ),
        ),
      ),
    );
  }

  void _listenToTitleEditing() {
    BlocProvider.of<EditNoteStageCubit>(context)
        .stageTitleText(_titleController.text);
  }

  void _listenToTextEditing() {
    BlocProvider.of<EditNoteStageCubit>(context)
        .stageNoteText(_noteTextController.text);
  }

  void _onSaveButtonPressed(BuildContext context) async {
    final stageCubitState = BlocProvider.of<EditNoteStageCubit>(context).state;
    if (stageCubitState is! EditNoteStageEditingState) return;

    if (_noteTextController.text.trim().isEmpty &&
        _titleController.text.trim().isEmpty) {
      bool shouldSave = await _showSaveEmptyNoteDialog(context) ?? false;
      if (!shouldSave) return;
    }

    if (!context.mounted) return;

    if (stageCubitState.updatedNote == stageCubitState.initialNote) {
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

  Future<bool?> _showSaveEmptyNoteDialog(BuildContext context) {
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
              onPressed: () => AutoRouter.of(context).maybePop<bool?>(false),
              child: const Text("No"),
            ),
          ],
          title: const Text("Save empty note?"),
        );
      },
    );
  }

  void _closeKeyboardAndPop(BuildContext context) {
    FocusScope.of(context).unfocus();
    AutoRouter.of(context).maybePop();
  }

  @override
  void dispose() {
    _titleController.removeListener(_listenToTitleEditing);
    _titleController.dispose();
    _noteTextController.removeListener(_listenToTextEditing);
    _noteTextController.dispose();
    super.dispose();
  }
}

class EditNoteContent extends StatelessWidget {
  const EditNoteContent({
    super.key,
    required TextEditingController titleController,
    required TextEditingController noteTextController,
    required this.colorScheme,
  })  : _titleController = titleController,
        _noteTextController = noteTextController;

  final TextEditingController _titleController;
  final TextEditingController _noteTextController;
  final AppColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteBloc, EditNoteState>(
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
                  child: SizedBox(height: 15),
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
    );
  }
}
