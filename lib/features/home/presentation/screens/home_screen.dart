import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/core/navigation/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        MyNotesRoute(),
        NewNoteRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            showUnselectedLabels: true,
            items: generateNavigationBarItems(context),
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => _openPage(index, tabsRouter),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }

  List<BottomNavigationBarItem> generateNavigationBarItems(
          BuildContext context) =>
      [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.list_alt,
            color: Theme.of(context).colorScheme.secondary,
          ),
          activeIcon: Icon(
            Icons.list_alt,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: "All notes",
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.secondary,
          ),
          activeIcon: Icon(
            Icons.add,
            color: Theme.of(context).colorScheme.primary,
          ),
          label: "Add note",
        ),
      ];
}
