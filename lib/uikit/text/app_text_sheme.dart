import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/text/app_text_style.dart';

class AppTextScheme extends ThemeExtension<AppTextScheme> {
  /// Text style with a size of 45/52.
  /// Use for short, important text or numerals.
  final TextStyle display;

  /// Text style with a size of 28/36.
  /// Use for marking primary passages of text or important regions of content.
  final TextStyle headline;

  /// Text style with a size of 12/16.
  /// Use for things like the text inside components or for very small text in the content body.
  final TextStyle label;

  const AppTextScheme._({
    required this.display,
    required this.headline,
    required this.label,
  });

  AppTextScheme.base()
      : display = AppTextStyle.displayMedium.value,
        headline = AppTextStyle.headlineMedium.value,
        label = AppTextStyle.labelMedium.value;

  @override
  ThemeExtension<AppTextScheme> lerp(
    ThemeExtension<AppTextScheme>? other,
    double t,
  ) {
    if (other is! AppTextScheme) {
      return this;
    }

    return AppTextScheme._(
      display: TextStyle.lerp(display, other.display, t)!,
      headline: TextStyle.lerp(headline, other.headline, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
    );
  }

  static AppTextScheme of(BuildContext context) {
    return Theme.of(context).extension<AppTextScheme>() ??
        _throwThemeExceptionFromFunc(context);
  }

  @override
  AppTextScheme copyWith({
    TextStyle? display,
    TextStyle? headline,
    TextStyle? label,
  }) {
    return AppTextScheme._(
      display: display ?? this.display,
      headline: headline ?? this.headline,
      label: label ?? this.label,
    );
  }
}

Never _throwThemeExceptionFromFunc(BuildContext context) =>
    throw Exception('$AppTextScheme not found in $context');
