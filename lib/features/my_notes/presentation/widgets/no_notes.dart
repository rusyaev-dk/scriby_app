import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NoNotesWidget extends StatelessWidget {
  const NoNotesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Text(
          "No notes yet...",
          style: TextStyle(
            color: AppColorScheme.of(context).onBackground,
          ),
        ),
      ),
    );
  }
}
