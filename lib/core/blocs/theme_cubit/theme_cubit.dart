import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/core/domain/repositories/theme_mode/theme_mode.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required IThemeModeRepository themeModeRepository,
  })  : _themeModeRepository = themeModeRepository,
        super(const ThemeState(themeMode: ThemeMode.system)) {
    _restoreTheme();
  }

  final IThemeModeRepository _themeModeRepository;

  Future<void> _restoreTheme() async {
    final ThemeMode themeMode;
    try {
      themeMode = await _themeModeRepository.getThemeMode() ?? ThemeMode.system;
    } catch (err, stackTrace) {
      return;
    }

    emit(ThemeState(themeMode: themeMode));
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    try {
      final bool success = await _themeModeRepository.setThemeMode(themeMode);
      if (success) {
        emit(ThemeState(themeMode: themeMode));
      }
    } catch (err, stackTrace) {
      return;
    }
  }
}
