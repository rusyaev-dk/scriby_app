import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return SliverAppBar(
      snap: true,
      floating: true,
      title: const Text('Scriby'),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.filter_alt_outlined,
          color: colorScheme.onBackground,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: colorScheme.onBackground,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: colorScheme.onBackground,
          ),
        ),
      ],
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: HomeTabBar(),
      ),
      elevation: 0,
    );
  }
}

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: TabBar(tabs: [
        Tab(
          text: "dasfasdf",
          child: const Text("asdfasdf"),
        ),
        Tab(
          text: "dasfewr43r",
          child: const Text("asdfasdf"),
        ),
      ]),
    );
  }
}
