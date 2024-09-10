import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
import 'package:scriby_app/uikit/uikit.dart';

class ThemeSettingsSection extends StatelessWidget {
  const ThemeSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous.themeMode != current.themeMode,
      builder: (context, state) {
        if (Platform.isIOS) {
          return CupertinoFormSection(
            header: const Text("Appearance"),
            children: [
              CupertinoSegmentedControl<ThemeMode>(
                groupValue: state.themeMode,
                onValueChanged: (ThemeMode value) {
                  _switchTheme(context, value);
                },
                children: const {
                  ThemeMode.system: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('System'),
                  ),
                  ThemeMode.light: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Light'),
                  ),
                  ThemeMode.dark: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text('Dark'),
                  ),
                },
              ),
            ],
          );
        }

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
