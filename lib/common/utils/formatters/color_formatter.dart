import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scriby_app/uikit/uikit.dart';

class ColorFormatter {
  static Color getContrastTextColor(String backgroundHexColor) {
    final Color backgroundColor =
        Color(int.tryParse(backgroundHexColor) ?? NoteColors.defaultHexColor);

    // Расчет яркости цвета по формуле WCAG
    double brightness = ((backgroundColor.red * 299) +
            (backgroundColor.green * 587) +
            (backgroundColor.blue * 114)) /
        1000;

    return brightness > 128 ? Colors.black : Colors.white;
  }

  static LinearGradient generateGradientFromHexColor(String hexColor) {
    final Color color =
        Color(int.tryParse(hexColor) ?? NoteColors.defaultHexColor);

    return LinearGradient(
      colors: [
        color,
        _adjustBrightness(color, 0.96),
        _adjustBrightness(color, 0.88),
      ],
      stops: const [0.45, 0.7, 0.88],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  static LinearGradient generateRandomGradient() {
    Color color = _getRandomColor();

    return LinearGradient(
      colors: [
        color,
        _adjustBrightness(color, 0.9),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [0.45, 0.88],
    );
  }

  static String getRandomHexColor() {
    final Random random = Random();

    final index = random.nextInt(NoteColors.noteHexColors.length);
    return NoteColors.noteHexColors[index].toString();
  }

  static Color _getRandomColor() {
    final Random random = Random();

    final index = random.nextInt(NoteColors.noteHexColors.length);
    return NoteColors.noteHexColors[index];
  }

  static Color _adjustBrightness(Color color, double factor) {
    assert(factor >= 0 && factor <= 1);
    return Color.fromARGB(
      color.alpha,
      (color.red * factor).round(),
      (color.green * factor).round(),
      (color.blue * factor).round(),
    );
  }
}
