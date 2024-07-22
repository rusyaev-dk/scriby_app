import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SettingsSwitcherRow extends StatelessWidget {
  const SettingsSwitcherRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onSwitcherChanged,
    required this.isActive,
  });

  final IconData icon;
  final String text;
  final bool isActive;
  final void Function(bool) onSwitcherChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: textScheme.headline.copyWith(
              fontSize: 19,
              color: colorScheme.onBackground,
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 30,
            child: Platform.isAndroid
                ? Switch(
                    value: isActive,
                    onChanged: onSwitcherChanged,
                  )
                : CupertinoSwitch(
                    value: isActive,
                    onChanged: onSwitcherChanged,
                  ),
          ),
        ],
      ),
    );
  }
}
