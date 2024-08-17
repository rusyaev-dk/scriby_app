import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.iconSize,
  });

  final IconData icon;
  final double? iconSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    if (Platform.isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Icon(
          icon,
          size: iconSize,
          color: colorScheme.onBackground,
        ),
      );
    } else {
      return IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: iconSize,
          color: colorScheme.onBackground,
        ),
      );
    }
  }
}

class CustomIconButtonCircled extends StatelessWidget {
  const CustomIconButtonCircled({
    super.key,
    required this.icon,
    this.iconSize,
    required this.onPressed,
    required this.diameter,
    this.backgroundColor,
  });

  final IconData icon;
  final double? iconSize;
  final VoidCallback onPressed;
  final double diameter;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
        color: backgroundColor ?? colorScheme.surface,
        borderRadius: BorderRadius.circular(diameter / 2),
      ),
      child: CustomIconButton(
        icon: icon,
        onPressed: onPressed,
        iconSize: iconSize,
      ),
    );
  }
}
