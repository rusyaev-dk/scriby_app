import 'dart:math';

import 'package:flutter/material.dart';

class RandomGradientGenerator {
  static LinearGradient generateRandomGradient() {
    Color color = _generateRandomColor();

    return LinearGradient(
      colors: [
        color,
        color.withOpacity(0.5),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: const [1.0, 0.0],
    );
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
}
