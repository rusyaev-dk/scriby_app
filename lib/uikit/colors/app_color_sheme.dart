import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/colors/color_palette.dart';

const _skeletonOpacity = 0.06;

@immutable
class AppColorScheme extends ThemeExtension<AppColorScheme> {
  /// Base branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  final Color primary;

  /// The color of the text on [primary].
  final Color onPrimary;

  /// Secondary branding color for the app.
  ///
  /// Can be used as an accent color for buttons, switches, labels, icons, etc.
  ///
  /// Complements [primary] color.
  final Color secondary;

  /// The color of the text on [secondary].
  final Color onSecondary;

  /// Surface color.
  ///
  /// Usually, the background color of cards, alerts, dialogs, bottom sheets, etc
  /// is considered a surface.
  final Color surface;

  /// Secondary surface color.
  ///
  /// Usually, the background color of cards, alerts, dialogs, bottom sheets, etc
  /// is considered a surface.
  final Color surfaceSecondary;

  final Color onSurface;

  final Color background;

  final Color backgroundSecondary;

  final Color backgroundTertiary;

  final Color tetradicBackground;

  final Color onBackground;

  final Color onBackgroundSecondary;

  final Color danger;

  final Color dangerSecondary;

  /// The color of the text on [danger].
  final Color onDanger;

  /// Color of text in text field.
  final Color textField;

  /// Color of label in text field.
  final Color textFieldLabel;

  /// Color of helper text in text field.
  final Color textFieldHelper;

  /// Color of border and cursor in text field.
  final Color frameTextFieldSecondary;

  /// Color of inactive elements.
  final Color inactive;

  /// Positive color.
  ///
  /// Typically used for informational success messages.
  final Color positive;

  final Color onPositive;

  final Color skeletonPrimary;

  final Color skeletonOnPrimary;

  final Color skeletonSecondary;

  final Color skeletonTertiary;

  final Color shimmer;

  final Color surfaceDarker;
  final Color activatedFilterButtonColor;
  final Color inActivatedFilterButtonColor;
  final Color activatedThemeButtonColor;
  final Color inActivatedThemeButtonColor;

  AppColorScheme.light()
      : primary = ColorPalette.white,
        onPrimary = ColorPalette.black,
        secondary = ColorPalette.grey,
        onSecondary = ColorPalette.chineseBlack,
        surface = ColorPalette.white,
        surfaceSecondary = ColorPalette.cultured,
        onSurface = ColorPalette.chineseBlack,
        background = ColorPalette.cultured,
        backgroundSecondary = ColorPalette.darkScarlet,
        backgroundTertiary = ColorPalette.cultured,
        onBackground = ColorPalette.chineseBlack,
        onBackgroundSecondary = ColorPalette.white,
        danger = ColorPalette.folly,
        dangerSecondary = ColorPalette.vividRaspberry,
        onDanger = ColorPalette.white,
        textField = ColorPalette.chineseBlack,
        textFieldLabel = ColorPalette.black,
        textFieldHelper = ColorPalette.black,
        frameTextFieldSecondary = ColorPalette.chineseBlack,
        inactive = ColorPalette.black,
        positive = ColorPalette.greenYellow,
        onPositive = ColorPalette.chineseBlack,
        skeletonPrimary = ColorPalette.black.withOpacity(_skeletonOpacity),
        skeletonOnPrimary = ColorPalette.white,
        skeletonSecondary = ColorPalette.cultured,
        skeletonTertiary = ColorPalette.lightSilver,
        tetradicBackground = ColorPalette.lightGreen,
        shimmer = ColorPalette.platinum,
        surfaceDarker = const Color(0xFFf5f6f6),
        activatedFilterButtonColor = const Color(0xFFb2b2b2),
        inActivatedFilterButtonColor = const Color(0xFFe0e0e2),
        activatedThemeButtonColor = ColorPalette.white,
        inActivatedThemeButtonColor = const Color(0xFFf5f6f6);

  AppColorScheme.dark()
      : primary = ColorPalette.black,
        onPrimary = DarkColorPalette.white,
        secondary = ColorPalette.grey,
        onSecondary = DarkColorPalette.black,
        surface = DarkColorPalette.darkestGrey,
        surfaceSecondary = DarkColorPalette.raisinBlack,
        onSurface = DarkColorPalette.white,
        background = DarkColorPalette.raisinBlack,
        backgroundSecondary = DarkColorPalette.maroon,
        backgroundTertiary = DarkColorPalette.raisinBlack,
        onBackground = DarkColorPalette.white,
        onBackgroundSecondary = DarkColorPalette.white,
        danger = DarkColorPalette.brinkPink,
        dangerSecondary = DarkColorPalette.cyclamen,
        onDanger = DarkColorPalette.white,
        textField = DarkColorPalette.lightSilver,
        textFieldLabel = DarkColorPalette.white,
        textFieldHelper = DarkColorPalette.black,
        frameTextFieldSecondary = DarkColorPalette.lightSilver,
        inactive = DarkColorPalette.black,
        positive = DarkColorPalette.inchworm,
        onPositive = DarkColorPalette.black,
        skeletonPrimary = DarkColorPalette.black.withOpacity(_skeletonOpacity),
        skeletonOnPrimary = DarkColorPalette.white,
        skeletonSecondary = DarkColorPalette.raisinBlack,
        skeletonTertiary = DarkColorPalette.lightSilver,
        tetradicBackground = DarkColorPalette.etonBlue,
        shimmer = ColorPalette.platinum,
        surfaceDarker = const Color(0xFF151515),
        activatedFilterButtonColor = const Color(0xFF4d4d4d),
        inActivatedFilterButtonColor = const Color(0xFF151515),
        activatedThemeButtonColor = DarkColorPalette.black,
        inActivatedThemeButtonColor = DarkColorPalette.darkestGrey;

