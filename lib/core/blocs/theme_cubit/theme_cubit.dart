import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/domain.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({
    required IThemeModeRepository themeModeRepository,
    required ILogger logger,
  })  : _themeModeRepository = themeModeRepository,
        _logger = logger,
        super(const ThemeState(themeMode: ThemeMode.system)) {
    _restoreTheme();
  }

  final IThemeModeRepository _themeModeRepository;
  final ILogger _logger;

  Future<void> _restoreTheme() async {
    try {
      final ThemeMode? themeMode = await _themeModeRepository.getThemeMode();
      if (themeMode == null) return;

      emit(ThemeState(themeMode: themeMode));
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }

  Future<void> setTheme(ThemeMode themeMode) async {
    try {
      final bool success = await _themeModeRepository.setThemeMode(themeMode);
      if (success) {
        emit(ThemeState(themeMode: themeMode));
      }
    } catch (exception, stackTrace) {
      _logger.exception(exception, stackTrace);
    }
  }
}
