import 'package:flutter/material.dart';
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

    return SliverAppBar(
      snap: true,
      forceElevated: false,
      scrolledUnderElevation: 0,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      floating: true,
      pinned: true,
      title: const Text('Scriby'),
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
          onPressed: () {},
        ),
        const SizedBox(width: 10),
      ],
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 50),
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: HomeTabBar(
            tabController: tabController,
          ),
        ),
      ),
    );
  }
}

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      indicator: CustomTabIndicator(
        color: colorScheme.onBackground,
        height: 35,
        width: 105,
      ),
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      tabs: [
        AnimatedTab(tabController: tabController, label: "All notes", index: 0),
        AnimatedTab(tabController: tabController, label: "Pinned", index: 1),
        AnimatedTab(tabController: tabController, label: "Folders", index: 2),
      ],
    );
  }
}

class AnimatedTab extends StatelessWidget {
  const AnimatedTab({
    super.key,
    required this.tabController,
    required this.label,
    required this.index,
  });

  final TabController tabController;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (context, child) {
        final animationValue = tabController.animation!.value;
        final isSelected = index == tabController.index;

        final color = isSelected
            ? Color.lerp(colorScheme.background, colorScheme.onBackground,
                (animationValue - index).abs().clamp(0.0, 1.0))
            : Color.lerp(colorScheme.background, colorScheme.onBackground,
                (animationValue - index).abs().clamp(0.0, 1.0));

        return SizedBox(
          child: Text(
            label,
            style: textScheme.label.copyWith(
              fontSize: 18,
              color: color,
            ),
          ),
        );
      },
    );
  }
}

class CustomTabIndicator extends Decoration {
  const CustomTabIndicator({
    required this.color,
    this.width = 10.0,
    this.height = 4.0,
  });

  final Color color;
  final double width;
  final double height;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(this, onChanged, color, width, height);
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  _CustomTabIndicatorPainter(
    this.decoration,
    VoidCallback? onChanged,
    this.color,
    this.width,
    this.height,
  ) : super(onChanged);

  final CustomTabIndicator decoration;
  final Color color;
  final double width;
  final double height;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Rect rect = Offset(
          offset.dx + (configuration.size!.width - width) / 2,
          (configuration.size!.height - height) / 2,
        ) &
        Size(width, height);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(height / 2)), paint);
  }
}
