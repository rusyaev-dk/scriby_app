import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/domain/entity/note.dart';
import 'package:scriby_app/features/home/presentation/presentation.dart';
import 'package:scriby_app/uikit/uikit.dart';

class AllNotesGridView extends StatelessWidget {
  const AllNotesGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesBloc, AllNotesState>(
      builder: (context, state) {
        return DisableScrollStretching(
          child: CustomScrollView(
            slivers: [
              if (state is AllNotesLoadedState)
                if (state.notes.isEmpty)
                  const NoNotesWidget()
                else
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      left: 13,
                      right: 13,
                      top: 10,
                      bottom: 10,
                    ),
                    sliver: _AllNotesSliverGrid(notes: state.notes),
                  )
              else if (state is AllNotesLoadingState)
                const SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}

class _AllNotesSliverGrid extends StatelessWidget {
  const _AllNotesSliverGrid({
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
        return GestureDetector(
          onDoubleTap: () => _onDeleteNote(context, note),
          child: NoteCard(
            note: note,
            key: ValueKey(note),
          ),
        );
      },
      childCount: notes.length,
    );
  }

  Future<void> _onDeleteNote(
    BuildContext context,
    Note note,
  ) async {
    final Completer completer = Completer();
    BlocProvider.of<AllNotesBloc>(context).add(
      DeleteNoteEvent(
        note: note,
        completer: completer,
      ),
    );

    await completer.future;
  }
}
