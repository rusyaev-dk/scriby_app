import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: const NewNoteButton(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const HomeAppBar(),
            ];
          },
          body: const TabBarView(
            children: [
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
}
