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
      pinned: true,
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
      bottom: const TabBar(
        dividerColor: Colors.white,
        tabs: [
          SizedBox(
            height: 20,
            width: 70,
            child: Text("All notes"),
          ),
          Tab(text: "Pinned"),
          Tab(text: "Folders"),
        ],
      ),
      elevation: 0,
    );
  }
}
