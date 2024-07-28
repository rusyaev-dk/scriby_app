import 'package:flutter/material.dart';

abstract interface class IThemeModeStorage {
  Future<ThemeMode?> getThemeMode();
  Future<bool> setThemeMode(ThemeMode themeMode);
}
