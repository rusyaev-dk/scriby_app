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
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Title",
        hintStyle: AppTextScheme.of(context).display.copyWith(
            color: AppColorScheme.of(context).surfaceVariant.withOpacity(0.4)),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      style: const TextStyle(
        fontSize: 28.0,
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
    return TextField(
      controller: controller,
      maxLines: null,
      decoration: InputDecoration(
        hintText: "Enter your note here",
        hintStyle: AppTextScheme.of(context).headline.copyWith(
              fontSize: 21,
              color: AppColorScheme.of(context).surfaceVariant.withOpacity(0.4),
            ),
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
      ),
      style: const TextStyle(
        fontSize: 24.0, // Makes the text larger
      ),
    );
  }
}
