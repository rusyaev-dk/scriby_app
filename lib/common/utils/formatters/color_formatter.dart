import 'dart:math';

import 'package:flutter/material.dart';

class ColorFormatter {
  static const _defaultHexColor = 0xFFABCD;

  static const List<int> _noteHexColors = [
    0xFFE4717A,
    0xFFFFB28B,
    0xFFFCE883,
    0xFFBADBAD,
    0xFFAFDAFC,
    0xFFEDCC8B,
    0xFF9194E2,
    0xFFFFC1CC,
    0xFF7FC7FF,
    0xFFDCD0FF,
  ];

  static const List<Color> _noteColors = [
    Color(0xFFE4717A),
    Color(0xFFFFB28B),
    Color(0xFFFCE883),
    Color(0xFFBADBAD),
    Color(0xFFAFDAFC),
    Color(0xFFEDCC8B),
    Color(0xFF9194E2),
    Color(0xFFFFC1CC),
    Color(0xFF7FC7FF),
    Color(0xFFDCD0FF),
  ];

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

    final index = random.nextInt(_noteHexColors.length);
    return _noteHexColors[index].toString();
  }

  static Color _getRandomColor() {
    final Random random = Random();

    final index = random.nextInt(_noteHexColors.length);
    return _noteColors[index];
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
