import 'package:flutter/material.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    this.height,
    this.width = double.infinity,
  });

  final Note note;
  final double? height;
  final double width;

  static const _maxTitleLines = 3;
  static const _maxTextLines = 9;

  @override
  Widget build(BuildContext context) {
    final bool hasNonEmptyText = note.text.trim().isNotEmpty;

    final formattedTitle = _removeEmptyLinesAfterLastNonEmpty(note.title);
    final formattedText = _removeEmptyLinesAfterLastNonEmpty(note.text);

    return Container(
      width: width,
      decoration: BoxDecoration(
        gradient: RandomGradientGenerator.generateRandomGradient(),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              formattedTitle,
              maxLines: _maxTitleLines,
              style: AppTextScheme.of(context).headline.copyWith(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    color: AppColorScheme.of(context).primary,
                  ),
            ),
            if (hasNonEmptyText) const SizedBox(height: 15),
            if (hasNonEmptyText)
              Text(
                formattedText,
                maxLines: _maxTextLines,
                style: AppTextScheme.of(context).label.copyWith(
                      fontSize: 18,
                      overflow: TextOverflow.ellipsis,
                      color: AppColorScheme.of(context).primary,
                    ),
              )
          ],
        ),
      ),
    );
  }

  String _removeEmptyLinesAfterLastNonEmpty(String text) {
    List<String> lines = text.split('\n');

    final int lastNonEmptyIndex =
        lines.lastIndexWhere((line) => line.trim().isNotEmpty);

    lines = lines.sublist(0, lastNonEmptyIndex + 1);

    return lines.join('\n');
  }
}
