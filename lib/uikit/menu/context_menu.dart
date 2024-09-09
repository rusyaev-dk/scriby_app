import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class CustomContextMenu extends StatelessWidget {
  const CustomContextMenu({
    super.key,
    required this.menuIcon,
    this.menuIconSize = 25,
    required this.actions,
  });

  final IconData menuIcon;
  final double? menuIconSize;
  final List<ContextMenuAction> actions;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    if (Platform.isIOS) {
      return CupertinoContextMenu(
        actions: actions,
        child: Icon(
          menuIcon,
          color: colorScheme.onBackground,
          size: menuIconSize,
        ),
      );
    }

    return PopupMenuButton(
      elevation: 0,
      position: PopupMenuPosition.under,
      offset: const Offset(-5, 12),
      borderRadius: BorderRadius.circular(25),
      color: colorScheme.surfaceBright,
      popUpAnimationStyle: AnimationStyle(
        curve: Curves.easeInQuint,
      ),
      icon: Icon(
        menuIcon,
        color: colorScheme.onBackground,
        size: menuIconSize,
      ),
      itemBuilder: (context) {
        final List<PopupMenuItem<dynamic>> entries = [];
        for (Widget action in actions) {
          entries.add(
            PopupMenuItem(
              child: action,
            ),
          );
        }
        return entries;
      },
    );
  }
}
