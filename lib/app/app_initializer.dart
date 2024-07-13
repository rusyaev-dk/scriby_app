import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/app/app_config.dart';
import 'package:scriby_app/core/domain/repositories/my_notes/my_notes_repository.dart';
import 'package:scriby_app/core/domain/repositories/my_notes/my_notes_repository_interface.dart';
import 'package:scriby_app/features/my_notes/presentation/my_notes_bloc/my_notes_bloc.dart';

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<MyNotesRepositoryI>(
          create: (context) => MyNotesRepository(realm: appConfig.realm),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
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
