import 'package:flutter/material.dart';
import 'package:scriby_app/common/utils/utils.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.note,
    this.height = 50,
    this.width = double.infinity,
  });

  final Note note;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _calculateHeight(note),
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
              note.title,
              maxLines: 2,
              style: AppTextScheme.of(context).headline.copyWith(
                    fontSize: 23,
                    overflow: TextOverflow.ellipsis,
                    color: AppColorScheme.of(context).primary,
                  ),
            ),
            const SizedBox(height: 15),
            Text(
              note.text,
              maxLines: 4,
              style: AppTextScheme.of(context).label.copyWith(
                    overflow: TextOverflow.ellipsis,
                    color: AppColorScheme.of(context).primary,
                  ),
            )
          ],
        ),
      ),
    );
  }

  double _calculateHeight(Note note) {
    if (note.text.trim().isEmpty) return 75;
    final int linesQuantity = _countLines(note.text);
    return linesQuantity * 20;
  }

  int _countLines(String text) {
    return text.split('\n').length;
  }
}
