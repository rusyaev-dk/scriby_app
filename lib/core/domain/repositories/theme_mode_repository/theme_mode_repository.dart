import 'package:flutter/material.dart';
import 'package:scriby_app/core/domain/repositories/theme_mode_repository/theme_mode.dart';
import 'package:scriby_app/persistence/storage/storage.dart';

class ThemeModeRepository implements IThemeModeRepository {
  ThemeModeRepository({
    required IThemeModeStorage themeModeStorage,
  }) : _themeModeStorage = themeModeStorage;

  final IThemeModeStorage _themeModeStorage;

  @override
  Future<ThemeMode?> getThemeMode() async {
    return await _themeModeStorage.getThemeMode();
  }

  @override
  Future<bool> setThemeMode(ThemeMode themeMode) async {
    return await _themeModeStorage.setThemeMode(themeMode);
  }
}
