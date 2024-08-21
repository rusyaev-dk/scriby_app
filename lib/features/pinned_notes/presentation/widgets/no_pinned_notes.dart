import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NoPinnedNotesWidget extends StatelessWidget {
  const NoPinnedNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    
    return Center(
      child: Text(
        "No pinned notes yet...",
        style: TextStyle(
          color: colorScheme.onBackground,
        ),
      ),
    );
  }
}
