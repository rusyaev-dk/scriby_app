import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/pinned_notes/presentation/presentation.dart';

@RoutePage(name: "PinnedNotesTabRoute")
class PinnedNotesTab extends StatelessWidget {
  const PinnedNotesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinnedNotesBloc, PinnedNotesState>(
      key: const PageStorageKey<String>("Tab2"),
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            if (state is PinnedNotesLoadedState)
              if (state.notes.isEmpty)
                const NoPinnedNotesWidget()
              else
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 13,
                    right: 13,
                    bottom: 10,
                  ),
                  sliver: NotesSliverGrid(
                    key: ValueKey(state.notes.length),
                    notes: state.notes,
                    onCardPressed: _onDeleteNote,
                  ),
                )
            else if (state is PinnedNotesLoadingState)
              const SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                ),
              )
          ],
        );
      },
    );
  }

  Future<void> _onDeleteNote(
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
}
