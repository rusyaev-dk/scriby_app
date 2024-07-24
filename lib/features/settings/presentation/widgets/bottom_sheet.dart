import 'package:flutter/material.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      height: MediaQuery.of(context).size.height - 118,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BottomSheetCloseSlider(),
            const SizedBox(height: 15),
            const GeneralSettings(),
            const Spacer(),
            Text(
              "App version: 1.0.0",
              style: textScheme.headline.copyWith(
                fontSize: 18,
                color: colorScheme.surfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetCloseSlider extends StatelessWidget {
  const BottomSheetCloseSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return Container(
      margin: const EdgeInsets.only(top: 15),
      width: 60,
      height: 6.5,
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(3.25),
        ),
      ),
    );
  }
}

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

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      child: ThemeSwitcherRow(),
    );
  }
}
