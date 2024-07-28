import 'package:flutter/material.dart';

abstract class NoteColors {
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
    Color(0xFFFFC1CC),
    Color(0xFFEDCC8B),
    Color(0xFFFCE883),
    Color(0xFFBADBAD),
    Color(0xFF9194E2),
    Color(0xFFDCD0FF),
    Color(0xFF7FC7FF),
    Color(0xFFAFDAFC),
  ];

  static const _defaultHexColor = 0xFFABCD;

  static get noteHexColors => _noteHexColors;
  static get noteColors => _noteColors;
  static get defaultHexColor => _defaultHexColor;
}
