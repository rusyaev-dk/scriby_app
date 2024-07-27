import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/colors/color_palette.dart';

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  final Color primary;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color surfaceContainer;
  final Color surfaceContainerHighest;
  final Color surfaceContainerHigh;
  final Color surfaceContainerLow;
  final Color surfaceContainerLowest;
  final Color surfaceBright;
  final Color surfaceDim;
  final Color shimmer;

  final Color activatedFilterButtonColor;
  final Color inActivatedFilterButtonColor;
  final Color activatedThemeButtonColor;
  final Color inActivatedThemeButtonColor;

  const AppColorScheme.light()
      : primary = ColorPalette.black,
        onPrimary = ColorPalette.white,
        primaryContainer = const Color(0xFFC8BFE6),
        onPrimaryContainer = const Color(0xFF1E1833),
        secondary = const Color.fromARGB(255, 158, 158, 158),
        onSecondary = const Color.fromARGB(255, 63, 63, 63),
        secondaryContainer = const Color(0xFFDCD8E6),
        onSecondaryContainer = const Color(0xFF2C2933),
        tertiary = const Color(0xFF996576),
        onTertiary = const Color(0xFFFFFFFF),
        tertiaryContainer = const Color(0xFFE6CDD5),
        onTertiaryContainer = const Color(0xFF332227),
        error = const Color.fromARGB(255, 212, 45, 37),
        onError = const Color(0xFFFFFFFF),
        errorContainer = const Color(0xFFE6ACA9),
        onErrorContainer = const Color(0xFF330B09),
        background = ColorPalette.white,
        onBackground = ColorPalette.black,
        surface = const Color.fromARGB(255, 242, 242, 242),
        onSurface = const Color(0xFF323233),
        surfaceVariant = const Color(0xFFBABABA),
        onSurfaceVariant = const Color(0xFFDCDCDC),
        outline = const Color(0xFF8c8999),
        surfaceContainer = const Color(0xFFE6E1F2),
        surfaceContainerHighest = const Color(0xFFD1CAE1),
        surfaceContainerHigh = const Color(0xFFE0DAF2),
        surfaceContainerLow = const Color(0xFFF2F0FC),
        surfaceContainerLowest = const Color(0xFFFFFFFF),
        surfaceBright = const Color(0xFFFFFFFF),
        surfaceDim = const Color(0xFFFCF7FF),
        shimmer = ColorPalette.platinum,
        activatedFilterButtonColor = const Color(0xFFb2b2b2),
        inActivatedFilterButtonColor = const Color(0xFFe0e0e2),
        activatedThemeButtonColor = ColorPalette.white,
        inActivatedThemeButtonColor = const Color(0xFFDADADA);

  const AppColorScheme.dark()
      : primary = ColorPalette.white,
        onPrimary = ColorPalette.black,
        primaryContainer = const Color(0xFF211C33),
        onPrimaryContainer = const Color(0xFFC8BFE6),
        secondary = const Color(0xFF757477),
        onSecondary = const Color(0xFFFFFFFF),
        secondaryContainer = const Color(0xFF2C2933),
        onSecondaryContainer = const Color(0xFFDCD8E6),
        tertiary = const Color(0xFF7D5260),
        onTertiary = const Color(0xFFFFFFFF),
        tertiaryContainer = const Color(0xFF332227),
        onTertiaryContainer = const Color(0xFFE6CDD5),
        error = const Color(0xFFB3261E),
        onError = const Color(0xFFFFFFFF),
        errorContainer = const Color(0xFF330B09),
        onErrorContainer = const Color(0xFFE6ACA9),
        background = ColorPalette.black,
        onBackground = ColorPalette.white,
        surface = const Color(0xFF282828),
        onSurface = const Color(0xFF696969),
        surfaceVariant = const Color(0xFF49454F),
        onSurfaceVariant = const Color(0xFFCAC4D0),
        outline = const Color(0xFF938F99),
        surfaceContainer = const Color(0xFF242329),
        surfaceContainerHighest = const Color(0xFF3B383E),
        surfaceContainerHigh = const Color(0xFF2E2B32),
        surfaceContainerLow = const Color(0xFF1C1B1F),
        surfaceContainerLowest = const Color(0xFF121212),
        surfaceBright = const Color(0xFF36343B),
        surfaceDim = const Color(0xFF1C1A1F),
        shimmer = ColorPalette.platinum,
        activatedFilterButtonColor = const Color(0xFF4d4d4d),
        inActivatedFilterButtonColor = const Color(0xFF151515),
        activatedThemeButtonColor = DarkColorPalette.black,
        inActivatedThemeButtonColor = DarkColorPalette.darkestGrey;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.surfaceContainer,
    required this.surfaceContainerHighest,
    required this.surfaceContainerHigh,
    required this.surfaceContainerLow,
    required this.surfaceContainerLowest,
    required this.surfaceBright,
    required this.surfaceDim,
    required this.shimmer,
    required this.activatedFilterButtonColor,
    required this.inActivatedFilterButtonColor,
    required this.activatedThemeButtonColor,
    required this.inActivatedThemeButtonColor,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? primaryContainer,
    Color? onPrimaryContainer,
    Color? secondary,
    Color? onSecondary,
    Color? secondaryContainer,
    Color? onSecondaryContainer,
    Color? tertiary,
    Color? onTertiary,
    Color? tertiaryContainer,
    Color? onTertiaryContainer,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? background,
    Color? onBackground,
    Color? surface,
    Color? onSurface,
    Color? surfaceVariant,
    Color? onSurfaceVariant,
    Color? outline,
    Color? surfaceContainer,
    Color? surfaceContainerHighest,
    Color? surfaceContainerHigh,
    Color? surfaceContainerLow,
    Color? surfaceContainerLowest,
    Color? surfaceBright,
    Color? surfaceDim,
    Color? shimmer,
    Color? activatedFilterButtonColor,
    Color? inActivatedFilterButtonColor,
    Color? activatedThemeButtonColor,
    Color? inActivatedThemeButtonColor,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      primaryContainer: primaryContainer ?? this.primaryContainer,
      onPrimaryContainer: onPrimaryContainer ?? this.onPrimaryContainer,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      secondaryContainer: secondaryContainer ?? this.secondaryContainer,
      onSecondaryContainer: onSecondaryContainer ?? this.onSecondaryContainer,
      tertiary: tertiary ?? this.tertiary,
      onTertiary: onTertiary ?? this.onTertiary,
      tertiaryContainer: tertiaryContainer ?? this.tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer ?? this.onTertiaryContainer,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      surfaceVariant: surfaceVariant ?? this.surfaceVariant,
      onSurfaceVariant: onSurfaceVariant ?? this.onSurfaceVariant,
      outline: outline ?? this.outline,
      surfaceContainer: surfaceContainer ?? this.surfaceContainer,
      surfaceContainerHighest:
          surfaceContainerHighest ?? this.surfaceContainerHighest,
      surfaceContainerHigh: surfaceContainerHigh ?? this.surfaceContainerHigh,
      surfaceContainerLow: surfaceContainerLow ?? this.surfaceContainerLow,
      surfaceContainerLowest:
          surfaceContainerLowest ?? this.surfaceContainerLowest,
      surfaceBright: surfaceBright ?? this.surfaceBright,
      surfaceDim: surfaceDim ?? this.surfaceDim,
      shimmer: shimmer ?? this.shimmer,
      activatedFilterButtonColor:
          activatedFilterButtonColor ?? this.activatedFilterButtonColor,
      inActivatedFilterButtonColor:
          inActivatedFilterButtonColor ?? this.inActivatedFilterButtonColor,
      activatedThemeButtonColor:
          activatedThemeButtonColor ?? this.activatedThemeButtonColor,
      inActivatedThemeButtonColor:
          inActivatedThemeButtonColor ?? this.inActivatedThemeButtonColor,
    );
  }

  @override
  ThemeExtension<AppColorScheme> lerp(
    ThemeExtension<AppColorScheme>? other,
    double t,
  ) {
    if (other is! AppColorScheme) {
      return this;
    }

    return AppColorScheme._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      primaryContainer:
          Color.lerp(primaryContainer, other.primaryContainer, t)!,
      onPrimaryContainer:
          Color.lerp(onPrimaryContainer, other.onPrimaryContainer, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      secondaryContainer:
          Color.lerp(secondaryContainer, other.secondaryContainer, t)!,
      onSecondaryContainer:
          Color.lerp(onSecondaryContainer, other.onSecondaryContainer, t)!,
      tertiary: Color.lerp(tertiary, other.tertiary, t)!,
      onTertiary: Color.lerp(onTertiary, other.onTertiary, t)!,
      tertiaryContainer:
          Color.lerp(tertiaryContainer, other.tertiaryContainer, t)!,
      onTertiaryContainer:
          Color.lerp(onTertiaryContainer, other.onTertiaryContainer, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer:
          Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      surfaceVariant: Color.lerp(surfaceVariant, other.surfaceVariant, t)!,
      onSurfaceVariant:
          Color.lerp(onSurfaceVariant, other.onSurfaceVariant, t)!,
      outline: Color.lerp(outline, other.outline, t)!,
      surfaceContainer:
          Color.lerp(surfaceContainer, other.surfaceContainer, t)!,
      surfaceContainerHighest: Color.lerp(
          surfaceContainerHighest, other.surfaceContainerHighest, t)!,
      surfaceContainerHigh:
          Color.lerp(surfaceContainerHigh, other.surfaceContainerHigh, t)!,
      surfaceContainerLow:
          Color.lerp(surfaceContainerLow, other.surfaceContainerLow, t)!,
      surfaceContainerLowest:
          Color.lerp(surfaceContainerLowest, other.surfaceContainerLowest, t)!,
      surfaceBright: Color.lerp(surfaceBright, other.surfaceBright, t)!,
      surfaceDim: Color.lerp(surfaceDim, other.surfaceDim, t)!,
      shimmer: Color.lerp(shimmer, other.shimmer, t)!,
      activatedFilterButtonColor: Color.lerp(
          activatedFilterButtonColor, other.activatedFilterButtonColor, t)!,
      inActivatedFilterButtonColor: Color.lerp(
          inActivatedFilterButtonColor, other.inActivatedFilterButtonColor, t)!,
      activatedThemeButtonColor: Color.lerp(
          activatedThemeButtonColor, other.activatedThemeButtonColor, t)!,
      inActivatedThemeButtonColor: Color.lerp(
          inActivatedThemeButtonColor, other.inActivatedThemeButtonColor, t)!,
    );
  }

  static AppColorScheme of(BuildContext context) =>
      Theme.of(context).extension<AppColorScheme>()!;
}
