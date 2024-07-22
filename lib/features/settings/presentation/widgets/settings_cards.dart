import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:scriby_app/uikit/uikit.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          Platform.isAndroid
              ? Switch(
                  value: isActive,
                  onChanged: onSwitcherChanged,
                )
              : CupertinoSwitch(
                  value: isActive,
                  onChanged: onSwitcherChanged,
                ),
        ],
      ),
    );
  }
}

class ThemeSwitcherCard extends StatelessWidget {
  const ThemeSwitcherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(15),
      ),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: ThemeModeCard(
                  onPressed: () => _switchTheme(ThemeMode.system, context),
                  isActive: state.themeMode == ThemeMode.system,
                  text: "System",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ThemeModeCard(
                  onPressed: () => _switchTheme(ThemeMode.light, context),
                  isActive: state.themeMode == ThemeMode.light,
                  text: "Light",
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ThemeModeCard(
                  onPressed: () => _switchTheme(ThemeMode.dark, context),
                  isActive: state.themeMode == ThemeMode.dark,
                  text: "Dark",
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _switchTheme(
    ThemeMode themeMode,
    BuildContext context,
  ) {
    BlocProvider.of<ThemeCubit>(context).setTheme(ThemeMode.system);
  }
}

class ThemeModeCard extends StatelessWidget {
  const ThemeModeCard({
    super.key,
    required this.text,
    required this.isActive,
    required this.onPressed,
  });

  final VoidCallback onPressed;
  final bool isActive;
  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isActive ? colorScheme.secondary : colorScheme.background,
        ),
        child: Center(
          child: Text(
            text,
            style: textScheme.display.copyWith(
              fontSize: 17,
              color: colorScheme.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
