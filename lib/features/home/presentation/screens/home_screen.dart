import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_tabControllerListener);
  }

  void _tabControllerListener() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Scaffold(
      backgroundColor: colorScheme.surface,
      floatingActionButton: const NewNoteButton(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            HomeAppBar(tabController: _tabController),
          ];
        },
        body: DisableScrollStretching(
          child: TabBarView(
            controller: _tabController,
            children: const [
              AllNotesGridView(),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Text("Content for Tab 2"),
                    ),
                  ),
                  // Add more slivers for Tab 2 here
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 200,
                      width: 200,
                      child: Text("Content for Tab 3"),
                    ),
                  ),
                  // Add more slivers for Tab 2 here
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.removeListener(_tabControllerListener);
    _tabController.dispose();
    super.dispose();
  }
}
