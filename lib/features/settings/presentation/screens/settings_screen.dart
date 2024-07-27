import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        foregroundColor: colorScheme.onBackground,
        leading: const PopScreenButton(),
        actionsIconTheme: IconThemeData(
          color: colorScheme.onBackground,
        ),
        title: Text(
          "General settings",
          style: textScheme.headline.copyWith(
            fontSize: 25,
            color: colorScheme.onBackground,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(right: 10, left: 10, bottom: 30, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const GeneralSettings(),
              const SizedBox(height: 80),
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
    );
  }

  Future<void> _deleteAllNotes(BuildContext context) async {
    // await AlertDialog();
    context.read<AllNotesBloc>().add(DeleteAllNotesEvent());
  }
}
