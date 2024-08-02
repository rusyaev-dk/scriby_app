import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NotesSliverGrid extends StatelessWidget {
  const NotesSliverGrid({
    super.key,
    required this.notes,
    required this.onCardPressed,
  });

  final List<Note> notes;
  final void Function(BuildContext context, Note note) onCardPressed;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: SliverMasonryGrid.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, i) {
          final Note note = notes[i];
          return AnimationConfiguration.staggeredGrid(
            delay: const Duration(milliseconds: 120),
            position: i,
            columnCount: 2,
            child: FadeInAnimation(
              key: ValueKey(note),
              curve: Curves.linear,
              duration: const Duration(milliseconds: 500), // 450
              child: GestureDetector(
                onDoubleTap: () => onCardPressed(context, note),
                child: NoteCard(
                  note: note,
                  key: ValueKey(note),
                ),
              ),
            ),
          );
        },
        childCount: notes.length,
      ),
    );
  }
}
