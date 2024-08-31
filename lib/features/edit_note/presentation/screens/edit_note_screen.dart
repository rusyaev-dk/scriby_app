import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/edit_note/domain/domain.dart';
import 'package:scriby_app/features/edit_note/presentation/presentation.dart';
import 'package:scriby_app/features/settings/domain/domain.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage(name: "EditNoteRoute")
class EditNoteScreen extends StatelessWidget {
  EditNoteScreen({
    super.key,
    required Note? initialNoteToEdit,
    this.animationAlignment,
  }) : initialNote = initialNoteToEdit ?? Note.empty();

  final Note initialNote;
  final Alignment? animationAlignment;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<IEditStagesRepository>(
      create: (context) => EditStagesRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => EditNoteBloc(
              notesRepository: RepositoryProvider.of<INotesRepository>(context),
              generalSettingsRepository:
                  RepositoryProvider.of<IGeneralSettingsRepository>(context),
              logger: RepositoryProvider.of<ILogger>(context),
            )..add(LoadNoteToEditEvent(initialNote: initialNote)),
          ),
          BlocProvider(
            lazy: false,
            create: (context) => EditNoteStageCubit(
              notesRepository: RepositoryProvider.of<INotesRepository>(context),
              generalSettingsRepository:
                  RepositoryProvider.of<IGeneralSettingsRepository>(context),
              editStagesRepository:
                  RepositoryProvider.of<IEditStagesRepository>(context),
              logger: RepositoryProvider.of<ILogger>(context),
            )..loadNote(initialNote: initialNote),
          ),
        ],
        child: EditNoteView(
          initialNote: initialNote,
        ),
      ),
    );
  }
}

class EditNoteView extends StatefulWidget {
  const EditNoteView({
    super.key,
    required this.initialNote,
  });

  final Note initialNote;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late final TextEditingController _titleController;
  late final TextEditingController _noteTextController;

  bool _firstTitleListen = true;
  bool _firstTextListen = true;

  @override
  void initState() {
    super.initState();

    final bool isEmptyNote = widget.initialNote.isEmpty();

    _titleController = TextEditingController(
        text: isEmptyNote ? null : widget.initialNote.title);
    _noteTextController = TextEditingController(
        text: isEmptyNote ? null : widget.initialNote.text);

    _titleController.addListener(_listenToTitleEditing);
    _noteTextController.addListener(_listenToTextEditing);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: EditNoteAppBar(),
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
        ),
      ),
    );
  }

  void _listenToTitleEditing() {
    if (_firstTitleListen) {
      _firstTitleListen = false;
      return;
    }

    BlocProvider.of<EditNoteStageCubit>(context)
        .stageTitleText(_titleController.text);
  }

  void _listenToTextEditing() {
    if (_firstTextListen) {
      _firstTextListen = false;
      return;
    }

    BlocProvider.of<EditNoteStageCubit>(context)
        .stageNoteText(_noteTextController.text);
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
  })  : _titleController = titleController,
        _noteTextController = noteTextController;

  final TextEditingController _titleController;
  final TextEditingController _noteTextController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

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
