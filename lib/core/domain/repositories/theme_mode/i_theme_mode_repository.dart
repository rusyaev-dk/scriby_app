import 'package:flutter/material.dart';

abstract interface class IThemeModeRepository {
  Future<ThemeMode?> getThemeMode();
  Future<bool> setThemeMode(ThemeMode themeMode);
}
