import 'dart:async';
import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/core/navigation/navigation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({super.key, required this.notes});

  final List<Note> notes;

  static Widget loading() {
    return const _NotesGridLoading();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: notes.length,
      cacheExtent: 350,
      physics: const ClampingScrollPhysics(),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemBuilder: (context, i) {
        final Note note = notes[i];

        Widget card = GestureDetector(
          key: ValueKey(note),
          onTap: () => _openNoteEditor(context, note),
          onLongPress: () => _deleteNote(context, note),
          child: NoteCard(
            note: note,
          ),
        );

        return AnimationConfiguration.staggeredGrid(
          delay: const Duration(milliseconds: 0),
          duration: const Duration(milliseconds: 225),
          position: i,
          columnCount: 2,
          child: FadeInAnimation(
            curve: Curves.linear,
            child: card,
          ),
        );
      },
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

class _NotesGridLoading extends StatefulWidget {
  const _NotesGridLoading();

  @override
  State<_NotesGridLoading> createState() => _NotesGridLoadingState();
}

class _NotesGridLoadingState extends State<_NotesGridLoading>
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

    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: 10,
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
