class TextFormatter {
  static String removeLeadingEmptyLines(String text) {
    List<String> lines = text.split('\n');

    while (lines.isNotEmpty && lines.first.trim().isEmpty) {
      lines.removeAt(0);
    }

    return lines.join('\n');
  }
}
