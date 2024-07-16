import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/core/navigation/router.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NewNoteButton extends StatelessWidget {
  const NewNoteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return GestureDetector(
      onTap: () {
        context.router.push(const NewNoteRoute());
      },
      child: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
            color: colorScheme.onBackground,
            borderRadius: BorderRadius.circular(32.5)),
        child: Icon(
          Icons.add,
          size: 33,
          color: colorScheme.surface,
        ),
      ),
    );
  }
}
