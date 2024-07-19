import 'package:intl/intl.dart';

class TextFormatter {
  static String removeLeadingEmptyLines(String text) {
    List<String> lines = text.split('\n');

    while (lines.isNotEmpty && lines.first.trim().isEmpty) {
      lines.removeAt(0);
    }

    return lines.join('\n');
  }

  static String removeEmptyLinesAfterLastNonEmpty(String text) {
    List<String> lines = text.split('\n');

    final int lastNonEmptyIndex =
        lines.lastIndexWhere((line) => line.trim().isNotEmpty);

    lines = lines.sublist(0, lastNonEmptyIndex + 1);

    return lines.join('\n');
  }

  static String formatDateText(DateTime date) {
    final DateFormat formatter = DateFormat('MMMM d');
    return formatter.format(date);
  }
}
