import 'package:flutter/material.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/features/all_notes/presentation/presentation.dart';
import 'package:scriby_app/features/folders/presentation/presentation.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/pinned_notes/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

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
                sliver: HomeAppBar(tabController: _tabController),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: const [
              AllNotesTab(),
              PinnedNotesTab(),
              FoldersTab(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }
}
