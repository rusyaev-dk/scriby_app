import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final Gradient shimmerGradient;

  static const List<Color> _darkGradientColors = [
    Color(0xFF212121),
    Color(0xFF212121),
    Color(0xFF444444),
    Color(0xFF212121),
    Color(0xFF212121),
  ];

  static const List<Color> _lightGradientColors = [
    Color(0xFFa7a7a7),
    Color(0xFFa7a7a7),
    Color(0xFFc7c7c7),
    Color(0xFFa7a7a7),
    Color(0xFFa7a7a7),
  ];

  const AppGradients.light()
      : shimmerGradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: _lightGradientColors,
          stops: <double>[0.0, 0.35, 0.5, 0.65, 1.0],
        );

  const AppGradients.dark()
      : shimmerGradient = const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: _darkGradientColors,
          stops: <double>[0.0, 0.45, 0.5, 0.65, 1.0],
        );

  const AppGradients({
    required this.shimmerGradient,
  });

  @override
  ThemeExtension<AppGradients> lerp(
    ThemeExtension<AppGradients>? other,
    double t,
  ) {
    if (other is! AppGradients) {
      return this;
    }

    return AppGradients(
      shimmerGradient:
          Gradient.lerp(shimmerGradient, other.shimmerGradient, t)!,
    );
  }

  @override
  ThemeExtension<AppGradients> copyWith({
    Gradient? shimmerGradient,
  }) {
    return AppGradients(
      shimmerGradient: shimmerGradient ?? this.shimmerGradient,
    );
  }

  static AppGradients of(BuildContext context) {
    return Theme.of(context).extension<AppGradients>() ??
        _throwThemeExceptionFromFunc(context);
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppGradients not found in $context');
