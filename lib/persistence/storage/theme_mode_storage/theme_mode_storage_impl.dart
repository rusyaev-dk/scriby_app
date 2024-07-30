import 'package:flutter/material.dart';
import 'package:scriby_app/persistence/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeStorage implements IThemeModeStorage {
  ThemeModeStorage({required SharedPreferences prefs}) : _prefs = prefs;

  final SharedPreferences _prefs;

  @override
  Future<ThemeMode?> getThemeMode() async {
    final String? themeModeStr =
        _prefs.getString(LocalStorageKeys.themeModeKey);
    if (themeModeStr?.isEmpty ?? true) return null;

    return ThemeMode.values.firstWhere((e) => e.name == themeModeStr);
  }

  @override
  Future<bool> setThemeMode(ThemeMode themeMode) async {
    final reuslt = await _prefs.setString(
      LocalStorageKeys.themeModeKey,
      themeMode.name,
    );

    return reuslt;
  }
}
