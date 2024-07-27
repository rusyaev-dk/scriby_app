import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppAlertDialogAction extends StatelessWidget {
  const AppAlertDialogAction({
    required this.child,
    required this.onPressed,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
    this.style,
    super.key,
  });

  /// Action widget.
  ///
  /// Usually [Text].
  final Widget child;

  final VoidCallback onPressed;

  /// Only for iOS.
  final bool isDefaultAction;

  /// Only for iOS.
  final bool isDestructiveAction;

  /// Only for Android.
  final ButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoDialogAction(
        onPressed: onPressed,
        isDefaultAction: isDefaultAction,
        isDestructiveAction: isDestructiveAction,
        child: child,
      );
    }

    return TextButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
