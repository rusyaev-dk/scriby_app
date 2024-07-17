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
      floating: true,
      pinned: true,
      title: const Text('Scriby'),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.filter_alt_outlined,
            color: colorScheme.onBackground,
          ),
        ),
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
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: CustomTabBar(
          tabController: tabController,
        ),
      ),
      elevation: 0,
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
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
      padding: const EdgeInsets.only(bottom: 15),
      indicator: CustomTabIndicator(
        color: colorScheme.onBackground,
        height: 30,
        width: 100,
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
              fontSize: 17.5,
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
          (configuration.size!.height - height),
        ) &
        Size(width, height);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
        RRect.fromRectAndRadius(rect, Radius.circular(height / 2)), paint);
  }
}
