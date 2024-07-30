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
      snap: true,
      forceElevated: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
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
        AppBarButton.round(
          diameter: 40,
          icon: Icons.filter_alt,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        AppBarButton.round(
          diameter: 40,
          icon: Icons.search,
          onPressed: () {},
        ),
        const SizedBox(width: 8),
        AppBarButton.round(
          diameter: 40,
          icon: Icons.settings,
          onPressed: () => _openSettings(context),
        ),
        const SizedBox(width: 10),
      ],
      bottom: AppBarBottom(tabController: tabController),
    );
  }

  Future<void> _openSettings(BuildContext context) async {
    AutoRouter.of(context).push(const SettingsRoute());
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
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: CustomTabBar(
        indicator: CustomTabBarIndicator.rounded(
          color: colorScheme.onBackground,
          height: 35,
          width: 105,
        ),
        tabController: tabController,
        labels: const ["All notes", "Pinned", "Folders"],
        selectedLabelColor: colorScheme.onBackground,
        unSelectedLabelColor: colorScheme.background,
        labelStyle: textScheme.label.copyWith(
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}
