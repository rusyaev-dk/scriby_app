import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/app/app.dart';
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
class SearchNotesScreen extends StatelessWidget {
  const SearchNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ISearchNotesRepository>(
          create: (context) => SearchNotesRepository(
            realm: AppConfig.of(context).realm,
          ),
        ),
        RepositoryProvider<ISearchFiltersRepository>(
          create: (context) => SearchFiltersRepository(
            prefs: AppConfig.of(context).sharedPreferences,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SearchNotesBloc(
              searchNotesRepository:
                  RepositoryProvider.of<ISearchNotesRepository>(context),
              searchFiltersRepository:
                  RepositoryProvider.of<ISearchFiltersRepository>(context),
              notesRepository: RepositoryProvider.of<INotesRepository>(context),
              logger: RepositoryProvider.of<ILogger>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SearchFiltersCubit(
              searchFiltersRepository:
                  RepositoryProvider.of<ISearchFiltersRepository>(context),
              logger: RepositoryProvider.of<ILogger>(context),
            ),
          ),
        ],
        child: const SearchNotesView(),
      ),
    );
  }
}

class SearchNotesView extends StatefulWidget {
  const SearchNotesView({
    super.key,
  });

  @override
  State<SearchNotesView> createState() => _SearchNotesViewState();
}

class _SearchNotesViewState extends State<SearchNotesView>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final AnimationController _borderRadiusAnimationController;
  late final Animation<double> _borderRadiusAnimation;

  bool _isCircular = true;

  @override
  void initState() {
    super.initState();

    _borderRadiusAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 85),
    );
    _borderRadiusAnimation = Tween<double>(begin: 30, end: 0)
        .animate(_borderRadiusAnimationController);

    _scrollController = ScrollController();
    _scrollController.addListener(_animateBorderRadius);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, 60),
        child: SearchNotesAppBar(),
      ),
      body: SafeArea(
        bottom: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _borderRadiusAnimation,
                child: SearchBodyContent(
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
              child: SearchBottomBar(),
            ),
          ],
        ),
      ),
    );
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
    super.dispose();
  }
}

class SearchBodyContent extends StatelessWidget {
  const SearchBodyContent({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

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
            padding: const EdgeInsets.only(left: 13, right: 13),
            child: DisableScrollStretching(
              child: NotesGrid(
                scrollController: scrollController,
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
