import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scriby_app/common/widgets/widgets.dart';
import 'package:scriby_app/core/blocs/blocs.dart';
import 'package:scriby_app/core/domain/domain.dart';
import 'package:scriby_app/features/all_notes/presentation/presentation.dart';

@RoutePage(name: "AllNotesTabRoute")
class AllNotesTab extends StatelessWidget {
  const AllNotesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllNotesBloc, AllNotesState>(
      builder: (context, state) {
        print(
            "AllNotesBloc: ________ ${state.toString().substring(0, 20)} BUILDING");
        return CustomScrollView(
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
                  sliver: NotesSliverGrid(
                    key: ValueKey(state.notes.length),
                    notes: state.notes,
                    onCardPressed: _onDeleteNote,
                  ),
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
