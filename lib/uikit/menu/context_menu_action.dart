import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class ContextMenuAction extends StatelessWidget {
  const ContextMenuAction({
    super.key,
    required this.title,
    this.icon,
    this.color,
    required this.onPressed,
  });

  final String title;
  final IconData? icon;
  final Color? color;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);
    final List<Widget> rowChildren = [];

    if (icon != null) {
      rowChildren.add(Icon(icon));
      rowChildren.add(const SizedBox(width: 10));
    }
    rowChildren.add(
      Text(
        title,
        style: textScheme.label.copyWith(
          color: colorScheme.onBackground,
          fontSize: 18,
        ),
      ),
    );

    if (Platform.isIOS) {
      return CupertinoContextMenuAction(
        onPressed: onPressed,
        child: Row(
          children: rowChildren,
        ),
      );
    }

    return Container(
      color: color ?? colorScheme.surfaceBright,
      child: PopupMenuItem(
        onTap: onPressed,
        child: Row(
          children: rowChildren,
        ),
      ),
    );
  }
}
