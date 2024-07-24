import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/app/app_config.dart';
import 'package:scriby_app/app/app_initializer.dart';
import 'package:scriby_app/core/blocs/theme_cubit/theme_cubit.dart';
import 'package:scriby_app/core/navigation/router.dart';
import 'package:scriby_app/uikit/themes/themes.dart';

class ScribyApp extends StatefulWidget {
  const ScribyApp({
    super.key,
    required this.appConfig,
  });

  final AppConfig appConfig;

  @override
  State<ScribyApp> createState() => _ScribyAppState();
}

class _ScribyAppState extends State<ScribyApp> {
  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return AppInitializer(
      appConfig: widget.appConfig,
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            themeMode: state.themeMode,
            title: "Scriby",
            debugShowCheckedModeBanner: false,
            routerConfig: router.config(
              navigatorObservers: () => [
                CustomNavigationObserver(),
              ],
            ),
          );
        },
      ),
    );
  }
}
