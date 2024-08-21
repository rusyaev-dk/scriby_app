import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NoNotesWidget extends StatelessWidget {
  const NoNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Center(
      child: Text(
        "No notes yet...",
        style: TextStyle(
          color: colorScheme.onBackground,
        ),
      ),
    );
  }
}
