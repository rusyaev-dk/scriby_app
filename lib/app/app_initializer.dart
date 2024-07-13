import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/app/app_config.dart';
import 'package:scriby_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:scriby_app/core/domain/repositories/my_notes/my_notes_repository.dart';
import 'package:scriby_app/core/domain/repositories/my_notes/my_notes_repository_interface.dart';
import 'package:scriby_app/core/domain/repositories/settings/settings.dart';
import 'package:scriby_app/features/my_notes/presentation/my_notes_bloc/my_notes_bloc.dart';
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
    final sharedPrefsStotage =
        SharedPrefsStorage(prefs: appConfig.sharedPreferences);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsRepositoryI>(
          create: (context) =>
              SettingsRepository(keyValueStorage: sharedPrefsStotage),
        ),
        RepositoryProvider<MyNotesRepositoryI>(
          create: (context) => MyNotesRepository(realm: appConfig.realm),
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
            create: (context) => MyNotesBloc(
              myNotesRepository: context.read<MyNotesRepositoryI>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
