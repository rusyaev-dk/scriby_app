import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/search_notes/domain/domain.dart';
import 'package:scriby_app/features/search_notes/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage(name: "SearchNotesShellRoute")
class SearchNotesSheelScreen extends AutoRouter {
  const SearchNotesSheelScreen({super.key});
}

@RoutePage(name: "SearchNotesRoute")
class SearchNotesScreen extends StatefulWidget {
  const SearchNotesScreen({super.key});

  @override
  State<SearchNotesScreen> createState() => _SearchNotesScreenState();
}

class _SearchNotesScreenState extends State<SearchNotesScreen> {
  late final TextEditingController _searchTextController;

  @override
  void initState() {
    super.initState();
    _searchTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BlocProvider(
      create: (context) => SearchNotesBloc(
        searchNotesRepository: context.read<ISearchNotesRepository>(),
        notesRepository: context.read<INotesRepository>(),
        logger: context.read<ILogger>(),
      ),
      child: Scaffold(
        backgroundColor: colorScheme.background,
        appBar: const PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: SearchNotesAppBar(),
        ),
        body: SafeArea(
          bottom: true,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: SearchBodyContent(),
                ),
                SearchBottomBar(
                  searchTextController: _searchTextController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchTextController.dispose();
    super.dispose();
  }
}

class SearchBodyContent extends StatelessWidget {
  const SearchBodyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchNotesBloc, SearchNotesState>(
      builder: (context, state) {
        if (state is SearchNotesInitialState) {
          return Center(
            child: Animate(
              key: ValueKey(state),
              effects: const [FadeEffect()],
              child: const Text("Search for your notes"),
            ),
          );
        }
        if (state is SearchNotesLoadedState) {
          if (state.notes.isEmpty) {
            return Center(
              child: Animate(
                key: ValueKey(state),
                effects: const [ShakeEffect()],
                child: const Text("No notes Found :("),
              ),
            );
          }
          return Padding(
            padding: const EdgeInsets.only(left: 13, right: 13, top: 2),
            child: DisableScrollStretching(
              child: NotesGrid(
                key: ValueKey(state.notes),
                notes: state.notes,
              ),
            ),
          );
        }
        return NotesGrid.loading();
      },
    );
  }
}
