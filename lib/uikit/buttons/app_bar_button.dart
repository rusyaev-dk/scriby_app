import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.height,
    required this.width,
    required this.icon,
    required this.onPressed,
    this.iconSize,
  });

  factory AppBarButton.round({
    required double diameter,
    required IconData icon,
    double? iconSize,
    required VoidCallback onPressed,
  }) {
    return AppBarButton(
      height: diameter,
      width: diameter,
      icon: icon,
      iconSize: iconSize,
      onPressed: onPressed,
    );
  }

  final double height;
  final double width;
  final IconData icon;
  final double? iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    Widget button;
    if (Platform.isIOS) {
      button = CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Icon(
          icon,
          size: iconSize,
          color: colorScheme.onBackground,
        ),
      );
    } else {
      button = IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: iconSize,
          color: colorScheme.onBackground,
        ),
      );
    }

    return SizedBox(
      height: height,
      width: width,
      child: Center(
        child: button,
      ),
    );
  }
}
