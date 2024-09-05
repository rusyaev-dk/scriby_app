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
  }) : initialNote = initialNoteToEdit ?? Note.empty();

  final Note initialNote;

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

class _EditNoteViewState extends State<EditNoteView>
    with SingleTickerProviderStateMixin {
  late final TextEditingController _titleController;
  late final TextEditingController _noteTextController;
  late final ScrollController _scrollController;
  late final AnimationController _borderRadiusAnimationController;
  late final Animation<double> _borderRadiusAnimation;

  bool _firstTitleListen = true;
  bool _firstTextListen = true;
  bool _isCircular = true;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(_animateBorderRadius);

    final bool isEmptyNote = widget.initialNote.isEmpty();

    _titleController = TextEditingController(
        text: isEmptyNote ? null : widget.initialNote.title);
    _titleController.addListener(_listenToTitleEditing);

    _noteTextController = TextEditingController(
        text: isEmptyNote ? null : widget.initialNote.text);
    _noteTextController.addListener(_listenToTextEditing);

    _borderRadiusAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 85),
    );
    _borderRadiusAnimation = Tween<double>(begin: 30, end: 0)
        .animate(_borderRadiusAnimationController);
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
      body: SafeArea(
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _borderRadiusAnimation,
                child: EditNoteContent(
                  titleController: _titleController,
                  noteTextController: _noteTextController,
                  scrollController: _scrollController,
                ),
                builder: (context, child) {
                  return AnimatedContainer(
                    duration: _borderRadiusAnimationController.duration!,
                    curve: Curves.easeOutQuart,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(_borderRadiusAnimation.value),
                        topRight: Radius.circular(_borderRadiusAnimation.value),
                      ),
                    ),
                    child: child,
                  );
                },
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: EditUtilsBar(),
            )
          ],
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

  Future<void> _animateBorderRadius() async {
    if (!_scrollController.hasClients) return;

    if (_isCircular && _scrollController.offset > 5) {
      _isCircular = false;
      await _borderRadiusAnimationController.forward();
    } else if (!_isCircular && _scrollController.offset <= 0) {
      _isCircular = true;
      await _borderRadiusAnimationController.reverse();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_animateBorderRadius);
    _scrollController.dispose();
    _titleController.removeListener(_listenToTitleEditing);
    _titleController.dispose();
    _noteTextController.removeListener(_listenToTextEditing);
    _noteTextController.dispose();
    _borderRadiusAnimationController.dispose();
    super.dispose();
  }
}

class EditNoteContent extends StatelessWidget {
  const EditNoteContent({
    super.key,
    required this.titleController,
    required this.noteTextController,
    required this.scrollController,
  });

  final TextEditingController titleController;
  final TextEditingController noteTextController;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<EditNoteBloc, EditNoteState>(
      builder: (context, state) {
        if (state is EditNoteEditingState || state is EditNoteSavingState) {
          return DisableScrollStretching(
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                const SliverToBoxAdapter(
                  child: SizedBox(height: 13),
                ),
                SliverToBoxAdapter(
                  child: TitleTextField(
                    controller: titleController,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: SizedBox(height: 15),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: MainInputTextField(
                    controller: noteTextController,
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
