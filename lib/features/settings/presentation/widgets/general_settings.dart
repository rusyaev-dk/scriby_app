import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/core/navigation/router.dart';
import 'package:scriby_app/features/settings/presentation/blocs/blocs.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class GeneralSettings extends StatelessWidget {
  const GeneralSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<GeneralSettingsBloc, GeneralSettingsState>(
      builder: (context, state) {
        if (state is GeneralSettingsLoadedState) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SettingsSwitcherRow(
                  text: "Notifications",
                  icon: Icons.notifications,
                  isActive: state.notifications,
                  onSwitcherChanged: (bool isActive) {
                    context
                        .read<GeneralSettingsBloc>()
                        .add(ToggleNotificationsEvent());
                  },
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
                  isActive: state.vibration,
                  onSwitcherChanged: (bool isActive) {
                    context
                        .read<GeneralSettingsBloc>()
                        .add(ToggleVibrationEvent());
                  },
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
                  isActive: state.cloudSync,
                  onSwitcherChanged: (bool isActive) {
                    context
                        .read<GeneralSettingsBloc>()
                        .add(ToggleCloudSyncEvent());
                  },
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
                  onPressed: () => _openPrivacySettings(context),
                ),
                const SizedBox(height: 5),
                Divider(
                  color: colorScheme.onBackground,
                  endIndent: 10,
                  indent: 10,
                ),
                const SizedBox(height: 5),
                SettingsPageTransitionRow(
                  icon: Icons.logout,
                  text: "Logout",
                  onPressed: () {},
                ),
              ],
            ),
          );
        }

        return Center(
          child: CircularProgressIndicator(
            color: colorScheme.onBackground,
          ),
        );
      },
    );
  }

  Future<void> _openPrivacySettings(BuildContext context) async {
    await AutoRouter.of(context).push(const PrivacySettingsRoute());
  }
}
