import 'package:flutter/material.dart';
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
            const BottomSheetCloseSlider(),
            const SizedBox(height: 20),
            SettingsSwitcherCard(
              text: "Notifications",
              isActive: false,
              onSwitcherChanged: (bool isActive) {},
            ),
            const SizedBox(height: 15),
            const ThemeSwitcherRow(),
            const SizedBox(height: 15),
            const Spacer(),
            const Row(
              children: [
                Expanded(
                  flex: 2,
                  child: SettingsIconCard(
                    text: "Delete all notes",
                    icon: Icons.delete_forever,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: SettingsIconCard(
                    text: "Logout",
                    icon: Icons.logout,
                  ),
                ),
              ],
            )
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
