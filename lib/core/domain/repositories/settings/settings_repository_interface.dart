import 'package:flutter/material.dart';

extension ThemeModeX on ThemeMode {
  String asString() {
    switch (this) {
      case ThemeMode.system:
        return "system";
      case ThemeMode.dark:
        return "dark";
      case ThemeMode.light:
        return "light";
    }
  }

  static ThemeMode fromString(String? value) {
    if (value == null || value.isEmpty) {
      return ThemeMode.system;
    }

    switch (value) {
      case 'system':
        return ThemeMode.system;
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }
}

abstract interface class SettingsRepositoryI {
  Future<void> setTheme(ThemeMode themeMode);
  Future<ThemeMode> getCurrentTheme();
}
