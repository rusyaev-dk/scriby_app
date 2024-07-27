import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/dialogs/dialogs.dart';

class AppAlertDialog extends StatelessWidget {
  const AppAlertDialog({
    super.key,
    required this.actions,
    this.title,
    this.content,
  });

  final List<AppAlertDialogAction> actions;
  final Widget? title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    final actionsLocal =
        actions.map((action) => action.build(context)).toList();

    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: actionsLocal,
      );
    }

    return AlertDialog(
      title: title,
      content: content,
      actions: actionsLocal,
    );
  }
}
