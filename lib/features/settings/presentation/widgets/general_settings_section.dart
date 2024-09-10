import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/core/navigation/router.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class GeneralSettingsSection extends StatelessWidget {
  const GeneralSettingsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<GeneralSettingsBloc, GeneralSettingsState>(
      builder: (context, state) {
        if (state is GeneralSettingsLoadedState) {
          final bool insertDividers = !Platform.isAndroid;
          List<Widget> dividers = [
            const SizedBox(height: 5),
            Divider(
              color: colorScheme.onBackground,
              endIndent: 10,
              indent: 10,
            ),
          ];

          List<Widget> children = [
            SettingsSwitchRow(
              text: "Notifications",
              icon: Icons.notifications,
              isActive: state.notifications,
              onSwitchChanged: (bool isActive) {
                context
                    .read<GeneralSettingsBloc>()
                    .add(ToggleNotificationsEvent());
              },
            ),
            if (insertDividers) ...dividers,
            SettingsSwitchRow(
              text: "Vibration",
              icon: Icons.vibration,
              isActive: state.vibration,
              onSwitchChanged: (bool isActive) {
                context.read<GeneralSettingsBloc>().add(ToggleVibrationEvent());
              },
            ),
            if (insertDividers) ...dividers,
            SettingsSwitchRow(
              text: "Cloud sync",
              icon: Icons.sync,
              isActive: state.cloudSync,
              onSwitchChanged: (bool isActive) {
                context.read<GeneralSettingsBloc>().add(ToggleCloudSyncEvent());
              },
            ),
            if (insertDividers) ...dividers,
            SettingsSwitchRow(
              text: "Note autosave",
              icon: Icons.save,
              isActive: state.autosave,
              onSwitchChanged: (bool isActive) {
                context.read<GeneralSettingsBloc>().add(ToggleAutosaveEvent());
              },
            ),
            if (insertDividers) ...dividers,
            SettingsPageTransitionRow(
              icon: Icons.security,
              text: "Privacy",
              onPressed: () => _openPrivacySettings(context),
            ),
            if (insertDividers) ...dividers,
            SettingsPageTransitionRow(
              icon: Icons.logout,
              text: "Logout",
              onPressed: () {},
            ),
          ];

          if (!Platform.isIOS) {
            return SizedBox(
              width: double.infinity,
              child: CupertinoFormSection(
                children: children,
              ),
            );
          }

          return SizedBox(
            width: double.infinity,
            child: Column(
              children: children,
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
