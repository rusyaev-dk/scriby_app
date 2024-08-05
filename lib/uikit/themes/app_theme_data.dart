import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/app_sizes.dart';
import 'package:scriby_app/uikit/colors/app_color_sheme.dart';
import 'package:scriby_app/uikit/gradients/gradients.dart';
import 'package:scriby_app/uikit/text/app_text_sheme.dart';

abstract class AppThemeData {
  static final lightTheme = ThemeData(
    extensions: [
      _lightColorScheme,
      _textScheme,
      _lightGradients,
    ],
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: _lightColorScheme.primary,
      onPrimary: _lightColorScheme.onPrimary,
      secondary: _lightColorScheme.secondary,
      onSecondary: _lightColorScheme.onSecondary,
      error: _lightColorScheme.error,
      onError: _lightColorScheme.onError,
      surface: _lightColorScheme.surface,
      surfaceContainer: _lightColorScheme.surfaceContainer,
      onSurface: _lightColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.background,
      elevation: AppSizes.double0,
      iconTheme: IconThemeData(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 14),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorScheme.background,
      selectedItemColor: _lightColorScheme.primary,
      unselectedItemColor: _lightColorScheme.onBackground,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: _lightColorScheme.background,
    )
  );

  static final darkTheme = ThemeData(
    extensions: [
      _darkColorScheme,
      _textScheme,
      _darkGradients,
    ],
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: _darkColorScheme.primary,
      onPrimary: _darkColorScheme.onPrimary,
      secondary: _darkColorScheme.secondary,
      onSecondary: _darkColorScheme.onSecondary,
      error: _darkColorScheme.error,
      onError: _darkColorScheme.onError,
      surface: _darkColorScheme.surface,
      surfaceContainer: _lightColorScheme.surfaceContainer,
      onSurface: _darkColorScheme.onSurface,
    ),
    scaffoldBackgroundColor: _darkColorScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightColorScheme.primary,
      elevation: 0,
      iconTheme: IconThemeData(
        color: _lightColorScheme.onPrimary,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkColorScheme.background,
      selectedItemColor: _darkColorScheme.primary,
      unselectedItemColor: _darkColorScheme.onBackground,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _darkColorScheme.onPrimary,
      ),
    ),
    dialogTheme: DialogTheme(
        backgroundColor: _darkColorScheme.background,
      )
  );

  static const _lightColorScheme = AppColorScheme.light();
  static const _darkColorScheme = AppColorScheme.dark();
  static final _textScheme = AppTextScheme.base();
  static const _lightGradients = AppGradients.light();
  static const _darkGradients = AppGradients.dark();
}
