import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
import 'package:scriby_app/core/navigation/navigation.dart';
import 'package:scriby_app/features/settings/domain/domain.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage(name: "GeneralSettingsShellRoute")
class GeneralSettingsShellScreen extends AutoRouter {
  const GeneralSettingsShellScreen({super.key});
}

@RoutePage(name: "GeneralSettingsRoute")
class GeneralSettingsScreen extends StatelessWidget {
  const GeneralSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneralSettingsBloc(
        generalSettingsRepository:
            RepositoryProvider.of<IGeneralSettingsRepository>(context),
        logger: RepositoryProvider.of<ILogger>(context),
      ),
      child: const GeneralSettingsView(),
    );
  }
}

class GeneralSettingsView extends StatelessWidget {
  const GeneralSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Scaffold(
      appBar: Platform.isIOS
          ? CupertinoNavigationBar(
              padding: EdgeInsetsDirectional.zero,
              leading: const Padding(
                padding: EdgeInsets.all(7),
                child: PopScreenButton(
                  iconSize: 25,
                ),
              ),
              middle: Text(
                "Settings",
                style: textScheme.headline.copyWith(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                  color: colorScheme.onBackground,
                ),
              ),
              backgroundColor: colorScheme.settingsBackgroundColor,
            )
          : AppBar(
              forceMaterialTransparency: true,
              leading: const Padding(
                padding: EdgeInsets.all(7),
                child: PopScreenButton(
                  iconSize: 25,
                ),
              ),
              title: Text(
                "Settings",
                style: textScheme.headline.copyWith(
                  fontSize: 25,
                  color: colorScheme.onBackground,
                ),
              ),
              toolbarHeight: 60,
              leadingWidth: 60,
            ),
      backgroundColor:
          Platform.isIOS ? colorScheme.settingsBackgroundColor : null,
      body: DisableScrollStretching(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              right: Platform.isIOS ? 20 : 15,
              left: Platform.isIOS ? 20 : 15,
              bottom: 30,
              top: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const GeneralSettingsTopSection(),
                const SizedBox(height: 30),
                SettingsSectionForm(
                  children: [
                    SettingsButtonRow(
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: colorScheme.surfaceVariant,
                      ),
                      text: "Appearance",
                      onPressed: () => _openAppearanceSettings(context),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SettingsSectionForm(
                  children: [
                    SettingsButtonRow(
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: colorScheme.surfaceVariant,
                      ),
                      text: "Privacy",
                      onPressed: () => _openPrivacySettings(context),
                    ),
                    if (Platform.isAndroid) const SizedBox(height: 5),
                    Divider(
                      thickness: 0.4,
                      color: colorScheme.onBackground,
                      endIndent: 0,
                      indent: 18,
                    ),
                    SettingsButtonRow(
                      suffixIcon: Icon(
                        Icons.arrow_forward_ios,
                        size: 25,
                        color: colorScheme.surfaceVariant,
                      ),
                      text: "Logout",
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SettingsButtonRow(
                  backgroundColor: colorScheme.sectionBackgroundColor,
                  isDestructiveAction: true,
                  text: "Delete all notes",
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                  onPressed: () => _deleteAllNotes(context),
                ),
                const SizedBox(height: 20),
                const AppVersionWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _deleteAllNotes(BuildContext context) async {
    final bool confirmDelete =
        await _showDeleteAllNotesDialog(context) ?? false;

    if (context.mounted && confirmDelete) {
      BlocProvider.of<NotesManagerBloc>(context).add(DeleteAllNotesEvent());
    }
  }

  Future<bool?> _showDeleteAllNotesDialog(BuildContext context) async {
    return await showDialog<bool?>(
      context: context,
      builder: (context) {
        return AppAlertDialog(
          actions: [
            AppAlertDialogAction(
              isDestructiveAction: true,
              onPressed: () => AutoRouter.of(context).maybePop(true),
              child: const Text("Yes"),
            ),
            AppAlertDialogAction(
              onPressed: () => AutoRouter.of(context).maybePop(false),
              child: const Text("Cancel"),
            ),
          ],
          title: const Text("Delete all notes?"),
          content: const Text("This action cannot be undone"),
        );
      },
    );
  }

  Future<void> _openPrivacySettings(BuildContext context) async {
    await AutoRouter.of(context).push(const PrivacySettingsRoute());
  }

  Future<void> _openAppearanceSettings(BuildContext context) async {
    await AutoRouter.of(context).push(const AppearanceSettingsRoute());
  }
}

class AppVersionWidget extends StatelessWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Text(
      "App version: 1.0.0",
      style: textScheme.headline.copyWith(
        fontSize: 18,
        color: colorScheme.surfaceVariant,
      ),
    );
  }
}
