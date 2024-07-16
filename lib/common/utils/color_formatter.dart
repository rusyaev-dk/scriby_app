import 'dart:math';

import 'package:flutter/material.dart';

class ColorFormatter {
  static const _defaultHexColor = 0xFFABCD;

  static Color getContrastTextColor(String backgroundHexColor) {
    final Color backgroundColor =
        Color(int.tryParse(backgroundHexColor) ?? _defaultHexColor);

    // Расчет яркости цвета по формуле WCAG
    double brightness = ((backgroundColor.red * 299) +
            (backgroundColor.green * 587) +
            (backgroundColor.blue * 114)) /
        1000;

    return brightness > 128 ? Colors.black : Colors.white;
  }

  static LinearGradient generateGradientFromHexColor(String hexColor) {
    final Color color = Color(int.tryParse(hexColor) ?? _defaultHexColor);

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
    Color color = _generateRandomColor();

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

  static String generateRandomHexColor() {
    final Random random = Random();

    // Генерация случайных значений для красного, зеленого и синего компонентов
    final int red = (random.nextInt(128) + 128); // Диапазон от 128 до 255
    final int green = (random.nextInt(128) + 128); // Диапазон от 128 до 255
    final int blue = (random.nextInt(128) + 128); // Диапазон от 128 до 255

    // Преобразование в шестнадцатеричную строку и добавление префикса '0xFF'
    final int randomColor = (red << 16) | (green << 8) | blue;
    return '0xFF${randomColor.toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }

  static Color _generateRandomColor() {
    final Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
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
