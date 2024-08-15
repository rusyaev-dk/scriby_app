import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SaveNoteButton extends StatelessWidget {
  const SaveNoteButton({
    super.key,
    required this.onPressed,
    required this.isSaving,
    required this.height,
  });

  final void Function() onPressed;
  final bool isSaving;
  final double height;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    final buttonWidth = MediaQuery.of(context).size.width / 3.5;

    Widget buttonChild = isSaving
        ? SizedBox(
            height: 24,
            width: 24,
            child: CircularProgressIndicator(
              color: colorScheme.onBackground,
            ),
          )
        : Text(
            'Save',
            style: textScheme.label.copyWith(
              fontSize: 21,
              color: colorScheme.onBackground,
            ),
          );

    if (Platform.isIOS) {
      final Widget button = CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: isSaving ? null : onPressed,
        child: buttonChild,
      );

      return Container(
        width: buttonWidth,
        height: height,
        decoration: BoxDecoration(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(height / 2),
        ),
        child: button,
      );
    } else {
      final Widget button = FloatingActionButton(
        onPressed: isSaving ? null : onPressed,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        child: buttonChild,
      );

      return SizedBox(
        width: buttonWidth,
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: button,
        ),
      );
    }
  }
}
