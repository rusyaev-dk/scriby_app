import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SettingsIconCard extends StatelessWidget {
  const SettingsIconCard({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
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
    );
  }
}

class SettingsSwitcherCard extends StatelessWidget {
  const SettingsSwitcherCard({
    super.key,
    required this.onSwitcherChanged,
    required this.isActive,
    required this.text,
  });

  final String text;
  final void Function(bool) onSwitcherChanged;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
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
