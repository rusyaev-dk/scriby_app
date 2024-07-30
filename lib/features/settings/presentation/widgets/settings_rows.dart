import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
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

    Widget switcher;

    if (Platform.isIOS) {
      switcher = CupertinoSwitch(
        trackColor: colorScheme.surfaceVariant,
        value: isActive,
        onChanged: onSwitcherChanged,
      );
    } else {
      switcher = Switch(
        thumbColor: WidgetStatePropertyAll<Color>(
          isActive ? colorScheme.background : colorScheme.onBackground,
        ),
        inactiveTrackColor: colorScheme.surface,
        trackOutlineColor: WidgetStatePropertyAll<Color>(
          colorScheme.background,
        ),
        value: isActive,
        onChanged: onSwitcherChanged,
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
            child: switcher,
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
              child: ThemeSwitchButton.withSubtitle(
                height: 95,
                backgroundColor: state.themeMode == ThemeMode.system
                    ? colorScheme.activatedThemeButtonColor
                    : colorScheme.surface,
                borderColor: state.themeMode == ThemeMode.system
                    ? colorScheme.primary
                    : null,
                title: "System",
                subtitle: "Same as on the device",
                onPressed: () => _switchTheme(context, ThemeMode.system),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ThemeSwitchButton(
                height: 95,
                icon: Icons.sunny,
                backgroundColor: state.themeMode == ThemeMode.light
                    ? colorScheme.activatedThemeButtonColor
                    : colorScheme.surface,
                borderColor: state.themeMode == ThemeMode.light
                    ? colorScheme.primary
                    : null,
                title: "Light",
                onPressed: () => _switchTheme(context, ThemeMode.light),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: ThemeSwitchButton(
                height: 95,
                icon: Icons.nightlight_round_outlined,
                backgroundColor: state.themeMode == ThemeMode.dark
                    ? colorScheme.activatedThemeButtonColor
                    : colorScheme.surface,
                borderColor: state.themeMode == ThemeMode.dark
                    ? colorScheme.primary
                    : null,
                title: "Dark",
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
    await BlocProvider.of<ThemeCubit>(context).setTheme(themeMode);
  }
}
