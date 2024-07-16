import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/app/app_config.dart';
import 'package:scriby_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes.dart';
import 'package:scriby_app/core/domain/repositories/settings/settings.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/new_note/presentation/presentation.dart';
import 'package:scriby_app/persistence/storage/key_value_storage/key_value_storage.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({
    super.key,
    required this.appConfig,
    required this.child,
  });

  final AppConfig appConfig;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final sharedPrefsStorage =
        SharedPrefsStorage(prefs: appConfig.sharedPreferences);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsRepositoryI>(
          create: (context) =>
              SettingsRepository(keyValueStorage: sharedPrefsStorage),
        ),
        RepositoryProvider<NotesRepositoryI>(
          create: (context) => NotesRepository(realm: appConfig.realm),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(
              settingsRepository: context.read<SettingsRepositoryI>(),
            ),
          ),
          BlocProvider(
            create: (context) => HomeBloc(
              notesRepository: context.read<NotesRepositoryI>(),
            ),
          ),
          BlocProvider(
            create: (context) => NewNoteBloc(
              notesRepository: context.read<NotesRepositoryI>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
