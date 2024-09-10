import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SettingsSectionForm extends StatelessWidget {
  const SettingsSectionForm({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Platform.isIOS
            ? colorScheme.sectionBackgroundColor
            : colorScheme.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
