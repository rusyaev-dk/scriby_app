import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NotesSliverGrid extends StatefulWidget {
  const NotesSliverGrid({
    super.key,
    required this.notes,
    required this.onCardPressed,
  });

  final List<Note> notes;
  final void Function(BuildContext context, Note note) onCardPressed;

  @override
  State<NotesSliverGrid> createState() => _NotesSliverGridState();
}

class _NotesSliverGridState extends State<NotesSliverGrid> {
  List<Note> _prevNotes = [];

  @override
  void didUpdateWidget(covariant NotesSliverGrid oldWidget) {
    super.didUpdateWidget(oldWidget);
    _prevNotes = oldWidget.notes;
  }

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, i) {
        final Note note = widget.notes[i];
        final bool isNewNote = !_prevNotes.contains(note);

        return isNewNote
            ? AnimationConfiguration.staggeredGrid(
                delay: const Duration(milliseconds: 0),
                duration: const Duration(milliseconds: 225),
                position: i,
                columnCount: 2,
                child: FadeInAnimation(
                  curve: Curves.linear,
                  child: GestureDetector(
                    onDoubleTap: () => widget.onCardPressed(context, note),
                    child: NoteCard(
                      note: note,
                      key: ValueKey(note),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onDoubleTap: () => widget.onCardPressed(context, note),
                child: NoteCard(
                  key: ValueKey(note),
                  note: note,
                ),
              );
      },
      childCount: widget.notes.length,
    );
  }
}
