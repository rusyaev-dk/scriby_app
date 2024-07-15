import 'dart:math';

import 'package:flutter/material.dart';

class ColorFormatter {
  static const _defaultColorHex = 0xFFABCD;

  static Color getContrastTextColor(String backgroundColorHex) {
    final Color backgroundColor =
        Color(int.tryParse(backgroundColorHex) ?? _defaultColorHex);

    // Расчет яркости цвета по формуле WCAG
    double brightness = ((backgroundColor.red * 299) +
            (backgroundColor.green * 587) +
            (backgroundColor.blue * 114)) /
        1000;

    // Если яркость выше 128, выбираем черный цвет, иначе белый
    return brightness > 128 ? Colors.black : Colors.white;
  }

  static LinearGradient generateGradientFromColorHex(String colorHex) {
    final Color color = Color(int.tryParse(colorHex) ?? _defaultColorHex);

    return LinearGradient(
      colors: [
        color,
        _adjustBrightness(color, 0.9),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
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
      stops: const [1.0, 0.0],
    );
  }

  static String generateRandomColorHex() {
    final Random random = Random();

    // Генерация случайного числа в диапазоне 0x000000 - 0xFFFFFF
    final int randomColor = random.nextInt(0xFFFFFF + 1);

    // Преобразование в шестнадцатеричную строку и добавление префикса '0xFF'
    return '0xFF${randomColor.toRadixString(16).padLeft(6, '0').toUpperCase()}';
  }

  static Color _generateRandomColor() {
    Random random = Random();
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
