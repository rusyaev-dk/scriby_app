import 'package:flutter/material.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

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
        padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomSheetCloseSlider(),
            SizedBox(height: 15),
            GeneralSettings(),
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

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          SettingsSwitcherRow(
            text: "Notifications",
            icon: Icons.notifications,
            isActive: false,
            onSwitcherChanged: (bool isActive) {},
          ),
          Divider(
            color: colorScheme.onBackground,
          ),
          SettingsSwitcherRow(
            text: "Notifications",
            icon: Icons.notifications,
            isActive: false,
            onSwitcherChanged: (bool isActive) {},
          ),
        ],
      ),
    );
  }
}