  const AppColorScheme._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.surfaceSecondary,
    required this.onSurface,
    required this.background,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.onBackground,
    required this.onBackgroundSecondary,
    required this.danger,
    required this.dangerSecondary,
    required this.onDanger,
    required this.textField,
    required this.textFieldLabel,
    required this.textFieldHelper,
    required this.frameTextFieldSecondary,
    required this.inactive,
    required this.positive,
    required this.onPositive,
    required this.skeletonPrimary,
    required this.skeletonOnPrimary,
    required this.skeletonSecondary,
    required this.skeletonTertiary,
    required this.tetradicBackground,
    required this.shimmer,
    required this.surfaceDarker,
    required this.activatedFilterButtonColor,
    required this.inActivatedFilterButtonColor,
    required this.activatedThemeButtonColor,
    required this.inActivatedThemeButtonColor,
  });

  @override
  ThemeExtension<AppColorScheme> copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? surfaceSecondary,
    Color? onSurface,
    Color? background,
    Color? backgroundSecondary,
    Color? backgroundTertiary,
    Color? onBackground,
    Color? onBackgroundSecondary,
    Color? danger,
    Color? dangerSecondary,
    Color? onDanger,
    Color? textField,
    Color? textFieldLabel,
    Color? textFieldHelper,
    Color? frameTextFieldSecondary,
    Color? inactive,
    Color? positive,
    Color? onPositive,
    Color? skeletonPrimary,
    Color? skeletonOnPrimary,
    Color? skeletonSecondary,
    Color? skeletonTertiary,
    Color? tetradicBackground,
    Color? shimmer,
    Color? surfaceDarker,
    Color? activatedFilterButtonColor,
    Color? inActivatedFilterButtonColor,
    Color? activatedThemeButtonColor,
    Color? inActivatedThemeButtonColor,
  }) {
    return AppColorScheme._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
      onBackground: onBackground ?? this.onBackground,
      onBackgroundSecondary:
          onBackgroundSecondary ?? this.onBackgroundSecondary,
      danger: danger ?? this.danger,
      dangerSecondary: dangerSecondary ?? this.dangerSecondary,
      onDanger: onDanger ?? this.onDanger,
      textField: textField ?? this.textField,
      textFieldLabel: textFieldLabel ?? this.textFieldLabel,
      textFieldHelper: textFieldHelper ?? this.textFieldHelper,
      frameTextFieldSecondary:
          frameTextFieldSecondary ?? this.frameTextFieldSecondary,
      inactive: inactive ?? this.inactive,
      positive: positive ?? this.positive,
      onPositive: onPositive ?? this.onPositive,
      skeletonPrimary: skeletonPrimary ?? this.skeletonPrimary,
      skeletonOnPrimary: skeletonOnPrimary ?? this.skeletonOnPrimary,
      skeletonSecondary: skeletonSecondary ?? this.skeletonSecondary,
      skeletonTertiary: skeletonTertiary ?? this.skeletonTertiary,
      tetradicBackground: tetradicBackground ?? this.tetradicBackground,
      shimmer: shimmer ?? this.shimmer,
      surfaceDarker: surfaceDarker ?? this.surfaceDarker,
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
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary:
          Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      backgroundTertiary:
          Color.lerp(backgroundTertiary, other.backgroundTertiary, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackgroundSecondary:
          Color.lerp(onBackgroundSecondary, other.onBackgroundSecondary, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerSecondary: Color.lerp(dangerSecondary, other.dangerSecondary, t)!,
      onDanger: Color.lerp(onDanger, other.onDanger, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      textFieldLabel: Color.lerp(textFieldLabel, other.textFieldLabel, t)!,
      textFieldHelper: Color.lerp(textFieldHelper, other.textFieldHelper, t)!,
      frameTextFieldSecondary: Color.lerp(
          frameTextFieldSecondary, other.frameTextFieldSecondary, t)!,
      inactive: Color.lerp(inactive, other.inactive, t)!,
      positive: Color.lerp(positive, other.positive, t)!,
      onPositive: Color.lerp(onPositive, other.onPositive, t)!,
      skeletonPrimary: Color.lerp(skeletonPrimary, other.skeletonPrimary, t)!,
      skeletonOnPrimary:
          Color.lerp(skeletonOnPrimary, other.skeletonOnPrimary, t)!,
      skeletonSecondary:
          Color.lerp(skeletonSecondary, other.skeletonSecondary, t)!,
      skeletonTertiary:
          Color.lerp(skeletonTertiary, other.skeletonTertiary, t)!,
      tetradicBackground:
          Color.lerp(tetradicBackground, other.tetradicBackground, t)!,
      shimmer: Color.lerp(shimmer, other.shimmer, t)!,
      surfaceDarker: Color.lerp(surfaceDarker, other.surfaceDarker, t)!,
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
