import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class PopScreenButton extends StatelessWidget {
  const PopScreenButton({
    super.key,
    this.onPressed,
    this.callback,
    this.icon,
    this.iconColor,
    this.iconSize,
  });

  final void Function()? onPressed;
  final void Function()? callback;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    if (Platform.isIOS) {
      return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed ?? () => _defaultBtnAction(context),
        child: Icon(
          icon ?? Icons.arrow_back_ios_new_rounded,
          color: iconColor ?? colorScheme.onBackground,
          size: iconSize,
        ),
      );
    }

    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: onPressed ?? () => _defaultBtnAction(context),
      icon: Icon(
        icon ?? Icons.arrow_back_rounded,
        color: iconColor ?? colorScheme.onBackground,
        size: iconSize,
      ),
    );
  }

  void _defaultBtnAction(BuildContext context) {
    AutoRouter.of(context).maybePop();
    if (callback != null) {
      callback!();
    }
  }
}

class PopScreenButtonCirlced extends StatelessWidget {
  const PopScreenButtonCirlced({
    super.key,
    required this.diameter,
    this.onPressed,
    this.callback,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.backgroundColor,
  });

  final void Function()? onPressed;
  final void Function()? callback;
  final Color? iconColor;
  final IconData? icon;
  final double? iconSize;
  final double diameter;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Container(
      height: diameter,
      width: diameter,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(diameter / 2),
      ),
      child: PopScreenButton(
        onPressed: onPressed,
        callback: callback,
        icon: icon,
        iconSize: iconSize,
        iconColor: iconColor,
      ),
    );
  }
}
