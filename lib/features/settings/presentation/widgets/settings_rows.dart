import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SettingsSwitchRow extends StatelessWidget {
  const SettingsSwitchRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onSwitchChanged,
    required this.isActive,
  });

  final IconData icon;
  final String text;
  final bool isActive;
  final void Function(bool) onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    final Widget textWidget = Text(
      text,
      style: textScheme.headline.copyWith(
        fontSize: 19,
        color: colorScheme.onBackground,
      ),
    );

    if (Platform.isIOS) {
      return CupertinoFormRow(
        prefix: Icon(icon),
        child: Row(
          children: [
            const SizedBox(width: 15),
            textWidget,
            const Spacer(),
            CupertinoSwitch(
              trackColor: colorScheme.surfaceVariant,
              value: isActive,
              onChanged: onSwitchChanged,
            ),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30,
          ),
          const SizedBox(width: 8),
          textWidget,
          const Spacer(),
          SizedBox(
            height: 30,
            child: Switch(
              thumbColor: WidgetStatePropertyAll<Color>(
                isActive ? colorScheme.background : colorScheme.onBackground,
              ),
              inactiveTrackColor: colorScheme.surface,
              trackOutlineColor: WidgetStatePropertyAll<Color>(
                colorScheme.background,
              ),
              value: isActive,
              onChanged: onSwitchChanged,
            ),
          ),
        ],
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

    final Widget textWidget = Text(
      text,
      style: textScheme.headline.copyWith(
        fontSize: 19,
        color: colorScheme.onBackground,
      ),
    );

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: onPressed,
        child: CupertinoFormRow(
          prefix: Icon(icon),
          child: Row(
            children: [
              const SizedBox(width: 15),
              textWidget,
              const Spacer(),
              const CupertinoListTileChevron(),
            ],
          ),
        ),
      );
    }

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
            textWidget,
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 23,
                color: colorScheme.onBackground,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SettingsButtonRow extends StatelessWidget {
  const SettingsButtonRow({
    super.key,
    required this.icon,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
  });

  final IconData icon;
  final String text;
  final Color? backgroundColor;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    final Widget textWidget = Text(
      text,
      style: textScheme.headline.copyWith(
        fontSize: 19,
        color: Platform.isIOS ? colorScheme.error : colorScheme.onBackground,
      ),
    );

    if (Platform.isIOS) {
      return GestureDetector(
        onTap: onPressed,
        child: CupertinoFormRow(
          prefix: Icon(icon),
          child: Row(
            children: [
              const SizedBox(width: 15),
              textWidget,
              const Spacer(),
            ],
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
            ),
            const SizedBox(width: 8),
            textWidget,
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
