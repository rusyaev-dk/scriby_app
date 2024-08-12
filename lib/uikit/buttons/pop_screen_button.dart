import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class PopScreenButton extends StatelessWidget {
  const PopScreenButton({
    super.key,
    this.callback,
    this.iconColor,
    this.onPressed,
    this.icon,
    this.iconSize,
  });

  final void Function()? onPressed;
  final void Function()? callback;
  final Color? iconColor;
  final IconData? icon;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return IconButton(
      onPressed: onPressed ?? () => _defaultBtnAction(context),
      icon: Icon(
        icon ??
            (Platform.isAndroid
                ? Icons.arrow_back_rounded
                : Icons.arrow_back_ios_new_rounded),
        color: iconColor ?? colorScheme.onBackground,
        size: iconSize,
      ),
    );
  }

  Future<void> _defaultBtnAction(BuildContext context) async {
    await AutoRouter.of(context).maybePop();
    if (callback != null) {
      callback!();
    }
  }
}
