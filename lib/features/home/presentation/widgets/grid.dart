import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/uikit/uikit.dart';

class MyNotesGrid extends StatelessWidget {
  const MyNotesGrid({
    super.key,
    required this.notes,
  });

  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemBuilder: (context, i) {
        final Note note = notes[i];
        return NoteCard(
          note: note,
          key: ValueKey(note),
        );
      },
      childCount: notes.length,
    );
  }
}
