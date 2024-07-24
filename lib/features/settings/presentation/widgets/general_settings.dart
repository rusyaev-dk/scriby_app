import 'package:flutter/material.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SettingsSwitcherRow(
            text: "Notifications",
            icon: Icons.notifications,
            isActive: false,
            onSwitcherChanged: (bool isActive) {},
          ),
          const SizedBox(height: 5),
          Divider(
            color: colorScheme.onBackground,
            endIndent: 10,
            indent: 10,
          ),
          SettingsSwitcherRow(
            text: "Vibration",
            icon: Icons.vibration,
            isActive: false,
            onSwitcherChanged: (bool isActive) {},
          ),
          const SizedBox(height: 5),
          Divider(
            color: colorScheme.onBackground,
            endIndent: 10,
            indent: 10,
          ),
          const SizedBox(height: 5),
          SettingsSwitcherRow(
            text: "Cloud sync",
            icon: Icons.sync,
            isActive: false,
            onSwitcherChanged: (bool isActive) {},
          ),
          const SizedBox(height: 5),
          Divider(
            color: colorScheme.onBackground,
            endIndent: 10,
            indent: 10,
          ),
          const SizedBox(height: 5),
          SettingsPageTransitionRow(
            icon: Icons.security,
            text: "Privacy",
            onPressed: () {},
          ),
          Divider(
            color: colorScheme.onBackground,
            endIndent: 10,
            indent: 10,
          ),
          const SizedBox(height: 5),
          SettingsPageTransitionRow(
            icon: Icons.app_registration,
            text: "Appearance",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
