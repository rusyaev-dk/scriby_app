import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.labels,
    required this.indicator,
    this.dividerColor = Colors.transparent,
    this.overlayColor = Colors.transparent,
    this.onTap,
    this.selectedLabelColor,
    this.unSelectedLabelColor,
    this.labelStyle,
  });

  final TabController tabController;
  final List<String> labels;
  final Color? dividerColor;
  final Color? overlayColor;
  final CustomTabBarIndicator indicator;
  final void Function(int)? onTap;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      controller: tabController,
      dividerColor: Colors.transparent,
      indicator: indicator,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      tabs: List.generate(
        labels.length,
        (index) {
          return AnimatedTab(
            tabController: tabController,
            label: labels[index],
            index: index,
            selectedLabelColor: selectedLabelColor,
            unSelectedLabelColor: unSelectedLabelColor,
            labelStyle: labelStyle,
          );
        },
      ),
    );
  }
}

class AnimatedTab extends StatelessWidget {
  const AnimatedTab({
    super.key,
    required this.tabController,
    required this.label,
    required this.index,
    this.selectedLabelColor = Colors.black,
    this.unSelectedLabelColor = Colors.white,
    this.labelStyle,
  });

  final TabController tabController;
  final String label;
  final int index;
  final Color? selectedLabelColor;
  final Color? unSelectedLabelColor;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (context, child) {
        final animationValue = tabController.animation!.value;
        final isSelected = index == tabController.index;

        final color = isSelected
            ? Color.lerp(unSelectedLabelColor, selectedLabelColor,
                (animationValue - index).abs().clamp(0.0, 1.0))
            : Color.lerp(unSelectedLabelColor, selectedLabelColor,
                (animationValue - index).abs().clamp(0.0, 1.0));

        return Text(
          label,
          style: labelStyle?.copyWith(color: color) ??
              TextStyle(
                fontSize: 18,
                color: color,
              ).copyWith(color: color),
        );
      },
    );
  }
}

class CustomTabBarIndicator extends Decoration {
  const CustomTabBarIndicator({
    this.color = Colors.black,
    this.width = 10.0,
    this.height = 4.0,
    this.borderRadius = const Radius.circular(5),
  });

  factory CustomTabBarIndicator.rounded({
    required Color color,
    double width = 10.0,
    double height = 4,
  }) {
    return CustomTabBarIndicator(
      color: color,
      width: width,
      height: height,
      borderRadius: Radius.circular(height / 2),
    );
  }

  final Color color;
  final double width;
  final double height;
  final Radius borderRadius;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomTabIndicatorPainter(
      this,
      borderRadius,
      onChanged,
      color,
      width,
      height,
    );
  }
}

class _CustomTabIndicatorPainter extends BoxPainter {
  _CustomTabIndicatorPainter(
    this.decoration,
    this.borderRadius,
    VoidCallback? onChanged,
    this.color,
    this.width,
    this.height,
  ) : super(onChanged);

  final CustomTabBarIndicator decoration;
  final Radius borderRadius;
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

    canvas.drawRRect(RRect.fromRectAndRadius(rect, borderRadius), paint);
  }
}
