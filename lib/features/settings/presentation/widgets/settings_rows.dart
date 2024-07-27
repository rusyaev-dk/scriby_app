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
                    trackColor: WidgetStatePropertyAll<Color>(
                        colorScheme.surfaceVariant),
                    value: isActive,
                    onChanged: onSwitcherChanged,
                  )
                : CupertinoSwitch(
                    trackColor: colorScheme.surfaceVariant,
                    value: isActive,
                    onChanged: onSwitcherChanged,
                  ),
          ),
        ],
      ),
    );
  }
}

class SettingsButtonRow extends StatelessWidget {
  const SettingsButtonRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
          ],
        ),
      ),
    );
  }
}

class SettingsPageTransitionRow extends StatelessWidget {
  const SettingsPageTransitionRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 25,
                color: colorScheme.surfaceVariant,
              ),
            )
          ],
        ),
      ),
    );
  }
}
