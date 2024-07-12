import 'package:flutter/material.dart';
import 'package:scriby_app/core/navigation/router.dart';

class ScribyApp extends StatelessWidget {
  const ScribyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = AppRouter();

    return MaterialApp.router(
      title: "Scriby",
      routerConfig: router.config(),
    );
  }
}
