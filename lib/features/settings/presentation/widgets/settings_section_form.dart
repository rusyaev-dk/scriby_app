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
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.sectionBackgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: children,
      ),
    );
  }
}
