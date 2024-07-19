import 'package:flutter/material.dart';
import 'package:scriby_app/common/utils/formatters/formatters.dart';
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

    final formattedTitle =
        TextFormatter.removeEmptyLinesAfterLastNonEmpty(note.title);
    final formattedText =
        TextFormatter.removeEmptyLinesAfterLastNonEmpty(note.text);
    final textColor = ColorFormatter.getContrastTextColor(note.hexColor);

    // final dateText = TextFormatter.formatDateText(note.date);

    final textScheme = AppTextScheme.of(context);

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Color(int.parse(note.hexColor)),
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
              style: textScheme.headline.copyWith(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
                color: textColor,
              ),
            ),
            if (hasNonEmptyText) const SizedBox(height: 12),
            if (hasNonEmptyText)
              Text(
                formattedText,
                maxLines: _maxTextLines,
                style: textScheme.label.copyWith(
                  fontSize: 16.5,
                  fontWeight: FontWeight.w400,
                  overflow: TextOverflow.ellipsis,
                  color: textColor,
                ),
              ),
            // const SizedBox(height: 12),
            // Text(
            //   dateText,
            //   style: textScheme.label.copyWith(
            //     fontSize: 16,
            //     overflow: TextOverflow.ellipsis,
            //     fontWeight: FontWeight.w400,
            //     color: textColor,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
