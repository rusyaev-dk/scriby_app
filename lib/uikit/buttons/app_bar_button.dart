import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.onPressed,
  });

  factory AppBarButton.round({
    required double diameter,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return AppBarButton(
      height: diameter,
      width: diameter,
      icon: icon,
      onPressed: onPressed,
    );
  }

  final double height;
  final double width;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: colorScheme.onBackground,
        borderRadius: BorderRadius.circular(width / 2),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            color: colorScheme.background,
          ),
        ),
      ),
    );
  }
}
