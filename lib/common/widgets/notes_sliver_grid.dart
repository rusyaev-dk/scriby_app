import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/core/navigation/router.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NotesSliverGrid extends StatefulWidget {
  const NotesSliverGrid({
    super.key,
    required this.notes,
  });

  final List<Note> notes;

  static Widget loading() {
    return const _NotesSliverGridLoading();
  }

  @override
  State<NotesSliverGrid> createState() => _NotesSliverGridState();
}

class _NotesSliverGridState extends State<NotesSliverGrid> {
  List<Note> _prevNotes = [];
  final Map<Note, ValueKey> _noteKeys = {};

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

        if (!_noteKeys.containsKey(note)) {
          _noteKeys[note] = ValueKey(note);
        }

        Widget card = GestureDetector(
          key: _noteKeys[note],
          onTap: () => _openNoteEditor(context, note),
          onLongPress: () => _deleteNote(context, note),
          child: NoteCard(
            key: ValueKey(note),
            note: note,
          ),
        );

        return isNewNote
            ? AnimationConfiguration.staggeredGrid(
                delay: const Duration(milliseconds: 0),
                duration: const Duration(milliseconds: 225),
                position: i,
                columnCount: 2,
                child: FadeInAnimation(
                  curve: Curves.linear,
                  child: card,
                ),
              )
            : card;
      },
      childCount: widget.notes.length,
    );
  }

  Future<void> _deleteNote(
    BuildContext context,
    Note note,
  ) async {
    final Completer completer = Completer();
    BlocProvider.of<NotesManagerBloc>(context).add(
      DeleteNoteEvent(
        note: note,
        completer: completer,
      ),
    );

    await completer.future;
  }

  void _openNoteEditor(
    BuildContext context,
    Note note,
  ) {
    AutoRouter.of(context).push(EditNoteRoute(initialNoteToEdit: note));
  }
}

class _NotesSliverGridLoading extends StatefulWidget {
  const _NotesSliverGridLoading();

  @override
  State<_NotesSliverGridLoading> createState() =>
      _NotesSliverGridLoadingState();
}

class _NotesSliverGridLoadingState extends State<_NotesSliverGridLoading>
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
