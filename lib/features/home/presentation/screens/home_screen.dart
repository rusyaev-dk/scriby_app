import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/navigation/navigation.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return AutoTabsRouter.tabBar(
      routes: const [
        AllNotesRoute(),
        PinnedNotesRoute(),
        FoldersRoute(),
      ],
      duration: const Duration(milliseconds: 150),
      builder: (context, child, tabController) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          floatingActionButton: const NewNoteButton(),
          body: DisableScrollStretching(
            child: NestedScrollView(
              key: ScrollAbsorberKeys.nestedScrollViewKey,
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                    sliver: HomeAppBar(tabController: tabController),
                  ),
                ];
              },
              body: child,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
