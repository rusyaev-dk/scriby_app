import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/common/widgets/disable_scroll_stretching.dart';
import 'package:scriby_app/core/navigation/navigation.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return AutoTabsRouter.tabBar(
      routes: const [
        AllNotesTabRoute(),
        PinnedNotesTabRoute(),
        FoldersTabRoute(),
      ],
      duration: const Duration(milliseconds: 150),
      builder: (context, child, tabController) {
        return Scaffold(
          backgroundColor: colorScheme.surface,
          floatingActionButton: const NewNoteButton(),
          body: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverSafeArea(
                    top: false,
                    sliver: HomeAppBar(tabController: tabController),
                  ),
                ),
              ];
            },
            body: child,
          ),
        );
      },
    );
  }
}

// TabBarView(
//                       controller: _tabController,
//                       children: const [
//                         AllNotesTab(),
//                         PinnedNotesTab(),
//                         FoldersTab(),
//                       ],
//                     ),
