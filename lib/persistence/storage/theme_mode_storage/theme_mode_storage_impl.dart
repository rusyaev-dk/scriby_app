import 'package:flutter/material.dart';
import 'package:scriby_app/persistence/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeStorage implements IThemeModeStorage {
  ThemeModeStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<ThemeMode?> getThemeMode() async {
    final String? themeModeStr =
        _prefs.getString(ThemeModeStorageKeys.mode.keyName);
    if (themeModeStr?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhere((e) => e.name == themeModeStr);
  }

  @override
  Future<bool> setThemeMode(ThemeMode themeMode) async {
    final reuslt = await _prefs.setString(
      ThemeModeStorageKeys.mode.keyName,
      themeMode.name,
    );

    return reuslt;
  }
}

enum ThemeModeStorageKeys {
  mode("theme_mode");

  const ThemeModeStorageKeys(this.keyName);

  final String keyName;
}
