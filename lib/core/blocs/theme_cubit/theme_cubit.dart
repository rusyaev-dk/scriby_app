import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/core/domain/repositories/settings/settings.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required SettingsRepositoryI settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(const ThemeState(themeMode: ThemeMode.system)) {
    _restoreTheme();
  }

  final SettingsRepositoryI _settingsRepository;

  Future<void> _restoreTheme() async {
    final ThemeMode themeMode;
    try {
      themeMode = await _settingsRepository.getCurrentTheme();
    } catch (err, stackTrace) {
      return;
    }

    emit(ThemeState(themeMode: themeMode));
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    try {
      await _settingsRepository.setTheme(themeMode);
      emit(ThemeState(themeMode: themeMode));
    } catch (err, stackTrace) {
      return;
    }
  }
}
