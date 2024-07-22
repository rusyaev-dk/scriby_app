import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.color,
    this.height = 50,
    this.subtitle,
    this.icon,
    this.borderColor,
  });

  final String text;
  final void Function() onPressed;
  final Color color;
  final double height;
  final String? subtitle;
  final IconData? icon;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);
    final textScheme = AppTextScheme.of(context);

    final Color textColor = colorScheme.onBackground;

    Widget btnContent;
    if (subtitle != null && icon == null) {
      btnContent = Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: textScheme.label.copyWith(
              fontSize: 15,
              color: textColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subtitle!,
            maxLines: 3,
            style: textScheme.label.copyWith(
              fontSize: 14,
              color: textColor,
            ),
          ),
        ],
      );
    } else {
      btnContent = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: textScheme.label.copyWith(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      );
    }

    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                  width: 1.5,
                )
              : null,
        ),
        child: Center(
          child: btnContent,
        ),
      ),
    );
  }
}
