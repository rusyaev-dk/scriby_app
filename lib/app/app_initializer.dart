import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/app/app_config.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/all_notes/presentation/presentation.dart';
import 'package:scriby_app/features/pinned_notes/presentation/presentation.dart';
import 'package:scriby_app/features/search_notes/domain/domain.dart';
import 'package:scriby_app/features/settings/domain/domain.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

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

    final settingsStorage = SettingsStorage(prefs: appConfig.sharedPreferences);

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppConfig>(
          create: (context) => appConfig,
        ),
        RepositoryProvider<ILogger>(
          create: (context) => AppLogger(talker: appConfig.talker),
        ),
        RepositoryProvider<IThemeModeRepository>(
          create: (context) =>
              ThemeModeRepository(themeModeStorage: themeModeStorage),
        ),
        RepositoryProvider<INotesRepository>(
          create: (context) => NotesRepository(realm: appConfig.realm),
        ),
        RepositoryProvider<ISearchNotesRepository>(
          create: (context) => SearchNotesRepository(
            realm: appConfig.realm,
          ),
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
              logger: context.read<ILogger>(),
            ),
          ),
          BlocProvider(
            create: (context) => NotesManagerBloc(
              notesRepository: context.read<INotesRepository>(),
              logger: context.read<ILogger>(),
            ),
          ),
          BlocProvider(
            create: (context) => AllNotesBloc(
              notesRepository: context.read<INotesRepository>(),
              logger: context.read<ILogger>(),
            ),
          ),
          BlocProvider(
            create: (context) => PinnedNotesBloc(
              notesRepository: context.read<INotesRepository>(),
              logger: context.read<ILogger>(),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
