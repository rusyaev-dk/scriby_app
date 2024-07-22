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

class ThemeSwitcherRow extends StatelessWidget {
  const ThemeSwitcherRow({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous.themeMode != current.themeMode,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              flex: 2,
              child: ThemeSwitchButton(
                height: 95,
                color: state.themeMode == ThemeMode.system
                    ? colorScheme.activatedThemeButtonColor
                    : colorScheme.surface,
                borderColor: state.themeMode == ThemeMode.system
                    ? colorScheme.primary
                    : null,
                text: "System",
                subtitle: "Same as on the device",
                onPressed: () => _switchTheme(context, ThemeMode.system),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ThemeSwitchButton(
                height: 95,
                icon: Icons.sunny,
                color: state.themeMode == ThemeMode.light
                    ? colorScheme.activatedThemeButtonColor
                    : colorScheme.surface,
                borderColor: state.themeMode == ThemeMode.light
                    ? colorScheme.primary
                    : null,
                text: "Light",
                onPressed: () => _switchTheme(context, ThemeMode.light),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ThemeSwitchButton(
                height: 95,
                icon: Icons.nightlight_round_outlined,
                color: state.themeMode == ThemeMode.dark
                    ? colorScheme.activatedThemeButtonColor
                    : colorScheme.surface,
                borderColor: state.themeMode == ThemeMode.dark
                    ? colorScheme.primary
                    : null,
                text: "Dark",
                onPressed: () => _switchTheme(context, ThemeMode.dark),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _switchTheme(
    BuildContext context,
    ThemeMode themeMode,
  ) async {
    await context.read<ThemeCubit>().setTheme(themeMode);
  }
}
