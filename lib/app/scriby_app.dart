import 'package:flutter/material.dart';
import 'package:scriby_app/app/app_config.dart';
import 'package:scriby_app/app/app_initializer.dart';
import 'package:scriby_app/core/navigation/router.dart';

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
      appConfig: widget.appConfig, // there will be theme cubit between them
      child: MaterialApp.router(
        title: "Scriby",
        routerConfig: router.config(),
      ),
    );
  }
}
