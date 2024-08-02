import 'package:flutter/material.dart';

class CustomHorizontalTabBar extends StatelessWidget {
  const CustomHorizontalTabBar({
    super.key,
    required this.tabs,
    required this.tabController,
    this.labelStyle,
    this.indicatorColor,
    this.activeTextColor,
    this.inActiveTextColor,
    this.padding,
  });

  final List<String> tabs;
  final TabController tabController;
  final TextStyle? labelStyle;
  final Color? indicatorColor;
  final Color? activeTextColor;
  final Color? inActiveTextColor;
  final EdgeInsets? padding;

  static const double _defaultSidePadding = 12;

  @override
  Widget build(BuildContext context) {
    final double commonSidePadding = _calculateCommonSidePadding();

    final double tabWidth =
        (MediaQuery.of(context).size.width - 24 - commonSidePadding) /
            tabs.length;

    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(horizontal: _defaultSidePadding),
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomTabBarIndicator(
            tabController: tabController,
            width: tabWidth,
            height: 35,
            color: indicatorColor,
          ),
          Row(
            children: List.generate(
              tabs.length,
              (i) {
                return GestureDetector(
                  onTap: () => _onTabPressed(i),
                  child: SizedBox(
                    width: tabWidth,
                    child: Center(
                      child: AnimatedBuilder(
                        animation: tabController.animation!,
                        builder: (context, child) {
                          final double animationValue =
                              tabController.animation!.value;

                          final color = Color.lerp(
                            activeTextColor,
                            inActiveTextColor,
                            (animationValue - i).abs().clamp(0.0, 1.0),
                          );

                          return Text(
                            tabs[i],
                            style: labelStyle?.copyWith(color: color) ??
                                TextStyle(
                                  fontSize: 18,
                                  color: color,
                                ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  double _calculateCommonSidePadding() {
    double commonSidePadding = (padding?.left ?? 0.0) + (padding?.right ?? 0.0);

    if (commonSidePadding == 0) {
      return _defaultSidePadding * 2;
    }
    return commonSidePadding;
  }

  void _onTabPressed(int index) {
    tabController.animateTo(index);
  }
}

class CustomTabBarIndicator extends StatelessWidget {
  const CustomTabBarIndicator({
    super.key,
    required this.tabController,
    this.height = 35,
    this.width = 70,
    this.borderRadius,
    this.color = Colors.black,
  });

  final TabController tabController;
  final double height;
  final double width;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tabController.animation!,
      builder: (context, child) {
        final double animationValue = tabController.animation!.value;

        return Align(
          alignment: Alignment(animationValue - 1, 0.0),
          child: RepaintBoundary(
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius ?? BorderRadius.circular(height / 2),
              ),
            ),
          ),
        );
      },
    );
  }
}
