import 'dart:math';

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

class NotesSliverGridLoading extends StatefulWidget {
  const NotesSliverGridLoading({super.key});

  @override
  State<NotesSliverGridLoading> createState() => _NotesSliverGridLoadingState();
}

class _NotesSliverGridLoadingState extends State<NotesSliverGridLoading>
    with SingleTickerProviderStateMixin {
  static Random random = Random();
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = AppColorScheme.of(context);

    Color? beginColor = colorScheme.primary.withOpacity(0.05);
    Color? endColor = colorScheme.primary.withOpacity(0.25);

    _colorAnimation = ColorTween(
      begin: beginColor,
      end: endColor,
    ).animate(_animationController);

    return SliverMasonryGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      childCount: 10,
      itemBuilder: (context, i) {
        final double height = 80 + random.nextDouble() * 200;
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Container(
              height: height,
              decoration: BoxDecoration(
                color: _colorAnimation.value,
                borderRadius: BorderRadius.circular(20),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
