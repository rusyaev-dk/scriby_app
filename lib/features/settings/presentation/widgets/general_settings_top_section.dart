import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class GeneralSettingsTopSection extends StatelessWidget {
  const GeneralSettingsTopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    return BlocBuilder<GeneralSettingsBloc, GeneralSettingsState>(
      builder: (context, state) {
        if (state is GeneralSettingsLoadedState) {
          List<Widget> dividers = [
            if (Platform.isAndroid) const SizedBox(height: 5),
            Divider(
              thickness: 0.5,
              color: colorScheme.onBackground,
              endIndent: 0,
              indent: 18,
            ),
          ];

          return SettingsSectionForm(
            children: [
              SettingsSwitchRow(
                text: "Notifications",
                isActive: state.notifications,
                onSwitchChanged: (bool isActive) {
                  context
                      .read<GeneralSettingsBloc>()
                      .add(ToggleNotificationsEvent());
                },
              ),
              ...dividers,
              SettingsSwitchRow(
                text: "Vibration",
                isActive: state.vibration,
                onSwitchChanged: (bool isActive) {
                  context
                      .read<GeneralSettingsBloc>()
                      .add(ToggleVibrationEvent());
                },
              ),
              ...dividers,
              SettingsSwitchRow(
                text: "Cloud sync",
                isActive: state.cloudSync,
                onSwitchChanged: (bool isActive) {
                  context
                      .read<GeneralSettingsBloc>()
                      .add(ToggleCloudSyncEvent());
                },
              ),
              ...dividers,
              SettingsSwitchRow(
                text: "Note autosave",
                isActive: state.autosave,
                onSwitchChanged: (bool isActive) {
                  context
                      .read<GeneralSettingsBloc>()
                      .add(ToggleAutosaveEvent());
                },
              ),
            ],
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
}
