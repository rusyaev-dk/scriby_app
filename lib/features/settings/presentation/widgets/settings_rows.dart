import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SettingsSwitchRow extends StatelessWidget {
  const SettingsSwitchRow({
    super.key,
    this.icon,
    required this.text,
    required this.onSwitchChanged,
    required this.isActive,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
  });

  final Icon? icon;
  final String text;
  final bool isActive;
  final void Function(bool) onSwitchChanged;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Container(
      padding: padding,
      child: Row(
        children: [
          if (icon != null) icon!,
          if (icon != null) const SizedBox(width: 12),
          Text(
            text,
            style: textScheme.headline.copyWith(
              fontSize: 23,
              color: colorScheme.onBackground,
            ),
          ),
          const Spacer(),
          Platform.isIOS
              ? CupertinoSwitch(
                  trackColor: colorScheme.surfaceVariant,
                  value: isActive,
                  onChanged: onSwitchChanged,
                )
              : SizedBox(
                  height: 30,
                  child: Switch(
                    thumbColor: WidgetStatePropertyAll<Color>(
                      isActive
                          ? colorScheme.background
                          : colorScheme.onBackground,
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

class SettingsButtonRow extends StatelessWidget {
  const SettingsButtonRow({
    super.key,
    this.prefixIcon,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
    this.suffixIcon,
    this.isDestructiveAction = false,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
  });

  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final String text;
  final Color? backgroundColor;
  final bool isDestructiveAction;
  final void Function() onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: padding,
        child: Row(
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 12),
            Text(
              text,
              style: textScheme.headline.copyWith(
                fontSize: 23,
                color: (isDestructiveAction && Platform.isIOS)
                    ? colorScheme.error
                    : colorScheme.onBackground,
              ),
            ),
            const Spacer(),
            if (suffixIcon != null) suffixIcon!
          ],
        ),
      ),
    );
  }
}

class SettingsRadioButtonRow extends StatelessWidget {
  const SettingsRadioButtonRow({
    super.key,
    this.prefixIcon,
    required this.text,
    this.backgroundColor,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
    required this.value,
  });

  final Icon? prefixIcon;
  final bool value;
  final String text;
  final Color? backgroundColor;

  final void Function() onPressed;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(25),
        ),
        padding: padding,
        child: Row(
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 12),
            Text(
              text,
              style: textScheme.headline.copyWith(
                fontSize: 23,
                color: colorScheme.onBackground,
              ),
            ),
            const Spacer(),
            if (value)
              Icon(
                Icons.check_circle,
                color: colorScheme.onBackground,
              )
          ],
        ),
      ),
    );
  }
}
