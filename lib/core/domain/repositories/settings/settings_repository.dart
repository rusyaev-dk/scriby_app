import 'package:flutter/material.dart';
import 'package:scriby_app/core/domain/repositories/settings/settings.dart';
import 'package:scriby_app/persistence/storage/key_value_storage/key_value_storage.dart';

class SettingsRepository implements SettingsRepositoryI {
  SettingsRepository({
    required KeyValueStorageI keyValueStorage,
  }) : _keyValueStorage = keyValueStorage;

  final KeyValueStorageI _keyValueStorage;
  static const _themeModeKey = "theme_mode";

  @override
  Future<bool> setTheme(ThemeMode themeMode) async {
    return await _keyValueStorage.set<String>(
      key: _themeModeKey,
      value: themeMode.asString(),
    );
  }

  @override
  Future<ThemeMode> getCurrentTheme() async {
    final String? themeModeStr =
        await _keyValueStorage.get<String>(key: _themeModeKey);
    return ThemeModeX.fromString(themeModeStr);
  }
}
