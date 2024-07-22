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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BottomSheetCloseSlider(),
            const SizedBox(height: 15),
            SettingsSwitcherCard(
              text: "Notifications",
              isActive: false,
              onSwitcherChanged: (bool isActive) {},
            ),
            const SizedBox(height: 250),
            const ThemeSwitcherCard(),
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
