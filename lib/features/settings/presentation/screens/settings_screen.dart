import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/settings/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        foregroundColor: colorScheme.onBackground,
        leading: const PopScreenButton(),
        actionsIconTheme: IconThemeData(
          color: colorScheme.onBackground,
        ),
        title: Text(
          "Settings",
          style: textScheme.headline.copyWith(
            fontSize: 25,
            color: colorScheme.onBackground,
          ),
        ),
      ),
      body: DisableScrollStretching(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.only(right: 10, left: 10, bottom: 30, top: 15),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const GeneralSettings(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.195),
                const ThemeSwitcherRow(),
                const SizedBox(height: 20),
                SettingsButtonRow(
                  icon: Icons.delete,
                  backgroundColor: colorScheme.error,
                  text: "Delete all notes",
                  onPressed: () => _deleteAllNotes(context),
                ),
                const SizedBox(height: 20),
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
        ),
      ),
    );
  }

  Future<void> _deleteAllNotes(BuildContext context) async {
    final bool deleteConfirmation =
        await _showDeleteAllNotesDialog(context) ?? false;

    if (context.mounted && deleteConfirmation) {
      BlocProvider.of<AllNotesBloc>(context).add(DeleteAllNotesEvent());
    }
  }

  Future<bool?> _showDeleteAllNotesDialog(BuildContext context) async {
    return await showDialog<bool>(
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
}
