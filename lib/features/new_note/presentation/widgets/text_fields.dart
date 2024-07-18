import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class TitleTextField extends StatelessWidget {
  const TitleTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return TextField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: "Title",
        hintStyle: textScheme.display.copyWith(
          color: colorScheme.secondary.withOpacity(0.7),
          fontWeight: FontWeight.bold,
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      style: textScheme.display.copyWith(
        color: colorScheme.onBackground,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class MainInputTextField extends StatelessWidget {
  const MainInputTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textScheme = AppTextScheme.of(context);
    final colorScheme = AppColorScheme.of(context);

    return TextField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: "Enter your note here",
        hintStyle: textScheme.headline.copyWith(
          fontSize: 24.5,
          color: colorScheme.secondary.withOpacity(0.7),
        ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      cursorHeight: 40,
      style: textScheme.headline.copyWith(
        height: 1.5,
        color: colorScheme.onBackground,
        fontSize: 24.5,
      ),
    );
  }
}
