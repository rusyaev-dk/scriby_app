import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

const EdgeInsets _defaultPadding =
    EdgeInsets.symmetric(horizontal: 18, vertical: 6);

const BorderRadius _defaultBorderRadius = BorderRadius.all(Radius.circular(20));

class SettingsSwitchRow extends StatelessWidget {
  const SettingsSwitchRow({
    super.key,
    this.icon,
    required this.text,
    required this.onSwitchChanged,
    required this.isActive,
    this.padding = _defaultPadding,
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
              fontSize: 21,
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
                  height: 25,
                  child: Switch(
                    thumbColor: WidgetStatePropertyAll<Color>(
                      isActive
                          ? colorScheme.background
                          : colorScheme.onBackground,
                    ),
                    inactiveTrackColor: colorScheme.surface,
                    trackOutlineColor: WidgetStatePropertyAll<Color>(
                      colorScheme.onBackground,
                    ),
                    trackOutlineWidth: WidgetStateProperty.all(1.5),
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
    this.padding = _defaultPadding,
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
          borderRadius: _defaultBorderRadius,
        ),
        padding: padding,
        child: Row(
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 12),
            Text(
              text,
              style: textScheme.headline.copyWith(
                fontSize: 21,
                color: isDestructiveAction
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
    this.padding = _defaultPadding,
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
          borderRadius: _defaultBorderRadius,
        ),
        padding: padding,
        child: Row(
          children: [
            if (prefixIcon != null) prefixIcon!,
            if (prefixIcon != null) const SizedBox(width: 12),
            Text(
              text,
              style: textScheme.headline.copyWith(
                fontSize: 21,
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
