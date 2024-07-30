import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.height = 50,
    this.icon,
    this.borderColor,
  });

  factory ThemeSwitchButton.withSubtitle({
    required String title,
    required String subtitle,
    required void Function() onPressed,
    double? height,
    Color? backgroundColor,
    Color? borderColor,
  }) =>
      _ThemeSwitchButtonWithSubtitle(
        title: title,
        subtitle: subtitle,
        onPressed: onPressed,
        height: height,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
      );

  final String title;
  final void Function() onPressed;
  final double? height;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    final Color textColor = colorScheme.onBackground;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: 1.5,
                )
              : null,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
              ),
              const SizedBox(height: 10),
              Text(
                title,
                style: textScheme.label.copyWith(
                  fontSize: 16,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeSwitchButtonWithSubtitle extends ThemeSwitchButton {
  const _ThemeSwitchButtonWithSubtitle({
    required super.title,
    required this.subtitle,
    required super.onPressed,
    super.height,
    super.backgroundColor,
    super.borderColor,
  });

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    final Color textColor = colorScheme.onBackground;

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: 1.5,
                )
              : null,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textScheme.label.copyWith(
                  fontSize: 15,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                subtitle,
                maxLines: 3,
                style: textScheme.label.copyWith(
                  fontSize: 14,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
