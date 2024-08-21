import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/core/navigation/router.dart';
import 'package:scriby_app/uikit/uikit.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return SliverAppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      snap: false,
      floating: true,
      pinned: true,
      title: Text(
        'Scriby',
        style: textScheme.headline.copyWith(
          color: colorScheme.onBackground,
          fontSize: 25,
        ),
      ),
      toolbarHeight: 60,
      expandedHeight: 110,
      actions: [
        CustomIconButton(
          icon: Icons.search_rounded,
          iconSize: 25,
          onPressed: () => _openSearch(context),
        ),
        const SizedBox(width: 4),
        CustomIconButton(
          icon: Icons.settings,
          iconSize: 25,
          onPressed: () => _openSettings(context),
        ),
        const SizedBox(width: 10),
      ],
      bottom: AppBarBottom(tabController: tabController),
    );
  }

  Future<void> _openSettings(BuildContext context) async {
    AutoRouter.of(context).push(const GeneralSettingsShellRoute());
  }

  Future<void> _openSearch(BuildContext context) async {
    AutoRouter.of(context).push(const SearchNotesShellRoute());
  }
}

class AppBarBottom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBottom({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: CustomHorizontalTabBar(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        tabController: tabController,
        activeTextColor: colorScheme.background,
        inActiveTextColor: colorScheme.onBackground,
        indicatorColor: colorScheme.onBackground,
        labelStyle: textScheme.label.copyWith(fontSize: 18),
        tabs: const [
          "All notes",
          "Pinned",
          "Folders",
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
