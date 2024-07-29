import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/app/app_config.dart';
import 'package:scriby_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:scriby_app/core/domain/repositories/notes/notes.dart';
import 'package:scriby_app/core/domain/repositories/theme_mode/theme_mode.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/features/new_note/presentation/presentation.dart';
import 'package:scriby_app/features/settings/domain/repositories/repositories.dart';
import 'package:scriby_app/features/settings/presentation/blocs/blocs.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

import '../common/utils/utils.dart';

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
    final themeModeStorage =
        ThemeModeStorage(prefs: appConfig.sharedPreferences);

    final logger = AppLogger(talker: appConfig.talker);
    final settingsStorage = SettingsStorage(prefs: appConfig.sharedPreferences);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ILogger>(create: (context) => logger),
        RepositoryProvider<IThemeModeRepository>(
          create: (context) =>
              ThemeModeRepository(themeModeStorage: themeModeStorage),
        ),
        RepositoryProvider<INotesRepository>(
          create: (context) => NotesRepository(realm: appConfig.realm),
        ),
        RepositoryProvider<IGeneralSettingsRepository>(
          create: (context) => GeneralSettingsRepository(
            settingsStorage: settingsStorage,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(
              themeModeRepository: context.read<IThemeModeRepository>(),
              logger: logger,
            ),
          ),
          BlocProvider(
            create: (context) => AllNotesBloc(
              notesRepository: context.read<INotesRepository>(),
              logger: logger,
            ),
          ),
          BlocProvider(
            create: (context) => NewNoteBloc(
              notesRepository: context.read<INotesRepository>(),
              logger: logger,
            ),
          ),
          BlocProvider(
            create: (context) => GeneralSettingsBloc(
              generalSettingsRepository:
                  context.read<IGeneralSettingsRepository>(),
              logger: logger,
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
